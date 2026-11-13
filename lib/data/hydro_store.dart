import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/hydration.dart';

/// Perfil, agua de hoy, días con el objetivo cumplido y ajustes de recordatorios, guardados en el móvil.
class HydroStore extends ChangeNotifier {
  HydroStore._(this._prefs, this._now) {
    _load();
  }

  static Future<HydroStore> open({DateTime Function()? now}) async =>
      HydroStore._(await SharedPreferences.getInstance(), now ?? DateTime.now);

  final SharedPreferences _prefs;
  final DateTime Function() _now;

  UserProfile? profile;
  late ReminderSettings reminders;
  late Set<DateTime> goalDays;
  DateTime? lastReviewPrompt;

  /// Día al que corresponden [_entries]; al cambiar de día se empieza de cero.
  late String _entriesDay;
  late List<int> _entries;

  static const _kProfile = 'profile';
  static const _kEntriesDay = 'entries_day';
  static const _kEntries = 'entries_ml';
  static const _kGoalDays = 'goal_days';
  static const _kReminders = 'reminders';
  static const _kLastReview = 'last_review_prompt';

  void _load() {
    profile = _decodeProfile(_prefs.getString(_kProfile));
    reminders = _decodeReminders(_prefs.getString(_kReminders));
    goalDays = {for (final k in _prefs.getStringList(_kGoalDays) ?? const <String>[]) ?parseDayKey(k)};
    lastReviewPrompt = parseDayKey(_prefs.getString(_kLastReview) ?? '');
    _entriesDay = _prefs.getString(_kEntriesDay) ?? dayKey(_now());
    _entries = (_prefs.getStringList(_kEntries) ?? const []).map(int.tryParse).whereType<int>().toList();
  }

  /// Lo bebido hoy. Si ha cambiado el día desde el último registro, hoy aún no hay nada.
  List<int> get todayEntries => _entriesDay == dayKey(_now()) ? List.unmodifiable(_entries) : const [];

  HydrationStatus get status => HydrationStatus(profile: profile, entriesMl: todayEntries);

  Streak get streak => StreakCalculator.calculate(goalDays, _now());

  /// Llamar al volver a la app: si ha cambiado el día, la pantalla se pone a cero.
  void refreshDay() => notifyListeners();

  /// Devuelve true si con este vaso se acaba de cumplir el objetivo de hoy.
  Future<bool> addWater(int ml) async {
    final today = dayKey(_now());
    if (_entriesDay != today) {
      _entriesDay = today;
      _entries = [];
    }
    _entries = [..._entries, ml];
    final reachedNow = await _saveTodayAndGoal();
    notifyListeners();
    return reachedNow;
  }

  Future<void> undoLast() async {
    if (todayEntries.isEmpty) return;
    _entries = _entries.sublist(0, _entries.length - 1);
    await _saveTodayAndGoal();
    notifyListeners();
  }

  /// Guarda lo de hoy y apunta o borra el día en el historial de objetivos cumplidos.
  Future<bool> _saveTodayAndGoal() async {
    await _prefs.setString(_kEntriesDay, _entriesDay);
    await _prefs.setStringList(_kEntries, _entries.map((e) => '$e').toList());
    return _updateGoalHistory();
  }

  Future<bool> _updateGoalHistory() async {
    final today = dayOf(_now());
    final reached = status.isGoalReached;
    final was = goalDays.contains(today);
    if (reached != was) {
      goalDays = reached ? {...goalDays, today} : ({...goalDays}..remove(today));
      await _prefs.setStringList(_kGoalDays, goalDays.map(dayKey).toList()..sort());
    }
    return reached && !was;
  }

  Future<UserProfile> saveProfile(double weightKg, Gender gender, ActivityLevel activity) async {
    final saved = UserProfile(
      weightKg: weightKg,
      gender: gender,
      activityLevel: activity,
      dailyGoalMl: DailyGoal.calculate(weightKg, gender, activity),
    );
    profile = saved;
    await _prefs.setString(_kProfile, '${saved.weightKg}|${saved.gender.name}|${saved.activityLevel.name}|${saved.dailyGoalMl}');
    await _updateGoalHistory();
    notifyListeners();
    return saved;
  }

  Future<void> saveReminders(ReminderSettings settings) async {
    reminders = settings;
    notifyListeners();
    await _prefs.setString(
      _kReminders,
      [
        settings.enabled,
        settings.start.minutes,
        settings.end.minutes,
        settings.frequency.name,
        (settings.days.toList()..sort()).join(','),
        settings.skipWhenGoalReached,
      ].join('|'),
    );
  }

  /// Devuelve true si toca pedir una valoración ahora (y lo apunta para no repetirla pronto).
  Future<bool> claimReviewPrompt(int streakDays) async {
    final today = _now();
    if (!ReviewPrompt.shouldAsk(streakDays: streakDays, today: today, lastPrompt: lastReviewPrompt)) return false;
    lastReviewPrompt = dayOf(today);
    await _prefs.setString(_kLastReview, dayKey(today));
    return true;
  }

  static UserProfile? _decodeProfile(String? raw) {
    final parts = raw?.split('|');
    if (parts == null || parts.length != 4) return null;
    final weight = double.tryParse(parts[0]);
    final gender = Gender.values.where((g) => g.name == parts[1]).firstOrNull;
    final activity = ActivityLevel.values.where((a) => a.name == parts[2]).firstOrNull;
    final goal = int.tryParse(parts[3]);
    if (weight == null || gender == null || activity == null || goal == null) return null;
    return UserProfile(weightKg: weight, gender: gender, activityLevel: activity, dailyGoalMl: goal);
  }

  static ReminderSettings _decodeReminders(String? raw) {
    final parts = raw?.split('|');
    if (parts == null || parts.length != 6) return const ReminderSettings();
    return ReminderSettings(
      enabled: parts[0] == 'true',
      start: TimeOfDayMinutes(int.tryParse(parts[1]) ?? 12 * 60),
      end: TimeOfDayMinutes(int.tryParse(parts[2]) ?? 21 * 60),
      frequency: ReminderFrequency.values.where((f) => f.name == parts[3]).firstOrNull ?? ReminderFrequency.once,
      days: {for (final d in parts[4].split(',')) ?int.tryParse(d)},
      skipWhenGoalReached: parts[5] == 'true',
    );
  }
}
