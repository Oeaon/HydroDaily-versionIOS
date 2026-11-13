import 'dart:math';

enum Gender { female, male }

enum ActivityLevel { low, moderate, high }

class UserProfile {
  const UserProfile({required this.weightKg, required this.gender, required this.activityLevel, required this.dailyGoalMl});

  final double weightKg;
  final Gender gender;
  final ActivityLevel activityLevel;
  final int dailyGoalMl;
}

/// Objetivo orientativo: 35 ml por kilo, +500 ml en hombres y +500/1000 ml según la actividad, redondeado a 50 ml.
class DailyGoal {
  DailyGoal._();

  static const minWeightKg = 20.0;
  static const maxWeightKg = 300.0;

  static bool isValidWeight(double? kg) => kg != null && kg >= minWeightKg && kg <= maxWeightKg;

  static int calculate(double weightKg, Gender gender, ActivityLevel activity) {
    final total = weightKg * 35 +
        (gender == Gender.male ? 500 : 0) +
        switch (activity) {
          ActivityLevel.low => 0,
          ActivityLevel.moderate => 500,
          ActivityLevel.high => 1000,
        };
    return (total / 50).round() * 50;
  }
}

/// Lo bebido hoy frente al objetivo.
class HydrationStatus {
  const HydrationStatus({required this.profile, required this.entriesMl});

  final UserProfile? profile;
  final List<int> entriesMl;

  int get consumedMl => entriesMl.fold(0, (a, b) => a + b);
  int get goalMl => profile?.dailyGoalMl ?? 0;
  double get progress => goalMl == 0 ? 0 : (consumedMl / goalMl).clamp(0, 1).toDouble();
  int get remainingMl => max(goalMl - consumedMl, 0);
  bool get isGoalReached => goalMl > 0 && consumedMl >= goalMl;
  int get percent => goalMl == 0 ? 0 : consumedMl * 100 ~/ goalMl;
}

/// Día sin hora, en UTC para que sumar días no dependa del cambio de hora.
DateTime dayOf(DateTime d) => DateTime.utc(d.year, d.month, d.day);

String dayKey(DateTime d) {
  final day = dayOf(d);
  return '${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';
}

DateTime? parseDayKey(String key) {
  final parsed = DateTime.tryParse(key);
  return parsed == null ? null : dayOf(parsed);
}

class Streak {
  const Streak({this.current = 0, this.best = 0, this.completedToday = false});

  final int current;
  final int best;
  final bool completedToday;
}

/// Días seguidos cumpliendo el objetivo. La racha sigue viva si se cumplió hoy o ayer.
class StreakCalculator {
  StreakCalculator._();

  static Streak calculate(Set<DateTime> goalDays, DateTime today) {
    final days = goalDays.map(dayOf).toSet();
    final t = dayOf(today);
    final yesterday = t.subtract(const Duration(days: 1));
    final anchor = days.contains(t) ? t : (days.contains(yesterday) ? yesterday : null);
    var current = 0;
    if (anchor != null) {
      for (var d = anchor; days.contains(d); d = d.subtract(const Duration(days: 1))) {
        current++;
      }
    }
    return Streak(current: current, best: max(_bestRun(days), current), completedToday: days.contains(t));
  }

  static int _bestRun(Set<DateTime> days) {
    var best = 0;
    var run = 0;
    DateTime? previous;
    for (final day in days.toList()..sort()) {
      run = previous != null && previous.add(const Duration(days: 1)) == day ? run + 1 : 1;
      best = max(best, run);
      previous = day;
    }
    return best;
  }
}

/// Pedir valoración al cumplir el objetivo con una racha de 3 días o más, como mucho cada 60 días.
class ReviewPrompt {
  ReviewPrompt._();

  static const minStreakDays = 3;
  static const daysBetweenPrompts = 60;

  static bool shouldAsk({required int streakDays, required DateTime today, DateTime? lastPrompt}) {
    if (streakDays < minStreakDays) return false;
    if (lastPrompt == null) return true;
    return !dayOf(today).isBefore(dayOf(lastPrompt).add(const Duration(days: daysBetweenPrompts)));
  }
}

/// Hora del día en minutos desde medianoche.
class TimeOfDayMinutes {
  const TimeOfDayMinutes(this.minutes);

  const TimeOfDayMinutes.hm(int hour, int minute) : minutes = hour * 60 + minute;

  final int minutes;

  int get hour => minutes ~/ 60;
  int get minute => minutes % 60;

  @override
  bool operator ==(Object other) => other is TimeOfDayMinutes && other.minutes == minutes;

  @override
  int get hashCode => minutes.hashCode;
}

enum ReminderFrequency {
  once(null),
  everyHour(60),
  every90Minutes(90),
  every2Hours(120),
  every3Hours(180),
  every4Hours(240);

  const ReminderFrequency(this.intervalMinutes);

  final int? intervalMinutes;
}

class ReminderSettings {
  const ReminderSettings({
    this.enabled = true,
    this.start = const TimeOfDayMinutes.hm(12, 0),
    this.end = const TimeOfDayMinutes.hm(21, 0),
    this.frequency = ReminderFrequency.once,
    this.days = const {1, 2, 3, 4, 5, 6, 7},
    this.skipWhenGoalReached = false,
  });

  final bool enabled;
  final TimeOfDayMinutes start;
  final TimeOfDayMinutes end;
  final ReminderFrequency frequency;

  /// Días de la semana con [DateTime.weekday]: 1 = lunes … 7 = domingo.
  final Set<int> days;
  final bool skipWhenGoalReached;

  ReminderSettings copyWith({
    bool? enabled,
    TimeOfDayMinutes? start,
    TimeOfDayMinutes? end,
    ReminderFrequency? frequency,
    Set<int>? days,
    bool? skipWhenGoalReached,
  }) =>
      ReminderSettings(
        enabled: enabled ?? this.enabled,
        start: start ?? this.start,
        end: end ?? this.end,
        frequency: frequency ?? this.frequency,
        days: days ?? this.days,
        skipWhenGoalReached: skipWhenGoalReached ?? this.skipWhenGoalReached,
      );

  /// Horas de aviso de un día: la de inicio y, si hay frecuencia, cada intervalo hasta la de fin.
  List<TimeOfDayMinutes> timesOfDay() {
    final interval = frequency.intervalMinutes;
    if (interval == null) return [start];
    final times = [for (var m = start.minutes; m <= end.minutes; m += interval) TimeOfDayMinutes(m)];
    return times.isEmpty ? [start] : times;
  }

  /// Próximos avisos a partir de [now], como máximo [limit] (iOS no admite más de 64 pendientes).
  /// Si [goalReachedToday] y se silencian al cumplir el objetivo, hoy no hay más avisos.
  List<DateTime> upcoming(DateTime now, {required bool goalReachedToday, int limit = 60, int maxDays = 60}) {
    if (!enabled || days.isEmpty) return const [];
    final result = <DateTime>[];
    for (var offset = 0; offset < maxDays && result.length < limit; offset++) {
      final date = DateTime(now.year, now.month, now.day + offset);
      if (!days.contains(date.weekday)) continue;
      if (offset == 0 && skipWhenGoalReached && goalReachedToday) continue;
      for (final time in timesOfDay()) {
        final at = DateTime(date.year, date.month, date.day, time.hour, time.minute);
        if (at.isAfter(now)) result.add(at);
        if (result.length == limit) break;
      }
    }
    return result;
  }
}
