import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L
/// returned by `L.of(context)`.
///
/// Applications need to include `L.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L.localizationsDelegates,
///   supportedLocales: L.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L.supportedLocales
/// property.
abstract class L {
  L(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L of(BuildContext context) {
    return Localizations.of<L>(context, L)!;
  }

  static const LocalizationsDelegate<L> delegate = _LDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('pt'),
    Locale('ru'),
    Locale('zh'),
  ];

  /// No description provided for @navToday.
  ///
  /// In es, this message translates to:
  /// **'Hoy'**
  String get navToday;

  /// No description provided for @navProfile.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get navProfile;

  /// No description provided for @todayTitle.
  ///
  /// In es, this message translates to:
  /// **'Tu hidratación'**
  String get todayTitle;

  /// No description provided for @todayOfGoal.
  ///
  /// In es, this message translates to:
  /// **'de {p1}'**
  String todayOfGoal(String p1);

  /// No description provided for @todayRemaining.
  ///
  /// In es, this message translates to:
  /// **'Te faltan {p1} para alcanzar tu objetivo'**
  String todayRemaining(String p1);

  /// No description provided for @todayGoalReached.
  ///
  /// In es, this message translates to:
  /// **'¡Objetivo cumplido! Sigue hidratándote 💧'**
  String get todayGoalReached;

  /// No description provided for @todayAddTitle.
  ///
  /// In es, this message translates to:
  /// **'Añadir agua'**
  String get todayAddTitle;

  /// No description provided for @todayUndo.
  ///
  /// In es, this message translates to:
  /// **'Deshacer'**
  String get todayUndo;

  /// No description provided for @todayNoProfileTitle.
  ///
  /// In es, this message translates to:
  /// **'Configura tu perfil'**
  String get todayNoProfileTitle;

  /// No description provided for @todayNoProfileBody.
  ///
  /// In es, this message translates to:
  /// **'Calcula tu objetivo diario de agua para empezar a registrar lo que bebes.'**
  String get todayNoProfileBody;

  /// No description provided for @todayNoProfileAction.
  ///
  /// In es, this message translates to:
  /// **'Calcular mi objetivo'**
  String get todayNoProfileAction;

  /// No description provided for @statGoal.
  ///
  /// In es, this message translates to:
  /// **'Objetivo'**
  String get statGoal;

  /// No description provided for @statRemaining.
  ///
  /// In es, this message translates to:
  /// **'Restante'**
  String get statRemaining;

  /// No description provided for @statEntries.
  ///
  /// In es, this message translates to:
  /// **'Registros'**
  String get statEntries;

  /// No description provided for @profileTitle.
  ///
  /// In es, this message translates to:
  /// **'Tu perfil'**
  String get profileTitle;

  /// No description provided for @profileSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Calcula cuánta agua necesitas cada día'**
  String get profileSubtitle;

  /// No description provided for @profileWeightLabel.
  ///
  /// In es, this message translates to:
  /// **'Peso'**
  String get profileWeightLabel;

  /// No description provided for @profileWeightError.
  ///
  /// In es, this message translates to:
  /// **'Introduce un peso entre 20 y 300 kg'**
  String get profileWeightError;

  /// No description provided for @profileGenderLabel.
  ///
  /// In es, this message translates to:
  /// **'Sexo'**
  String get profileGenderLabel;

  /// No description provided for @genderFemale.
  ///
  /// In es, this message translates to:
  /// **'Mujer'**
  String get genderFemale;

  /// No description provided for @genderMale.
  ///
  /// In es, this message translates to:
  /// **'Hombre'**
  String get genderMale;

  /// No description provided for @profileGenderError.
  ///
  /// In es, this message translates to:
  /// **'Selecciona una opción'**
  String get profileGenderError;

  /// No description provided for @profileActivityLabel.
  ///
  /// In es, this message translates to:
  /// **'Actividad física'**
  String get profileActivityLabel;

  /// No description provided for @activityLow.
  ///
  /// In es, this message translates to:
  /// **'Baja'**
  String get activityLow;

  /// No description provided for @activityModerate.
  ///
  /// In es, this message translates to:
  /// **'Moderada'**
  String get activityModerate;

  /// No description provided for @activityHigh.
  ///
  /// In es, this message translates to:
  /// **'Alta'**
  String get activityHigh;

  /// No description provided for @activityLowDesc.
  ///
  /// In es, this message translates to:
  /// **'Poco o ningún ejercicio a la semana.'**
  String get activityLowDesc;

  /// No description provided for @activityModerateDesc.
  ///
  /// In es, this message translates to:
  /// **'Ejercicio entre 3 y 5 días a la semana.'**
  String get activityModerateDesc;

  /// No description provided for @activityHighDesc.
  ///
  /// In es, this message translates to:
  /// **'Ejercicio intenso casi todos los días.'**
  String get activityHighDesc;

  /// No description provided for @profileActivityError.
  ///
  /// In es, this message translates to:
  /// **'Selecciona tu nivel de actividad'**
  String get profileActivityError;

  /// No description provided for @profileCalculate.
  ///
  /// In es, this message translates to:
  /// **'Calcular mi objetivo'**
  String get profileCalculate;

  /// No description provided for @profileGoalTitle.
  ///
  /// In es, this message translates to:
  /// **'Tu objetivo diario'**
  String get profileGoalTitle;

  /// No description provided for @profileGoalHint.
  ///
  /// In es, this message translates to:
  /// **'Este cálculo es orientativo. Si tienes necesidades específicas de salud, consulta con un profesional sanitario.'**
  String get profileGoalHint;

  /// No description provided for @settingsTitle.
  ///
  /// In es, this message translates to:
  /// **'Ajustes'**
  String get settingsTitle;

  /// No description provided for @settingsReminders.
  ///
  /// In es, this message translates to:
  /// **'Recibir recordatorios'**
  String get settingsReminders;

  /// No description provided for @settingsNotificationsBlocked.
  ///
  /// In es, this message translates to:
  /// **'Las notificaciones están desactivadas para esta app.'**
  String get settingsNotificationsBlocked;

  /// No description provided for @settingsEnable.
  ///
  /// In es, this message translates to:
  /// **'Activar'**
  String get settingsEnable;

  /// No description provided for @settingsPrivacy.
  ///
  /// In es, this message translates to:
  /// **'Opciones de privacidad'**
  String get settingsPrivacy;

  /// No description provided for @settingsPrivacyPolicy.
  ///
  /// In es, this message translates to:
  /// **'Política de privacidad'**
  String get settingsPrivacyPolicy;

  /// No description provided for @notificationTitle.
  ///
  /// In es, this message translates to:
  /// **'¡Hora de beber agua! 💧'**
  String get notificationTitle;

  /// No description provided for @notificationBodyProgress.
  ///
  /// In es, this message translates to:
  /// **'Llevas {p1} de {p2}. Bebe un vaso ahora y sigue sumando.'**
  String notificationBodyProgress(String p1, String p2);

  /// No description provided for @notificationBodyGoalReached.
  ///
  /// In es, this message translates to:
  /// **'¡Ya has cumplido tu objetivo de hoy! Sigue así.'**
  String get notificationBodyGoalReached;

  /// No description provided for @notificationBodyNoProfile.
  ///
  /// In es, this message translates to:
  /// **'Calcula tu objetivo diario y empieza a cuidar tu hidratación.'**
  String get notificationBodyNoProfile;

  /// No description provided for @reminderChannelName.
  ///
  /// In es, this message translates to:
  /// **'Recordatorios'**
  String get reminderChannelName;

  /// No description provided for @reminderChannelDescription.
  ///
  /// In es, this message translates to:
  /// **'Avisos para recordarte beber agua.'**
  String get reminderChannelDescription;

  /// No description provided for @streakNone.
  ///
  /// In es, this message translates to:
  /// **'Aún no tienes racha'**
  String get streakNone;

  /// No description provided for @streakStartHint.
  ///
  /// In es, this message translates to:
  /// **'Cumple tu objetivo hoy para empezar una racha.'**
  String get streakStartHint;

  /// No description provided for @streakKeepHint.
  ///
  /// In es, this message translates to:
  /// **'Cumple tu objetivo hoy para mantenerla.'**
  String get streakKeepHint;

  /// No description provided for @streakCompletedToday.
  ///
  /// In es, this message translates to:
  /// **'¡Hoy ya has sumado un día más!'**
  String get streakCompletedToday;

  /// No description provided for @streakBest.
  ///
  /// In es, this message translates to:
  /// **'Mejor'**
  String get streakBest;

  /// No description provided for @remindersTitle.
  ///
  /// In es, this message translates to:
  /// **'Recordatorios'**
  String get remindersTitle;

  /// No description provided for @reminderSummaryOff.
  ///
  /// In es, this message translates to:
  /// **'Desactivados'**
  String get reminderSummaryOff;

  /// No description provided for @reminderSummaryNoDays.
  ///
  /// In es, this message translates to:
  /// **'Elige al menos un día'**
  String get reminderSummaryNoDays;

  /// No description provided for @reminderSummaryOnce.
  ///
  /// In es, this message translates to:
  /// **'A las {p1}'**
  String reminderSummaryOnce(String p1);

  /// No description provided for @reminderSummaryInterval.
  ///
  /// In es, this message translates to:
  /// **'Cada {p1}, de {p2} a {p3}'**
  String reminderSummaryInterval(String p1, String p2, String p3);

  /// No description provided for @reminderSummaryEveryDay.
  ///
  /// In es, this message translates to:
  /// **'todos los días'**
  String get reminderSummaryEveryDay;

  /// No description provided for @reminderFrequency.
  ///
  /// In es, this message translates to:
  /// **'Frecuencia'**
  String get reminderFrequency;

  /// No description provided for @reminderFrequencyOnce.
  ///
  /// In es, this message translates to:
  /// **'Una vez al día'**
  String get reminderFrequencyOnce;

  /// No description provided for @durationHours.
  ///
  /// In es, this message translates to:
  /// **'{p1} h'**
  String durationHours(int p1);

  /// No description provided for @durationHoursMinutes.
  ///
  /// In es, this message translates to:
  /// **'{p1} h {p2} min'**
  String durationHoursMinutes(int p1, int p2);

  /// No description provided for @reminderTime.
  ///
  /// In es, this message translates to:
  /// **'Hora'**
  String get reminderTime;

  /// No description provided for @reminderFrom.
  ///
  /// In es, this message translates to:
  /// **'Desde'**
  String get reminderFrom;

  /// No description provided for @reminderUntil.
  ///
  /// In es, this message translates to:
  /// **'Hasta'**
  String get reminderUntil;

  /// No description provided for @reminderDays.
  ///
  /// In es, this message translates to:
  /// **'Días'**
  String get reminderDays;

  /// No description provided for @reminderSkipWhenReached.
  ///
  /// In es, this message translates to:
  /// **'Silenciar al cumplir el objetivo'**
  String get reminderSkipWhenReached;

  /// No description provided for @reminderSkipWhenReachedDesc.
  ///
  /// In es, this message translates to:
  /// **'No recibirás más avisos ese día.'**
  String get reminderSkipWhenReachedDesc;

  /// No description provided for @premiumDesc.
  ///
  /// In es, this message translates to:
  /// **'Disfruta de HydroDaily sin anuncios. Elige un pago único para siempre o una suscripción mensual.'**
  String get premiumDesc;

  /// No description provided for @premiumActive.
  ///
  /// In es, this message translates to:
  /// **'Ya eres Premium. ¡Gracias por tu apoyo!'**
  String get premiumActive;

  /// No description provided for @premiumRestore.
  ///
  /// In es, this message translates to:
  /// **'Restaurar compra'**
  String get premiumRestore;

  /// No description provided for @premiumPending.
  ///
  /// In es, this message translates to:
  /// **'Compra pendiente de confirmación…'**
  String get premiumPending;

  /// No description provided for @premiumErrorStore.
  ///
  /// In es, this message translates to:
  /// **'La tienda no está disponible ahora mismo. Inténtalo más tarde.'**
  String get premiumErrorStore;

  /// No description provided for @premiumErrorProduct.
  ///
  /// In es, this message translates to:
  /// **'No se ha podido cargar el producto. Inténtalo más tarde.'**
  String get premiumErrorProduct;

  /// No description provided for @premiumErrorFailed.
  ///
  /// In es, this message translates to:
  /// **'No se ha podido completar la compra.'**
  String get premiumErrorFailed;

  /// No description provided for @premiumNothingToRestore.
  ///
  /// In es, this message translates to:
  /// **'No se han encontrado compras que restaurar.'**
  String get premiumNothingToRestore;

  /// No description provided for @premiumRestored.
  ///
  /// In es, this message translates to:
  /// **'Compra restaurada. ¡Ya no verás anuncios!'**
  String get premiumRestored;

  /// No description provided for @premiumActiveMonthly.
  ///
  /// In es, this message translates to:
  /// **'Tu suscripción sin anuncios está activa. ¡Gracias por tu apoyo!'**
  String get premiumActiveMonthly;

  /// No description provided for @premiumBuyLifetime.
  ///
  /// In es, this message translates to:
  /// **'Para siempre por {p1}'**
  String premiumBuyLifetime(String p1);

  /// No description provided for @premiumBuyLifetimeNoPrice.
  ///
  /// In es, this message translates to:
  /// **'Quitar anuncios para siempre'**
  String get premiumBuyLifetimeNoPrice;

  /// No description provided for @premiumBuyMonthly.
  ///
  /// In es, this message translates to:
  /// **'{p1} al mes'**
  String premiumBuyMonthly(String p1);

  /// No description provided for @premiumBuyMonthlyNoPrice.
  ///
  /// In es, this message translates to:
  /// **'Suscripción mensual'**
  String get premiumBuyMonthlyNoPrice;

  /// No description provided for @premiumManageSubscription.
  ///
  /// In es, this message translates to:
  /// **'Gestionar o cancelar suscripción'**
  String get premiumManageSubscription;

  /// No description provided for @streakCurrent.
  ///
  /// In es, this message translates to:
  /// **'{p1, plural, one{{p1} día seguido} other{{p1} días seguidos}}'**
  String streakCurrent(int p1);

  /// No description provided for @notificationBodyStreak.
  ///
  /// In es, this message translates to:
  /// **'{p3, plural, one{Llevas {p1} de {p2}. ¡No pierdas tu racha de {p3} día!} other{Llevas {p1} de {p2}. ¡No pierdas tu racha de {p3} días!}}'**
  String notificationBodyStreak(String p1, String p2, int p3);

  /// No description provided for @premiumHeadline.
  ///
  /// In es, this message translates to:
  /// **'Pásate a Premium'**
  String get premiumHeadline;

  /// No description provided for @premiumBenefitNoAds.
  ///
  /// In es, this message translates to:
  /// **'Sin anuncios'**
  String get premiumBenefitNoAds;

  /// No description provided for @premiumLoading.
  ///
  /// In es, this message translates to:
  /// **'Cargando precio…'**
  String get premiumLoading;

  /// No description provided for @premiumLegal.
  ///
  /// In es, this message translates to:
  /// **'La suscripción se renueva cada mes y puedes cancelarla cuando quieras en los ajustes de tu cuenta del App Store.'**
  String get premiumLegal;

  /// No description provided for @termsOfUse.
  ///
  /// In es, this message translates to:
  /// **'Términos de uso'**
  String get termsOfUse;

  /// No description provided for @notificationBodyGeneric.
  ///
  /// In es, this message translates to:
  /// **'Bebe un vaso de agua y acércate a tu objetivo de hoy.'**
  String get notificationBodyGeneric;

  /// No description provided for @premiumTitle.
  ///
  /// In es, this message translates to:
  /// **'HydroDaily Premium'**
  String get premiumTitle;

  /// No description provided for @premiumMonthly.
  ///
  /// In es, this message translates to:
  /// **'{p1} al mes'**
  String premiumMonthly(String p1);

  /// No description provided for @premiumLifetime.
  ///
  /// In es, this message translates to:
  /// **'Para siempre por {p1}'**
  String premiumLifetime(String p1);

  /// No description provided for @premiumStoreUnavailable.
  ///
  /// In es, this message translates to:
  /// **'La tienda no está disponible ahora mismo. Inténtalo más tarde.'**
  String get premiumStoreUnavailable;

  /// No description provided for @privacyPolicy.
  ///
  /// In es, this message translates to:
  /// **'Política de privacidad'**
  String get privacyPolicy;

  /// No description provided for @privacyOptions.
  ///
  /// In es, this message translates to:
  /// **'Opciones de privacidad'**
  String get privacyOptions;
}

class _LDelegate extends LocalizationsDelegate<L> {
  const _LDelegate();

  @override
  Future<L> load(Locale locale) {
    return SynchronousFuture<L>(lookupL(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'it',
    'pt',
    'ru',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_LDelegate old) => false;
}

L lookupL(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return LAr();
    case 'de':
      return LDe();
    case 'en':
      return LEn();
    case 'es':
      return LEs();
    case 'fr':
      return LFr();
    case 'hi':
      return LHi();
    case 'it':
      return LIt();
    case 'pt':
      return LPt();
    case 'ru':
      return LRu();
    case 'zh':
      return LZh();
  }

  throw FlutterError(
    'L.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
