import 'package:flutter_test/flutter_test.dart';
import 'package:hydrodaily/core/hydration.dart';

void main() {
  group('objetivo diario', () {
    test('35 ml por kilo redondeado a 50 ml', () {
      expect(DailyGoal.calculate(60, Gender.female, ActivityLevel.low), 2100);
      expect(DailyGoal.calculate(61, Gender.female, ActivityLevel.low), 2150);
    });

    test('suma por sexo y actividad', () {
      expect(DailyGoal.calculate(80, Gender.male, ActivityLevel.moderate), 2800 + 500 + 500);
      expect(DailyGoal.calculate(70, Gender.female, ActivityLevel.high), 2450 + 1000);
    });

    test('peso válido entre 20 y 300 kg', () {
      expect(DailyGoal.isValidWeight(19.9), isFalse);
      expect(DailyGoal.isValidWeight(20), isTrue);
      expect(DailyGoal.isValidWeight(300), isTrue);
      expect(DailyGoal.isValidWeight(null), isFalse);
    });
  });

  group('estado de hidratación', () {
    const profile = UserProfile(weightKg: 60, gender: Gender.female, activityLevel: ActivityLevel.low, dailyGoalMl: 2000);

    test('progreso, restante y porcentaje', () {
      const status = HydrationStatus(profile: profile, entriesMl: [250, 250, 500]);
      expect(status.consumedMl, 1000);
      expect(status.progress, 0.5);
      expect(status.remainingMl, 1000);
      expect(status.percent, 50);
      expect(status.isGoalReached, isFalse);
    });

    test('al pasarse del objetivo el progreso se queda en 1', () {
      const status = HydrationStatus(profile: profile, entriesMl: [1500, 1000]);
      expect(status.progress, 1);
      expect(status.remainingMl, 0);
      expect(status.percent, 125);
      expect(status.isGoalReached, isTrue);
    });

    test('sin perfil no hay objetivo', () {
      const status = HydrationStatus(profile: null, entriesMl: [500]);
      expect(status.goalMl, 0);
      expect(status.isGoalReached, isFalse);
    });
  });

  group('racha', () {
    final today = DateTime(2026, 11, 13);
    DateTime ago(int n) => DateTime(2026, 11, 13 - n);

    test('días seguidos hasta hoy', () {
      final streak = StreakCalculator.calculate({ago(0), ago(1), ago(2), ago(5)}, today);
      expect(streak.current, 3);
      expect(streak.completedToday, isTrue);
    });

    test('sigue viva si se cumplió ayer', () {
      final streak = StreakCalculator.calculate({ago(1), ago(2)}, today);
      expect(streak.current, 2);
      expect(streak.completedToday, isFalse);
    });

    test('se pierde si el último día fue anteayer', () {
      expect(StreakCalculator.calculate({ago(2), ago(3)}, today).current, 0);
    });

    test('la mejor racha cuenta las antiguas', () {
      final streak = StreakCalculator.calculate({ago(10), ago(11), ago(12), ago(13), ago(0)}, today);
      expect(streak.best, 4);
      expect(streak.current, 1);
    });

    test('cruza el cambio de hora y el fin de mes', () {
      final streak = StreakCalculator.calculate({DateTime(2026, 10, 24), DateTime(2026, 10, 25), DateTime(2026, 10, 26)}, DateTime(2026, 10, 26, 23));
      expect(streak.current, 3);
      expect(StreakCalculator.calculate({DateTime(2026, 10, 31), DateTime(2026, 11, 1)}, DateTime(2026, 11, 1)).current, 2);
    });

    test('claves de día', () {
      expect(dayKey(DateTime(2026, 3, 5, 23, 59)), '2026-03-05');
      expect(parseDayKey('2026-03-05'), DateTime.utc(2026, 3, 5));
      expect(parseDayKey('basura'), isNull);
    });
  });

  group('valoración', () {
    final today = DateTime(2026, 11, 13);

    test('solo con racha de 3 días o más', () {
      expect(ReviewPrompt.shouldAsk(streakDays: 2, today: today), isFalse);
      expect(ReviewPrompt.shouldAsk(streakDays: 3, today: today), isTrue);
    });

    test('como mucho cada 60 días', () {
      expect(ReviewPrompt.shouldAsk(streakDays: 5, today: today, lastPrompt: DateTime(2026, 9, 20)), isFalse);
      expect(ReviewPrompt.shouldAsk(streakDays: 5, today: today, lastPrompt: DateTime(2026, 9, 14)), isTrue);
    });
  });

  group('recordatorios', () {
    test('una vez al día a la hora de inicio', () {
      expect(const ReminderSettings().timesOfDay(), [const TimeOfDayMinutes.hm(12, 0)]);
    });

    test('cada 90 minutos entre las horas elegidas', () {
      const settings = ReminderSettings(
        start: TimeOfDayMinutes.hm(9, 0),
        end: TimeOfDayMinutes.hm(13, 0),
        frequency: ReminderFrequency.every90Minutes,
      );
      expect(settings.timesOfDay(), const [TimeOfDayMinutes.hm(9, 0), TimeOfDayMinutes.hm(10, 30), TimeOfDayMinutes.hm(12, 0)]);
    });

    test('si el fin es antes del inicio queda solo el inicio', () {
      const settings = ReminderSettings(
        start: TimeOfDayMinutes.hm(20, 0),
        end: TimeOfDayMinutes.hm(8, 0),
        frequency: ReminderFrequency.everyHour,
      );
      expect(settings.timesOfDay(), const [TimeOfDayMinutes.hm(20, 0)]);
    });

    test('próximos avisos: solo los días elegidos y nunca en el pasado', () {
      // Viernes 13 de noviembre de 2026 a las 15:00; avisos a las 12:00 los lunes y viernes.
      const settings = ReminderSettings(days: {1, 5});
      final next = settings.upcoming(DateTime(2026, 11, 13, 15), goalReachedToday: false, limit: 3);
      expect(next, [DateTime(2026, 11, 16, 12), DateTime(2026, 11, 20, 12), DateTime(2026, 11, 23, 12)]);
    });

    test('silenciar el resto del día al cumplir el objetivo', () {
      const settings = ReminderSettings(
        start: TimeOfDayMinutes.hm(9, 0),
        end: TimeOfDayMinutes.hm(21, 0),
        frequency: ReminderFrequency.every4Hours,
        skipWhenGoalReached: true,
      );
      final now = DateTime(2026, 11, 13, 10);
      expect(settings.upcoming(now, goalReachedToday: false, limit: 2), [DateTime(2026, 11, 13, 13), DateTime(2026, 11, 13, 17)]);
      expect(settings.upcoming(now, goalReachedToday: true, limit: 1), [DateTime(2026, 11, 14, 9)]);
    });

    test('nunca más de 60 avisos pendientes', () {
      const settings = ReminderSettings(
        start: TimeOfDayMinutes.hm(8, 0),
        end: TimeOfDayMinutes.hm(22, 0),
        frequency: ReminderFrequency.everyHour,
      );
      expect(settings.upcoming(DateTime(2026, 11, 13, 7), goalReachedToday: false).length, 60);
    });

    test('desactivados o sin días no hay avisos', () {
      final now = DateTime(2026, 11, 13);
      expect(const ReminderSettings(enabled: false).upcoming(now, goalReachedToday: false), isEmpty);
      expect(const ReminderSettings(days: {}).upcoming(now, goalReachedToday: false), isEmpty);
    });
  });
}
