import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:in_app_review/in_app_review.dart';

import 'app_info.dart';
import 'core/hydration.dart';
import 'data/hydro_store.dart';
import 'data/reminders.dart';
import 'l10n/app_localizations.dart';
import 'monetization/monetization.dart';
import 'monetization/monetization_ui.dart';
import 'ui/common.dart';
import 'ui/profile_screen.dart';
import 'ui/today_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final monetization = await Monetization.create();
  final store = await HydroStore.open();
  final reminders = Reminders();
  await reminders.init();
  runApp(App(monetization: monetization, store: store, reminders: reminders));
}

class App extends StatelessWidget {
  const App({super.key, required this.monetization, required this.store, required this.reminders});

  final Monetization monetization;
  final HydroStore store;
  final Reminders reminders;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppInfo.name,
      theme: hydroTheme(Brightness.light),
      darkTheme: hydroTheme(Brightness.dark),
      localizationsDelegates: const [
        L.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L.supportedLocales,
      home: Root(monetization: monetization, store: store, reminders: reminders),
    );
  }
}

class Root extends StatefulWidget {
  const Root({super.key, required this.monetization, required this.store, required this.reminders});

  final Monetization monetization;
  final HydroStore store;
  final Reminders reminders;

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> with WidgetsBindingObserver {
  late int _tab = widget.store.profile == null ? 1 : 0;
  final _drop = AudioPlayer();
  final _notificationsBlocked = ValueNotifier(false);

  HydroStore get _store => widget.store;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _drop.setSource(AssetSource('sounds/drop.mp3'));
    _drop.setReleaseMode(ReleaseMode.stop);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // El consentimiento se pide con la primera pantalla ya dibujada.
      widget.monetization.gatherConsent();
      _reschedule();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _drop.dispose();
    _notificationsBlocked.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Al volver puede haber cambiado el día o los permisos.
      _store.refreshDay();
      _reschedule();
    }
  }

  ReminderTexts _texts() {
    final l = L.of(context);
    final status = _store.status;
    final consumed = formatVolume(status.consumedMl, l.localeName);
    final goal = formatVolume(status.goalMl, l.localeName);
    final streak = _store.streak.current;
    final today = status.profile == null
        ? l.notificationBodyNoProfile
        : status.isGoalReached
            ? l.notificationBodyGoalReached
            : streak > 0
                ? l.notificationBodyStreak(consumed, goal, streak)
                : l.notificationBodyProgress(consumed, goal);
    return ReminderTexts(
      title: l.notificationTitle,
      todayBody: today,
      laterBody: status.profile == null ? l.notificationBodyNoProfile : l.notificationBodyGeneric,
      channelName: l.reminderChannelName,
      channelDescription: l.reminderChannelDescription,
    );
  }

  Future<void> _reschedule() async {
    if (!mounted) return;
    final texts = _texts();
    _notificationsBlocked.value = await widget.reminders.areBlocked();
    await widget.reminders.reschedule(_store.reminders, goalReachedToday: _store.status.isGoalReached, texts: texts);
  }

  Future<void> _addWater(int ml) async {
    HapticFeedback.mediumImpact();
    _drop.stop().then((_) => _drop.resume());
    final reachedNow = await _store.addWater(ml);
    await _reschedule();
    if (reachedNow && await _store.claimReviewPrompt(_store.streak.current)) {
      final review = InAppReview.instance;
      if (await review.isAvailable()) review.requestReview();
    }
  }

  Future<void> _undo() async {
    await _store.undoLast();
    await _reschedule();
  }

  Future<void> _saveProfile(double weightKg, Gender gender, ActivityLevel activity) async {
    await _store.saveProfile(weightKg, gender, activity);
    await _reschedule();
    // Guardar el perfil es una pausa natural para un intersticial (con límite de frecuencia).
    widget.monetization.maybeShowInterstitial(() {
      if (mounted) setState(() => _tab = 0);
    });
  }

  Future<void> _changeReminders(ReminderSettings settings) async {
    final enabling = settings.enabled && !_store.reminders.enabled;
    await _store.saveReminders(settings);
    if (enabling || settings.enabled) await widget.reminders.requestPermission();
    await _reschedule();
  }

  void _openPremium() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (_) => PremiumScreen(
        monetization: widget.monetization,
        features: const [],
        privacyUrl: AppInfo.privacyUrl,
        termsUrl: AppInfo.termsUrl,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: IndexedStack(index: _tab, children: [
          TodayScreen(store: _store, onAddWater: _addWater, onUndo: _undo, onSetUpProfile: () => setState(() => _tab = 1)),
          ProfileScreen(
            store: _store,
            monetization: widget.monetization,
            notificationsBlocked: _notificationsBlocked,
            onSaveProfile: _saveProfile,
            onRemindersChanged: _changeReminders,
            onOpenNotificationSettings: () => openUrl('app-settings:'),
            onOpenPremium: _openPremium,
          ),
        ]),
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        AdBanner(monetization: widget.monetization),
        NavigationBar(
          backgroundColor: theme.colorScheme.surfaceContainerLow,
          selectedIndex: _tab,
          onDestinationSelected: (i) => setState(() => _tab = i),
          destinations: [
            NavigationDestination(icon: const Icon(Icons.water_drop_outlined), selectedIcon: const Icon(Icons.water_drop), label: l.navToday),
            NavigationDestination(icon: const Icon(Icons.person_outline), selectedIcon: const Icon(Icons.person), label: l.navProfile),
          ],
        ),
      ]),
    );
  }
}
