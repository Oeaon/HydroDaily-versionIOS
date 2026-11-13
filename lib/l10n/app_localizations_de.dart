// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class LDe extends L {
  LDe([String locale = 'de']) : super(locale);

  @override
  String get navToday => 'Heute';

  @override
  String get navProfile => 'Profil';

  @override
  String get todayTitle => 'Deine Hydration';

  @override
  String todayOfGoal(String p1) {
    return 'von $p1';
  }

  @override
  String todayRemaining(String p1) {
    return 'Noch $p1 bis zu deinem Ziel';
  }

  @override
  String get todayGoalReached => 'Ziel erreicht! Trink weiter genug 💧';

  @override
  String get todayAddTitle => 'Wasser hinzufügen';

  @override
  String get todayUndo => 'Rückgängig';

  @override
  String get todayNoProfileTitle => 'Profil einrichten';

  @override
  String get todayNoProfileBody =>
      'Berechne dein tägliches Wasserziel, um mit dem Erfassen zu beginnen.';

  @override
  String get todayNoProfileAction => 'Mein Ziel berechnen';

  @override
  String get statGoal => 'Ziel';

  @override
  String get statRemaining => 'Übrig';

  @override
  String get statEntries => 'Einträge';

  @override
  String get profileTitle => 'Dein Profil';

  @override
  String get profileSubtitle =>
      'Finde heraus, wie viel Wasser du täglich brauchst';

  @override
  String get profileWeightLabel => 'Gewicht';

  @override
  String get profileWeightError => 'Gib ein Gewicht zwischen 20 und 300 kg ein';

  @override
  String get profileGenderLabel => 'Geschlecht';

  @override
  String get genderFemale => 'Frau';

  @override
  String get genderMale => 'Mann';

  @override
  String get profileGenderError => 'Wähle eine Option';

  @override
  String get profileActivityLabel => 'Körperliche Aktivität';

  @override
  String get activityLow => 'Niedrig';

  @override
  String get activityModerate => 'Mittel';

  @override
  String get activityHigh => 'Hoch';

  @override
  String get activityLowDesc => 'Wenig oder kein Sport pro Woche.';

  @override
  String get activityModerateDesc => 'Sport an 3 bis 5 Tagen pro Woche.';

  @override
  String get activityHighDesc => 'Intensiver Sport fast jeden Tag.';

  @override
  String get profileActivityError => 'Wähle dein Aktivitätsniveau';

  @override
  String get profileCalculate => 'Mein Ziel berechnen';

  @override
  String get profileGoalTitle => 'Dein Tagesziel';

  @override
  String get profileGoalHint =>
      'Diese Berechnung ist ein Richtwert. Bei besonderen gesundheitlichen Bedürfnissen wende dich an medizinisches Fachpersonal.';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsReminders => 'Erinnerungen erhalten';

  @override
  String get settingsNotificationsBlocked =>
      'Benachrichtigungen sind für diese App deaktiviert.';

  @override
  String get settingsEnable => 'Aktivieren';

  @override
  String get settingsPrivacy => 'Datenschutzoptionen';

  @override
  String get settingsPrivacyPolicy => 'Datenschutzerklärung';

  @override
  String get notificationTitle => 'Zeit, Wasser zu trinken! 💧';

  @override
  String notificationBodyProgress(String p1, String p2) {
    return 'Du hast $p1 von $p2 getrunken. Trink jetzt ein Glas und mach weiter.';
  }

  @override
  String get notificationBodyGoalReached =>
      'Du hast dein heutiges Ziel schon erreicht! Weiter so.';

  @override
  String get notificationBodyNoProfile =>
      'Berechne dein Tagesziel und achte auf deine Hydration.';

  @override
  String get reminderChannelName => 'Erinnerungen';

  @override
  String get reminderChannelDescription =>
      'Benachrichtigungen, die dich ans Wassertrinken erinnern.';

  @override
  String get streakNone => 'Noch keine Serie';

  @override
  String get streakStartHint =>
      'Erreiche heute dein Ziel, um eine Serie zu starten.';

  @override
  String get streakKeepHint => 'Erreiche heute dein Ziel, um sie fortzusetzen.';

  @override
  String get streakCompletedToday => 'Heute ist ein weiterer Tag geschafft!';

  @override
  String get streakBest => 'Rekord';

  @override
  String get remindersTitle => 'Erinnerungen';

  @override
  String get reminderSummaryOff => 'Aus';

  @override
  String get reminderSummaryNoDays => 'Wähle mindestens einen Tag';

  @override
  String reminderSummaryOnce(String p1) {
    return 'Um $p1';
  }

  @override
  String reminderSummaryInterval(String p1, String p2, String p3) {
    return 'Alle $p1, von $p2 bis $p3';
  }

  @override
  String get reminderSummaryEveryDay => 'jeden Tag';

  @override
  String get reminderFrequency => 'Häufigkeit';

  @override
  String get reminderFrequencyOnce => 'Einmal am Tag';

  @override
  String durationHours(int p1) {
    return '$p1 Std.';
  }

  @override
  String durationHoursMinutes(int p1, int p2) {
    return '$p1 Std. $p2 Min.';
  }

  @override
  String get reminderTime => 'Uhrzeit';

  @override
  String get reminderFrom => 'Von';

  @override
  String get reminderUntil => 'Bis';

  @override
  String get reminderDays => 'Tage';

  @override
  String get reminderSkipWhenReached => 'Stumm, wenn das Ziel erreicht ist';

  @override
  String get reminderSkipWhenReachedDesc =>
      'An diesem Tag bekommst du keine Erinnerungen mehr.';

  @override
  String get premiumDesc =>
      'Nutze HydroDaily ohne Werbung. Wähle eine Einmalzahlung für immer oder ein Monatsabo.';

  @override
  String get premiumActive => 'Du hast Premium. Danke für deine Unterstützung!';

  @override
  String get premiumRestore => 'Kauf wiederherstellen';

  @override
  String get premiumPending => 'Kauf wartet auf Bestätigung…';

  @override
  String get premiumErrorStore =>
      'Der Store ist gerade nicht verfügbar. Bitte versuche es später erneut.';

  @override
  String get premiumErrorProduct =>
      'Das Produkt konnte nicht geladen werden. Bitte versuche es später erneut.';

  @override
  String get premiumErrorFailed =>
      'Der Kauf konnte nicht abgeschlossen werden.';

  @override
  String get premiumNothingToRestore =>
      'Keine Käufe zum Wiederherstellen gefunden.';

  @override
  String get premiumRestored => 'Kauf wiederhergestellt. Keine Werbung mehr!';

  @override
  String get premiumActiveMonthly =>
      'Dein werbefreies Abo ist aktiv. Danke für deine Unterstützung!';

  @override
  String premiumBuyLifetime(String p1) {
    return 'Für immer für $p1';
  }

  @override
  String get premiumBuyLifetimeNoPrice => 'Werbung für immer entfernen';

  @override
  String premiumBuyMonthly(String p1) {
    return '$p1 pro Monat';
  }

  @override
  String get premiumBuyMonthlyNoPrice => 'Monatsabo';

  @override
  String get premiumManageSubscription => 'Abo verwalten oder kündigen';

  @override
  String streakCurrent(int p1) {
    String _temp0 = intl.Intl.pluralLogic(
      p1,
      locale: localeName,
      other: '$p1 Tage in Folge',
      one: '$p1 Tag in Folge',
    );
    return '$_temp0';
  }

  @override
  String notificationBodyStreak(String p1, String p2, int p3) {
    String _temp0 = intl.Intl.pluralLogic(
      p3,
      locale: localeName,
      other:
          'Du hast $p1 von $p2 getrunken. Verliere nicht deine Serie von $p3 Tagen!',
      one:
          'Du hast $p1 von $p2 getrunken. Verliere nicht deine Serie von $p3 Tag!',
    );
    return '$_temp0';
  }

  @override
  String get premiumHeadline => 'Premium holen';

  @override
  String get premiumBenefitNoAds => 'Keine Werbung';

  @override
  String get premiumLoading => 'Preis wird geladen…';

  @override
  String get premiumLegal =>
      'Das Abo verlängert sich jeden Monat und du kannst es jederzeit in den Einstellungen deines App-Store-Kontos kündigen.';

  @override
  String get termsOfUse => 'Nutzungsbedingungen';

  @override
  String get notificationBodyGeneric =>
      'Trink ein Glas Wasser und komm deinem heutigen Ziel näher.';

  @override
  String get premiumTitle => 'HydroDaily Premium';

  @override
  String premiumMonthly(String p1) {
    return '$p1 pro Monat';
  }

  @override
  String premiumLifetime(String p1) {
    return 'Für immer für $p1';
  }

  @override
  String get premiumStoreUnavailable =>
      'Der Store ist gerade nicht verfügbar. Bitte versuche es später erneut.';

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get privacyOptions => 'Datenschutzoptionen';
}
