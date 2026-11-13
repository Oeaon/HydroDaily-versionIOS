import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/hydration.dart';
import '../l10n/app_localizations.dart';

/// 750 ml o, desde un litro, 1,25 L.
String formatVolume(int ml, String locale) {
  if (ml < 1000) return '${NumberFormat.decimalPattern(locale).format(ml)} ml';
  final liters = NumberFormat.decimalPattern(locale)..maximumFractionDigits = 2;
  return '${liters.format(ml / 1000)} L';
}

String formatTime(BuildContext context, TimeOfDayMinutes time) =>
    MaterialLocalizations.of(context).formatTimeOfDay(TimeOfDay(hour: time.hour, minute: time.minute));

/// Días de la semana (1 = lunes) empezando por el primero según el idioma.
List<int> orderedWeekdays(BuildContext context) {
  // firstDayOfWeekIndex: 0 = domingo.
  final first = MaterialLocalizations.of(context).firstDayOfWeekIndex;
  final start = first == 0 ? 7 : first;
  return [for (var i = 0; i < 7; i++) (start - 1 + i) % 7 + 1];
}

// El 1 de enero de 2024 fue lunes, así que el día N de ese mes es el día N de la semana.
String weekdayShort(String locale, int weekday) => DateFormat.E(locale).format(DateTime(2024, 1, weekday));

String weekdayNarrow(String locale, int weekday) => DateFormat('EEEEE', locale).format(DateTime(2024, 1, weekday));

String frequencyLabel(L l, ReminderFrequency frequency) {
  final minutes = frequency.intervalMinutes;
  if (minutes == null) return l.reminderFrequencyOnce;
  final hours = minutes ~/ 60;
  final rest = minutes % 60;
  return rest == 0 ? l.durationHours(hours) : l.durationHoursMinutes(hours, rest);
}

String reminderSummary(BuildContext context, ReminderSettings settings) {
  final l = L.of(context);
  if (!settings.enabled) return l.reminderSummaryOff;
  if (settings.days.isEmpty) return l.reminderSummaryNoDays;
  final times = settings.frequency == ReminderFrequency.once
      ? l.reminderSummaryOnce(formatTime(context, settings.start))
      : l.reminderSummaryInterval(frequencyLabel(l, settings.frequency), formatTime(context, settings.start), formatTime(context, settings.end));
  final days = settings.days.length == 7
      ? l.reminderSummaryEveryDay
      : orderedWeekdays(context).where(settings.days.contains).map((d) => weekdayShort(l.localeName, d)).join(', ');
  return '$times · $days';
}

class WaterColors {
  const WaterColors(this.start, this.end, this.track);

  final Color start;
  final Color end;
  final Color track;

  static WaterColors of(BuildContext context) => Theme.of(context).brightness == Brightness.dark
      ? const WaterColors(Color(0xFF5DD5EE), Color(0xFFAAC7FF), Color(0xFF1A2639))
      : const WaterColors(Color(0xFF00879C), Color(0xFF1366D6), Color(0xFFE1E7F0));
}

ThemeData hydroTheme(Brightness brightness) {
  final dark = brightness == Brightness.dark;
  final scheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF1366D6),
    brightness: brightness,
    secondary: dark ? const Color(0xFF5DD5EE) : const Color(0xFF00879C),
    tertiary: dark ? const Color(0xFF6FDBB7) : const Color(0xFF16A37F),
    tertiaryContainer: dark ? const Color(0xFF0B3D30) : const Color(0xFFC9F4E4),
  );
  return ThemeData(
    colorScheme: scheme,
    scaffoldBackgroundColor: dark ? const Color(0xFF0B1422) : const Color(0xFFFAFCFF),
  );
}

/// Anillo de progreso con degradado, animado al cambiar.
class WaterProgressRing extends StatelessWidget {
  const WaterProgressRing({super.key, required this.progress, required this.child, this.strokeWidth = 22});

  final double progress;
  final double strokeWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = WaterColors.of(context);
    return TweenAnimationBuilder<double>(
      tween: Tween(end: progress.clamp(0, 1)),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutBack,
      builder: (context, value, child) => CustomPaint(
        painter: _RingPainter(value.clamp(0, 1), colors, strokeWidth),
        child: Center(child: child),
      ),
      child: child,
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter(this.progress, this.colors, this.strokeWidth);

  final double progress;
  final WaterColors colors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final diameter = min(size.width, size.height) - strokeWidth;
    final rect = Rect.fromCenter(center: size.center(Offset.zero), width: diameter, height: diameter);
    canvas.drawArc(rect, 0, 2 * pi, false, Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = colors.track);
    if (progress <= 0) return;
    final shader = SweepGradient(
      colors: [colors.start, colors.end, colors.start],
      stops: [0, progress, 1],
      transform: const GradientRotation(-pi / 2),
    ).createShader(rect);
    canvas.drawArc(rect, -pi / 2, 2 * pi * progress, false, Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..shader = shader);
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.progress != progress || old.colors != colors;
}
