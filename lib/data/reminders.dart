import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../core/hydration.dart';

/// Textos de un aviso ya traducidos.
class ReminderTexts {
  const ReminderTexts({
    required this.title,
    required this.todayBody,
    required this.laterBody,
    required this.channelName,
    required this.channelDescription,
  });

  final String title;

  /// Para los avisos de hoy, con lo que se lleva bebido.
  final String todayBody;

  /// Para los de otros días, cuando aún no se sabe cuánto se habrá bebido.
  final String laterBody;
  final String channelName;
  final String channelDescription;
}

/// Recordatorios para beber agua. iOS no deja ejecutar código a la hora del aviso, así que se programan
/// avisos sueltos para los próximos días (como mucho 60, el límite es 64) y se reprograman cada vez que se
/// abre la app, se añade agua o se cambian los ajustes.
class Reminders {
  final _plugin = FlutterLocalNotificationsPlugin();

  Future<void> init() => _plugin.initialize(
        settings: const InitializationSettings(
          // El permiso se pide al activar los recordatorios, no al abrir la app.
          iOS: DarwinInitializationSettings(
            requestAlertPermission: false,
            requestSoundPermission: false,
            requestBadgePermission: false,
          ),
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        ),
      );

  /// Pide permiso para notificaciones. Devuelve false si el usuario no lo da.
  Future<bool> requestPermission() async =>
      await _plugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(alert: true, sound: true) ??
      await _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission() ??
      false;

  /// true si el sistema tiene las notificaciones de la app desactivadas.
  Future<bool> areBlocked() async {
    final ios = _plugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
    if (ios != null) {
      final options = await ios.checkPermissions();
      return options != null && !options.isEnabled;
    }
    final android = _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    return android != null && await android.areNotificationsEnabled() == false;
  }

  Future<void> reschedule(ReminderSettings settings, {required bool goalReachedToday, required ReminderTexts texts}) async {
    await _plugin.cancelAll();
    final now = DateTime.now();
    final times = settings.upcoming(now, goalReachedToday: goalReachedToday);
    final details = NotificationDetails(
      iOS: const DarwinNotificationDetails(),
      android: AndroidNotificationDetails(
        'daily_reminder',
        texts.channelName,
        channelDescription: texts.channelDescription,
        importance: Importance.high,
        priority: Priority.high,
      ),
    );
    for (var i = 0; i < times.length; i++) {
      final at = times[i];
      final isToday = at.year == now.year && at.month == now.month && at.day == now.day;
      await _plugin.zonedSchedule(
        id: i + 1,
        // Avisos sueltos: basta con el instante exacto, en UTC.
        scheduledDate: tz.TZDateTime.from(at, tz.UTC),
        title: texts.title,
        body: isToday ? texts.todayBody : texts.laterBody,
        notificationDetails: details,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      );
    }
  }
}
