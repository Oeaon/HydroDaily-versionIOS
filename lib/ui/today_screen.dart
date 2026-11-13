import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/hydro_store.dart';
import '../l10n/app_localizations.dart';
import 'common.dart';

const quickAmountsMl = [150, 250, 330, 500];

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key, required this.store, required this.onAddWater, required this.onUndo, required this.onSetUpProfile});

  final HydroStore store;
  final ValueChanged<int> onAddWater;
  final VoidCallback onUndo;
  final VoidCallback onSetUpProfile;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store,
      builder: (context, _) => ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          const _Header(),
          const SizedBox(height: 20),
          if (store.profile == null)
            _SetUpProfileCard(onSetUpProfile)
          else ...[
            _ProgressSection(store),
            const SizedBox(height: 20),
            _StreakCard(store),
            const SizedBox(height: 20),
            _StatsRow(store),
            const SizedBox(height: 20),
            _QuickAdd(canUndo: store.todayEntries.isNotEmpty, onAddWater: onAddWater, onUndo: onUndo),
          ],
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final theme = Theme.of(context);
    final date = DateFormat.yMMMMEEEEd(l.localeName).format(DateTime.now());
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        date.isEmpty ? date : date[0].toUpperCase() + date.substring(1),
        style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
      ),
      Text(l.todayTitle, style: theme.textTheme.headlineLarge),
    ]);
  }
}

class _ProgressSection extends StatelessWidget {
  const _ProgressSection(this.store);

  final HydroStore store;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final theme = Theme.of(context);
    final status = store.status;
    return Column(children: [
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 280),
        child: AspectRatio(
          aspectRatio: 1,
          child: WaterProgressRing(
            progress: status.progress,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.water_drop, color: theme.colorScheme.secondary, size: 28),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Text(
                  formatVolume(status.consumedMl, l.localeName),
                  key: ValueKey(status.consumedMl),
                  style: theme.textTheme.displayMedium,
                ),
              ),
              Text(
                l.todayOfGoal(formatVolume(status.goalMl, l.localeName)),
                style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 8),
              DecoratedBox(
                decoration: BoxDecoration(color: theme.colorScheme.primaryContainer, borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    '${status.percent}%',
                    style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onPrimaryContainer),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
      const SizedBox(height: 16),
      Text(
        status.isGoalReached ? l.todayGoalReached : l.todayRemaining(formatVolume(status.remainingMl, l.localeName)),
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: status.isGoalReached ? theme.colorScheme.tertiary : theme.colorScheme.onSurfaceVariant,
        ),
      ),
    ]);
  }
}

class _StreakCard extends StatelessWidget {
  const _StreakCard(this.store);

  final HydroStore store;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final theme = Theme.of(context);
    final streak = store.streak;
    final active = streak.current > 0;
    return Card(
      margin: EdgeInsets.zero,
      color: streak.completedToday ? theme.colorScheme.tertiaryContainer : theme.colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(spacing: 16, children: [
          Opacity(opacity: active ? 1 : 0.4, child: Text('🔥', style: theme.textTheme.headlineMedium)),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(active ? l.streakCurrent(streak.current) : l.streakNone, style: theme.textTheme.titleMedium),
              Text(
                !active
                    ? l.streakStartHint
                    : (streak.completedToday ? l.streakCompletedToday : l.streakKeepHint),
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ]),
          ),
          if (streak.best > 0)
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(l.streakBest, style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
              Text('${streak.best}', style: theme.textTheme.titleLarge),
            ]),
        ]),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow(this.store);

  final HydroStore store;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final status = store.status;
    return Row(spacing: 12, children: [
      Expanded(child: _StatTile(l.statGoal, formatVolume(status.goalMl, l.localeName))),
      Expanded(child: _StatTile(l.statRemaining, formatVolume(status.remainingMl, l.localeName))),
      Expanded(child: _StatTile(l.statEntries, '${status.entriesMl.length}')),
    ]);
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      color: theme.colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          FittedBox(fit: BoxFit.scaleDown, child: Text(value, maxLines: 1, style: theme.textTheme.titleMedium)),
        ]),
      ),
    );
  }
}

class _QuickAdd extends StatelessWidget {
  const _QuickAdd({required this.canUndo, required this.onAddWater, required this.onUndo});

  final bool canUndo;
  final ValueChanged<int> onAddWater;
  final VoidCallback onUndo;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final theme = Theme.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, spacing: 12, children: [
      Row(children: [
        Expanded(child: Text(l.todayAddTitle, style: theme.textTheme.titleLarge)),
        TextButton.icon(onPressed: canUndo ? onUndo : null, icon: const Icon(Icons.undo, size: 18), label: Text(l.todayUndo)),
      ]),
      for (var i = 0; i < quickAmountsMl.length; i += 2)
        Row(spacing: 12, children: [
          for (final amount in quickAmountsMl.sublist(i, i + 2))
            Expanded(child: _QuickAddCard(amount: amount, onTap: () => onAddWater(amount))),
        ]),
    ]);
  }
}

class _QuickAddCard extends StatelessWidget {
  const _QuickAddCard({required this.amount, required this.onTap});

  final int amount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = L.of(context);
    final dropSize = amount <= 150 ? 16.0 : (amount <= 250 ? 19.0 : (amount <= 330 ? 22.0 : 24.0));
    return Card(
      margin: EdgeInsets.zero,
      elevation: 1,
      color: theme.colorScheme.surfaceContainerLowest,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(spacing: 12, children: [
            DecoratedBox(
              decoration: BoxDecoration(color: theme.colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(8)),
              child: SizedBox.square(
                dimension: 44,
                child: Icon(Icons.water_drop, size: dropSize, color: theme.colorScheme.onSecondaryContainer),
              ),
            ),
            Flexible(child: Text('+${formatVolume(amount, l.localeName)}', style: theme.textTheme.titleMedium)),
          ]),
        ),
      ),
    );
  }
}

class _SetUpProfileCard extends StatelessWidget {
  const _SetUpProfileCard(this.onSetUpProfile);

  final VoidCallback onSetUpProfile;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final theme = Theme.of(context);
    final on = theme.colorScheme.onPrimaryContainer;
    return Card(
      margin: EdgeInsets.zero,
      color: theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: 12, children: [
          Icon(Icons.water_drop, size: 40, color: theme.colorScheme.primary),
          Text(l.todayNoProfileTitle, style: theme.textTheme.titleLarge?.copyWith(color: on)),
          Text(l.todayNoProfileBody, style: theme.textTheme.bodyLarge?.copyWith(color: on)),
          FilledButton(onPressed: onSetUpProfile, child: Text(l.todayNoProfileAction)),
        ]),
      ),
    );
  }
}
