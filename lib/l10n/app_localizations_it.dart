// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class LIt extends L {
  LIt([String locale = 'it']) : super(locale);

  @override
  String get navToday => 'Oggi';

  @override
  String get navProfile => 'Profilo';

  @override
  String get todayTitle => 'La tua idratazione';

  @override
  String todayOfGoal(String p1) {
    return 'su $p1';
  }

  @override
  String todayRemaining(String p1) {
    return 'Mancano $p1 per raggiungere il tuo obiettivo';
  }

  @override
  String get todayGoalReached => 'Obiettivo raggiunto! Continua a idratarti 💧';

  @override
  String get todayAddTitle => 'Aggiungi acqua';

  @override
  String get todayUndo => 'Annulla';

  @override
  String get todayNoProfileTitle => 'Configura il tuo profilo';

  @override
  String get todayNoProfileBody =>
      'Calcola il tuo obiettivo giornaliero di acqua per iniziare a registrare ciò che bevi.';

  @override
  String get todayNoProfileAction => 'Calcola il mio obiettivo';

  @override
  String get statGoal => 'Obiettivo';

  @override
  String get statRemaining => 'Mancante';

  @override
  String get statEntries => 'Registrazioni';

  @override
  String get profileTitle => 'Il tuo profilo';

  @override
  String get profileSubtitle => 'Scopri quanta acqua ti serve ogni giorno';

  @override
  String get profileWeightLabel => 'Peso';

  @override
  String get profileWeightError => 'Inserisci un peso tra 20 e 300 kg';

  @override
  String get profileGenderLabel => 'Sesso';

  @override
  String get genderFemale => 'Donna';

  @override
  String get genderMale => 'Uomo';

  @override
  String get profileGenderError => 'Seleziona un\'opzione';

  @override
  String get profileActivityLabel => 'Attività fisica';

  @override
  String get activityLow => 'Bassa';

  @override
  String get activityModerate => 'Moderata';

  @override
  String get activityHigh => 'Alta';

  @override
  String get activityLowDesc => 'Poco o nessun esercizio durante la settimana.';

  @override
  String get activityModerateDesc => 'Esercizio da 3 a 5 giorni a settimana.';

  @override
  String get activityHighDesc => 'Esercizio intenso quasi tutti i giorni.';

  @override
  String get profileActivityError => 'Seleziona il tuo livello di attività';

  @override
  String get profileCalculate => 'Calcola il mio obiettivo';

  @override
  String get profileGoalTitle => 'Il tuo obiettivo giornaliero';

  @override
  String get profileGoalHint =>
      'Questo calcolo è indicativo. Se hai esigenze di salute specifiche, consulta un professionista sanitario.';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get settingsReminders => 'Ricevi promemoria';

  @override
  String get settingsNotificationsBlocked =>
      'Le notifiche sono disattivate per questa app.';

  @override
  String get settingsEnable => 'Attiva';

  @override
  String get settingsPrivacy => 'Opzioni sulla privacy';

  @override
  String get settingsPrivacyPolicy => 'Informativa sulla privacy';

  @override
  String get notificationTitle => 'È ora di bere acqua! 💧';

  @override
  String notificationBodyProgress(String p1, String p2) {
    return 'Hai bevuto $p1 su $p2. Bevi un bicchiere ora e continua così.';
  }

  @override
  String get notificationBodyGoalReached =>
      'Hai già raggiunto l\'obiettivo di oggi! Continua così.';

  @override
  String get notificationBodyNoProfile =>
      'Calcola il tuo obiettivo giornaliero e prenditi cura della tua idratazione.';

  @override
  String get reminderChannelName => 'Promemoria';

  @override
  String get reminderChannelDescription =>
      'Notifiche per ricordarti di bere acqua.';

  @override
  String get streakNone => 'Nessuna serie per ora';

  @override
  String get streakStartHint =>
      'Raggiungi l\'obiettivo oggi per iniziare una serie.';

  @override
  String get streakKeepHint => 'Raggiungi l\'obiettivo oggi per mantenerla.';

  @override
  String get streakCompletedToday => 'Oggi hai aggiunto un altro giorno!';

  @override
  String get streakBest => 'Record';

  @override
  String get remindersTitle => 'Promemoria';

  @override
  String get reminderSummaryOff => 'Disattivati';

  @override
  String get reminderSummaryNoDays => 'Scegli almeno un giorno';

  @override
  String reminderSummaryOnce(String p1) {
    return 'Alle $p1';
  }

  @override
  String reminderSummaryInterval(String p1, String p2, String p3) {
    return 'Ogni $p1, dalle $p2 alle $p3';
  }

  @override
  String get reminderSummaryEveryDay => 'tutti i giorni';

  @override
  String get reminderFrequency => 'Frequenza';

  @override
  String get reminderFrequencyOnce => 'Una volta al giorno';

  @override
  String durationHours(int p1) {
    return '$p1 h';
  }

  @override
  String durationHoursMinutes(int p1, int p2) {
    return '$p1 h $p2 min';
  }

  @override
  String get reminderTime => 'Ora';

  @override
  String get reminderFrom => 'Dalle';

  @override
  String get reminderUntil => 'Alle';

  @override
  String get reminderDays => 'Giorni';

  @override
  String get reminderSkipWhenReached => 'Silenzia a obiettivo raggiunto';

  @override
  String get reminderSkipWhenReachedDesc =>
      'Non riceverai altri promemoria quel giorno.';

  @override
  String get premiumDesc =>
      'Goditi HydroDaily senza pubblicità. Scegli un pagamento unico per sempre o un abbonamento mensile.';

  @override
  String get premiumActive => 'Sei Premium. Grazie per il tuo supporto!';

  @override
  String get premiumRestore => 'Ripristina acquisto';

  @override
  String get premiumPending => 'Acquisto in attesa di conferma…';

  @override
  String get premiumErrorStore =>
      'Lo store non è disponibile al momento. Riprova più tardi.';

  @override
  String get premiumErrorProduct =>
      'Impossibile caricare il prodotto. Riprova più tardi.';

  @override
  String get premiumErrorFailed => 'Impossibile completare l\'acquisto.';

  @override
  String get premiumNothingToRestore => 'Nessun acquisto da ripristinare.';

  @override
  String get premiumRestored => 'Acquisto ripristinato. Niente più pubblicità!';

  @override
  String get premiumActiveMonthly =>
      'Il tuo abbonamento senza pubblicità è attivo. Grazie per il tuo supporto!';

  @override
  String premiumBuyLifetime(String p1) {
    return 'Per sempre a $p1';
  }

  @override
  String get premiumBuyLifetimeNoPrice => 'Rimuovi la pubblicità per sempre';

  @override
  String premiumBuyMonthly(String p1) {
    return '$p1 al mese';
  }

  @override
  String get premiumBuyMonthlyNoPrice => 'Abbonamento mensile';

  @override
  String get premiumManageSubscription => 'Gestisci o annulla l\'abbonamento';

  @override
  String streakCurrent(int p1) {
    String _temp0 = intl.Intl.pluralLogic(
      p1,
      locale: localeName,
      other: '$p1 giorni di fila',
      many: '$p1 giorni di fila',
      one: '$p1 giorno di fila',
    );
    return '$_temp0';
  }

  @override
  String notificationBodyStreak(String p1, String p2, int p3) {
    String _temp0 = intl.Intl.pluralLogic(
      p3,
      locale: localeName,
      other: 'Hai bevuto $p1 su $p2. Non perdere la tua serie di $p3 giorni!',
      many: 'Hai bevuto $p1 su $p2. Non perdere la tua serie di $p3 giorni!',
      one: 'Hai bevuto $p1 su $p2. Non perdere la tua serie di $p3 giorno!',
    );
    return '$_temp0';
  }

  @override
  String get premiumHeadline => 'Passa a Premium';

  @override
  String get premiumBenefitNoAds => 'Senza pubblicità';

  @override
  String get premiumLoading => 'Caricamento del prezzo…';

  @override
  String get premiumLegal =>
      'L\'abbonamento si rinnova ogni mese e puoi annullarlo quando vuoi dalle impostazioni del tuo account App Store.';

  @override
  String get termsOfUse => 'Termini di utilizzo';

  @override
  String get notificationBodyGeneric =>
      'Bevi un bicchiere d\'acqua e avvicinati al tuo obiettivo di oggi.';

  @override
  String get premiumTitle => 'HydroDaily Premium';

  @override
  String premiumMonthly(String p1) {
    return '$p1 al mese';
  }

  @override
  String premiumLifetime(String p1) {
    return 'Per sempre a $p1';
  }

  @override
  String get premiumStoreUnavailable =>
      'Lo store non è disponibile al momento. Riprova più tardi.';

  @override
  String get privacyPolicy => 'Informativa sulla privacy';

  @override
  String get privacyOptions => 'Opzioni sulla privacy';
}
