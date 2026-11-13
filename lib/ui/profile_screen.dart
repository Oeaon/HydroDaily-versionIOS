import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../app_info.dart';
import '../core/hydration.dart';
import '../data/hydro_store.dart';
import '../l10n/app_localizations.dart';
import '../monetization/monetization.dart';
import '../monetization/monetization_ui.dart';
import 'common.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.store,
    required this.monetization,
    required this.notificationsBlocked,
    required this.onSaveProfile,
    required this.onRemindersChanged,
    required this.onOpenNotificationSettings,
    required this.onOpenPremium,
  });

  final HydroStore store;
  final Monetization monetization;
  final ValueNotifier<bool> notificationsBlocked;
  final Future<void> Function(double weightKg, Gender gender, ActivityLevel activity) onSaveProfile;
  final ValueChanged<ReminderSettings> onRemindersChanged;
  final VoidCallback onOpenNotificationSettings;
  final VoidCallback onOpenPremium;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final theme = Theme.of(context);
    return ListenableBuilder(
      listenable: Listenable.merge([store, monetization, notificationsBlocked]),
      builder: (context, _) => ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          Text(l.profileTitle, style: theme.textTheme.headlineLarge),
          Text(l.profileSubtitle, style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          const SizedBox(height: 20),
          _ProfileForm(profile: store.profile, onSave: onSaveProfile),
          const SizedBox(height: 20),
          _PremiumCard(monetization: monetization, onOpenPremium: onOpenPremium),
          const SizedBox(height: 20),
          _SectionTitle(l.remindersTitle),
          _ReminderCard(
            settings: store.reminders,
            blocked: notificationsBlocked.value,
            onChanged: onRemindersChanged,
            onOpenNotificationSettings: onOpenNotificationSettings,
          ),
          const SizedBox(height: 20),
          _SectionTitle(l.settingsTitle),
          _SettingsCard(monetization: monetization),
          const SizedBox(height: 20),
          Text(l.profileGoalHint, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text, style: Theme.of(context).textTheme.titleLarge),
      );
}

class _ProfileForm extends StatefulWidget {
  const _ProfileForm({required this.profile, required this.onSave});

  final UserProfile? profile;
  final Future<void> Function(double weightKg, Gender gender, ActivityLevel activity) onSave;

  @override
  State<_ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<_ProfileForm> {
  late final _weight = TextEditingController(text: _initialWeight());
  late Gender? _gender = widget.profile?.gender;
  late ActivityLevel? _activity = widget.profile?.activityLevel;
  bool _weightError = false;
  bool _genderError = false;
  bool _activityError = false;

  String _initialWeight() {
    final kg = widget.profile?.weightKg;
    if (kg == null) return '';
    return kg == kg.roundToDouble() ? kg.toInt().toString() : kg.toString();
  }

  @override
  void dispose() {
    _weight.dispose();
    super.dispose();
  }

  double? get _parsedWeight => double.tryParse(_weight.text.trim().replaceAll(',', '.'));

  /// El objetivo guardado se enseña mientras el formulario coincide con el perfil guardado.
  bool get _matchesSaved {
    final p = widget.profile;
    return p != null && _parsedWeight == p.weightKg && _gender == p.gender && _activity == p.activityLevel;
  }

  Future<void> _save() async {
    FocusScope.of(context).unfocus();
    final weight = _parsedWeight;
    setState(() {
      _weightError = !DailyGoal.isValidWeight(weight);
      _genderError = _gender == null;
      _activityError = _activity == null;
    });
    if (_weightError || _genderError || _activityError) return;
    await widget.onSave(weight!, _gender!, _activity!);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final theme = Theme.of(context);
    final saved = widget.profile;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      AnimatedSize(
        duration: const Duration(milliseconds: 250),
        child: saved != null && _matchesSaved
            ? Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Card(
                  margin: EdgeInsets.zero,
                  color: theme.colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(spacing: 16, children: [
                      Icon(Icons.water_drop, size: 36, color: theme.colorScheme.primary),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(l.profileGoalTitle, style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onPrimaryContainer)),
                        Text(
                          formatVolume(saved.dailyGoalMl, l.localeName),
                          style: theme.textTheme.headlineMedium?.copyWith(color: theme.colorScheme.onPrimaryContainer),
                        ),
                      ]),
                    ]),
                  ),
                ),
              )
            : const SizedBox(width: double.infinity),
      ),
      Card(
        margin: EdgeInsets.zero,
        color: theme.colorScheme.surfaceContainerLow,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, spacing: 16, children: [
            TextField(
              controller: _weight,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.done,
              onChanged: (_) => setState(() => _weightError = false),
              decoration: InputDecoration(
                labelText: l.profileWeightLabel,
                suffixText: 'kg',
                border: const OutlineInputBorder(),
                errorText: _weightError ? l.profileWeightError : null,
              ),
            ),
            _ChoiceSection<Gender>(
              title: l.profileGenderLabel,
              options: [(Gender.female, l.genderFemale), (Gender.male, l.genderMale)],
              selected: _gender,
              error: _genderError ? l.profileGenderError : null,
              onSelected: (g) => setState(() {
                _gender = g;
                _genderError = false;
              }),
            ),
            _ChoiceSection<ActivityLevel>(
              title: l.profileActivityLabel,
              options: [
                (ActivityLevel.low, l.activityLow),
                (ActivityLevel.moderate, l.activityModerate),
                (ActivityLevel.high, l.activityHigh),
              ],
              selected: _activity,
              error: _activityError ? l.profileActivityError : null,
              onSelected: (a) => setState(() {
                _activity = a;
                _activityError = false;
              }),
            ),
            if (_activity != null)
              Text(
                switch (_activity!) {
                  ActivityLevel.low => l.activityLowDesc,
                  ActivityLevel.moderate => l.activityModerateDesc,
                  ActivityLevel.high => l.activityHighDesc,
                },
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            SizedBox(
              height: 56,
              child: FilledButton(onPressed: _save, child: Text(l.profileCalculate, style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onPrimary))),
            ),
          ]),
        ),
      ),
    ]);
  }
}

class _ChoiceSection<T> extends StatelessWidget {
  const _ChoiceSection({required this.title, required this.options, required this.selected, required this.error, required this.onSelected});

  final String title;
  final List<(T, String)> options;
  final T? selected;
  final String? error;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: 8, children: [
      Text(title, style: theme.textTheme.titleSmall),
      Wrap(spacing: 8, runSpacing: 8, children: [
        for (final (value, label) in options)
          ChoiceChip(label: Text(label), selected: value == selected, onSelected: (_) => onSelected(value)),
      ]),
      if (error != null) Text(error!, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.error)),
    ]);
  }
}

class _PremiumCard extends StatelessWidget {
  const _PremiumCard({required this.monetization, required this.onOpenPremium});

  final Monetization monetization;
  final VoidCallback onOpenPremium;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final theme = Theme.of(context);
    final premium = monetization.isPremium;
    return Card(
      margin: EdgeInsets.zero,
      color: premium ? theme.colorScheme.tertiaryContainer : theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: 8, children: [
          Row(spacing: 8, children: [
            const Icon(Icons.star),
            Text(l.premiumTitle, style: theme.textTheme.titleMedium),
          ]),
          Text(premium ? l.premiumActive : l.premiumDesc, style: theme.textTheme.bodyMedium),
          if (premium)
            TextButton(
              onPressed: () => openUrl('https://apps.apple.com/account/subscriptions'),
              child: Text(l.premiumManageSubscription),
            )
          else
            FilledButton(onPressed: onOpenPremium, child: Text(l.premiumHeadline)),
        ]),
      ),
    );
  }
}

class _ReminderCard extends StatelessWidget {
  const _ReminderCard({required this.settings, required this.blocked, required this.onChanged, required this.onOpenNotificationSettings});

  final ReminderSettings settings;
  final bool blocked;
  final ValueChanged<ReminderSettings> onChanged;
  final VoidCallback onOpenNotificationSettings;

  Future<void> _pickTime(BuildContext context, TimeOfDayMinutes current, ValueChanged<TimeOfDayMinutes> onPicked) async {
    final picked = await showTimePicker(context: context, initialTime: TimeOfDay(hour: current.hour, minute: current.minute));
    if (picked != null) onPicked(TimeOfDayMinutes.hm(picked.hour, picked.minute));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final theme = Theme.of(context);
    final divider = Divider(height: 1, color: theme.colorScheme.outlineVariant);
    return Card(
      margin: EdgeInsets.zero,
      color: theme.colorScheme.surfaceContainerLow,
      clipBehavior: Clip.antiAlias,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        SwitchListTile(
          value: settings.enabled,
          onChanged: (v) => onChanged(settings.copyWith(enabled: v)),
          title: Text(l.settingsReminders),
          subtitle: Text(reminderSummary(context, settings)),
        ),
        if (settings.enabled && blocked)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(children: [
              Expanded(child: Text(l.settingsNotificationsBlocked, style: TextStyle(color: theme.colorScheme.error))),
              TextButton(onPressed: onOpenNotificationSettings, child: Text(l.settingsEnable)),
            ]),
          ),
        if (settings.enabled) ...[
          divider,
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, spacing: 12, children: [
              DropdownButtonFormField<ReminderFrequency>(
                initialValue: settings.frequency,
                decoration: InputDecoration(labelText: l.reminderFrequency, border: const OutlineInputBorder()),
                items: [
                  for (final f in ReminderFrequency.values) DropdownMenuItem(value: f, child: Text(frequencyLabel(l, f))),
                ],
                onChanged: (f) {
                  if (f != null) onChanged(settings.copyWith(frequency: f));
                },
              ),
              if (settings.frequency == ReminderFrequency.once)
                _TimeRow(
                  label: l.reminderTime,
                  value: formatTime(context, settings.start),
                  onTap: () => _pickTime(context, settings.start, (t) => onChanged(settings.copyWith(start: t))),
                )
              else ...[
                _TimeRow(
                  label: l.reminderFrom,
                  value: formatTime(context, settings.start),
                  onTap: () => _pickTime(context, settings.start, (t) => onChanged(settings.copyWith(start: t))),
                ),
                _TimeRow(
                  label: l.reminderUntil,
                  value: formatTime(context, settings.end),
                  onTap: () => _pickTime(context, settings.end, (t) => onChanged(settings.copyWith(end: t))),
                ),
              ],
              Text(l.reminderDays, style: theme.textTheme.titleSmall),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                for (final day in orderedWeekdays(context))
                  _DayToggle(
                    label: weekdayNarrow(l.localeName, day),
                    tooltip: DateFormat.EEEE(l.localeName).format(DateTime(2024, 1, day)),
                    selected: settings.days.contains(day),
                    onTap: () => onChanged(settings.copyWith(
                      days: settings.days.contains(day) ? ({...settings.days}..remove(day)) : {...settings.days, day},
                    )),
                  ),
              ]),
            ]),
          ),
          divider,
          SwitchListTile(
            value: settings.skipWhenGoalReached,
            onChanged: (v) => onChanged(settings.copyWith(skipWhenGoalReached: v)),
            title: Text(l.reminderSkipWhenReached),
            subtitle: Text(l.reminderSkipWhenReachedDesc),
          ),
        ],
      ]),
    );
  }
}

class _TimeRow extends StatelessWidget {
  const _TimeRow({required this.label, required this.value, required this.onTap});

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Row(children: [
        Expanded(child: Text(label, style: Theme.of(context).textTheme.bodyLarge)),
        OutlinedButton(onPressed: onTap, child: Text(value)),
      ]);
}

class _DayToggle extends StatelessWidget {
  const _DayToggle({required this.label, required this.tooltip, required this.selected, required this.onTap});

  final String label;
  final String tooltip;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Tooltip(
      message: tooltip,
      child: Semantics(
        selected: selected,
        button: true,
        child: Material(
          color: selected ? scheme.primary : Colors.transparent,
          shape: CircleBorder(side: BorderSide(color: selected ? scheme.primary : scheme.outline)),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: SizedBox.square(
              dimension: 38,
              child: Center(child: Text(label, style: TextStyle(color: selected ? scheme.onPrimary : scheme.onSurface))),
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.monetization});

  final Monetization monetization;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final theme = Theme.of(context);
    final divider = Divider(height: 1, color: theme.colorScheme.outlineVariant);
    return Card(
      margin: EdgeInsets.zero,
      color: theme.colorScheme.surfaceContainerLow,
      clipBehavior: Clip.antiAlias,
      child: Column(children: [
        if (monetization.privacyOptionsRequired) ...[
          ListTile(title: Text(l.settingsPrivacy), onTap: monetization.showPrivacyOptions),
          divider,
        ],
        ListTile(title: Text(l.settingsPrivacyPolicy), trailing: const Icon(Icons.open_in_new, size: 18), onTap: () => openUrl(AppInfo.privacyUrl)),
        divider,
        ListTile(title: Text(l.termsOfUse), trailing: const Icon(Icons.open_in_new, size: 18), onTap: () => openUrl(AppInfo.termsUrl)),
      ]),
    );
  }
}
