// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class LEs extends L {
  LEs([String locale = 'es']) : super(locale);

  @override
  String get navToday => 'Hoy';

  @override
  String get navProfile => 'Perfil';

  @override
  String get todayTitle => 'Tu hidratación';

  @override
  String todayOfGoal(String p1) {
    return 'de $p1';
  }

  @override
  String todayRemaining(String p1) {
    return 'Te faltan $p1 para alcanzar tu objetivo';
  }

  @override
  String get todayGoalReached => '¡Objetivo cumplido! Sigue hidratándote 💧';

  @override
  String get todayAddTitle => 'Añadir agua';

  @override
  String get todayUndo => 'Deshacer';

  @override
  String get todayNoProfileTitle => 'Configura tu perfil';

  @override
  String get todayNoProfileBody =>
      'Calcula tu objetivo diario de agua para empezar a registrar lo que bebes.';

  @override
  String get todayNoProfileAction => 'Calcular mi objetivo';

  @override
  String get statGoal => 'Objetivo';

  @override
  String get statRemaining => 'Restante';

  @override
  String get statEntries => 'Registros';

  @override
  String get profileTitle => 'Tu perfil';

  @override
  String get profileSubtitle => 'Calcula cuánta agua necesitas cada día';

  @override
  String get profileWeightLabel => 'Peso';

  @override
  String get profileWeightError => 'Introduce un peso entre 20 y 300 kg';

  @override
  String get profileGenderLabel => 'Sexo';

  @override
  String get genderFemale => 'Mujer';

  @override
  String get genderMale => 'Hombre';

  @override
  String get profileGenderError => 'Selecciona una opción';

  @override
  String get profileActivityLabel => 'Actividad física';

  @override
  String get activityLow => 'Baja';

  @override
  String get activityModerate => 'Moderada';

  @override
  String get activityHigh => 'Alta';

  @override
  String get activityLowDesc => 'Poco o ningún ejercicio a la semana.';

  @override
  String get activityModerateDesc => 'Ejercicio entre 3 y 5 días a la semana.';

  @override
  String get activityHighDesc => 'Ejercicio intenso casi todos los días.';

  @override
  String get profileActivityError => 'Selecciona tu nivel de actividad';

  @override
  String get profileCalculate => 'Calcular mi objetivo';

  @override
  String get profileGoalTitle => 'Tu objetivo diario';

  @override
  String get profileGoalHint =>
      'Este cálculo es orientativo. Si tienes necesidades específicas de salud, consulta con un profesional sanitario.';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsReminders => 'Recibir recordatorios';

  @override
  String get settingsNotificationsBlocked =>
      'Las notificaciones están desactivadas para esta app.';

  @override
  String get settingsEnable => 'Activar';

  @override
  String get settingsPrivacy => 'Opciones de privacidad';

  @override
  String get settingsPrivacyPolicy => 'Política de privacidad';

  @override
  String get notificationTitle => '¡Hora de beber agua! 💧';

  @override
  String notificationBodyProgress(String p1, String p2) {
    return 'Llevas $p1 de $p2. Bebe un vaso ahora y sigue sumando.';
  }

  @override
  String get notificationBodyGoalReached =>
      '¡Ya has cumplido tu objetivo de hoy! Sigue así.';

  @override
  String get notificationBodyNoProfile =>
      'Calcula tu objetivo diario y empieza a cuidar tu hidratación.';

  @override
  String get reminderChannelName => 'Recordatorios';

  @override
  String get reminderChannelDescription => 'Avisos para recordarte beber agua.';

  @override
  String get streakNone => 'Aún no tienes racha';

  @override
  String get streakStartHint =>
      'Cumple tu objetivo hoy para empezar una racha.';

  @override
  String get streakKeepHint => 'Cumple tu objetivo hoy para mantenerla.';

  @override
  String get streakCompletedToday => '¡Hoy ya has sumado un día más!';

  @override
  String get streakBest => 'Mejor';

  @override
  String get remindersTitle => 'Recordatorios';

  @override
  String get reminderSummaryOff => 'Desactivados';

  @override
  String get reminderSummaryNoDays => 'Elige al menos un día';

  @override
  String reminderSummaryOnce(String p1) {
    return 'A las $p1';
  }

  @override
  String reminderSummaryInterval(String p1, String p2, String p3) {
    return 'Cada $p1, de $p2 a $p3';
  }

  @override
  String get reminderSummaryEveryDay => 'todos los días';

  @override
  String get reminderFrequency => 'Frecuencia';

  @override
  String get reminderFrequencyOnce => 'Una vez al día';

  @override
  String durationHours(int p1) {
    return '$p1 h';
  }

  @override
  String durationHoursMinutes(int p1, int p2) {
    return '$p1 h $p2 min';
  }

  @override
  String get reminderTime => 'Hora';

  @override
  String get reminderFrom => 'Desde';

  @override
  String get reminderUntil => 'Hasta';

  @override
  String get reminderDays => 'Días';

  @override
  String get reminderSkipWhenReached => 'Silenciar al cumplir el objetivo';

  @override
  String get reminderSkipWhenReachedDesc => 'No recibirás más avisos ese día.';

  @override
  String get premiumDesc =>
      'Disfruta de HydroDaily sin anuncios. Elige un pago único para siempre o una suscripción mensual.';

  @override
  String get premiumActive => 'Ya eres Premium. ¡Gracias por tu apoyo!';

  @override
  String get premiumRestore => 'Restaurar compra';

  @override
  String get premiumPending => 'Compra pendiente de confirmación…';

  @override
  String get premiumErrorStore =>
      'La tienda no está disponible ahora mismo. Inténtalo más tarde.';

  @override
  String get premiumErrorProduct =>
      'No se ha podido cargar el producto. Inténtalo más tarde.';

  @override
  String get premiumErrorFailed => 'No se ha podido completar la compra.';

  @override
  String get premiumNothingToRestore =>
      'No se han encontrado compras que restaurar.';

  @override
  String get premiumRestored => 'Compra restaurada. ¡Ya no verás anuncios!';

  @override
  String get premiumActiveMonthly =>
      'Tu suscripción sin anuncios está activa. ¡Gracias por tu apoyo!';

  @override
  String premiumBuyLifetime(String p1) {
    return 'Para siempre por $p1';
  }

  @override
  String get premiumBuyLifetimeNoPrice => 'Quitar anuncios para siempre';

  @override
  String premiumBuyMonthly(String p1) {
    return '$p1 al mes';
  }

  @override
  String get premiumBuyMonthlyNoPrice => 'Suscripción mensual';

  @override
  String get premiumManageSubscription => 'Gestionar o cancelar suscripción';

  @override
  String streakCurrent(int p1) {
    String _temp0 = intl.Intl.pluralLogic(
      p1,
      locale: localeName,
      other: '$p1 días seguidos',
      one: '$p1 día seguido',
    );
    return '$_temp0';
  }

  @override
  String notificationBodyStreak(String p1, String p2, int p3) {
    String _temp0 = intl.Intl.pluralLogic(
      p3,
      locale: localeName,
      other: 'Llevas $p1 de $p2. ¡No pierdas tu racha de $p3 días!',
      one: 'Llevas $p1 de $p2. ¡No pierdas tu racha de $p3 día!',
    );
    return '$_temp0';
  }

  @override
  String get premiumHeadline => 'Pásate a Premium';

  @override
  String get premiumBenefitNoAds => 'Sin anuncios';

  @override
  String get premiumLoading => 'Cargando precio…';

  @override
  String get premiumLegal =>
      'La suscripción se renueva cada mes y puedes cancelarla cuando quieras en los ajustes de tu cuenta del App Store.';

  @override
  String get termsOfUse => 'Términos de uso';

  @override
  String get notificationBodyGeneric =>
      'Bebe un vaso de agua y acércate a tu objetivo de hoy.';

  @override
  String get premiumTitle => 'HydroDaily Premium';

  @override
  String premiumMonthly(String p1) {
    return '$p1 al mes';
  }

  @override
  String premiumLifetime(String p1) {
    return 'Para siempre por $p1';
  }

  @override
  String get premiumStoreUnavailable =>
      'La tienda no está disponible ahora mismo. Inténtalo más tarde.';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get privacyOptions => 'Opciones de privacidad';
}
