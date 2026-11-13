// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class LFr extends L {
  LFr([String locale = 'fr']) : super(locale);

  @override
  String get navToday => 'Aujourd\'hui';

  @override
  String get navProfile => 'Profil';

  @override
  String get todayTitle => 'Votre hydratation';

  @override
  String todayOfGoal(String p1) {
    return 'sur $p1';
  }

  @override
  String todayRemaining(String p1) {
    return 'Encore $p1 pour atteindre votre objectif';
  }

  @override
  String get todayGoalReached =>
      'Objectif atteint ! Continuez à vous hydrater 💧';

  @override
  String get todayAddTitle => 'Ajouter de l\'eau';

  @override
  String get todayUndo => 'Annuler';

  @override
  String get todayNoProfileTitle => 'Configurez votre profil';

  @override
  String get todayNoProfileBody =>
      'Calculez votre objectif quotidien d\'eau pour commencer à suivre ce que vous buvez.';

  @override
  String get todayNoProfileAction => 'Calculer mon objectif';

  @override
  String get statGoal => 'Objectif';

  @override
  String get statRemaining => 'Restant';

  @override
  String get statEntries => 'Prises';

  @override
  String get profileTitle => 'Votre profil';

  @override
  String get profileSubtitle =>
      'Découvrez de combien d\'eau vous avez besoin chaque jour';

  @override
  String get profileWeightLabel => 'Poids';

  @override
  String get profileWeightError => 'Saisissez un poids entre 20 et 300 kg';

  @override
  String get profileGenderLabel => 'Sexe';

  @override
  String get genderFemale => 'Femme';

  @override
  String get genderMale => 'Homme';

  @override
  String get profileGenderError => 'Sélectionnez une option';

  @override
  String get profileActivityLabel => 'Activité physique';

  @override
  String get activityLow => 'Faible';

  @override
  String get activityModerate => 'Modérée';

  @override
  String get activityHigh => 'Élevée';

  @override
  String get activityLowDesc => 'Peu ou pas d\'exercice dans la semaine.';

  @override
  String get activityModerateDesc => 'Exercice 3 à 5 jours par semaine.';

  @override
  String get activityHighDesc => 'Exercice intense presque tous les jours.';

  @override
  String get profileActivityError => 'Sélectionnez votre niveau d\'activité';

  @override
  String get profileCalculate => 'Calculer mon objectif';

  @override
  String get profileGoalTitle => 'Votre objectif quotidien';

  @override
  String get profileGoalHint =>
      'Ce calcul est indicatif. Si vous avez des besoins de santé spécifiques, consultez un professionnel de santé.';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsReminders => 'Recevoir des rappels';

  @override
  String get settingsNotificationsBlocked =>
      'Les notifications sont désactivées pour cette application.';

  @override
  String get settingsEnable => 'Activer';

  @override
  String get settingsPrivacy => 'Options de confidentialité';

  @override
  String get settingsPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get notificationTitle => 'C\'est l\'heure de boire de l\'eau ! 💧';

  @override
  String notificationBodyProgress(String p1, String p2) {
    return 'Vous avez bu $p1 sur $p2. Buvez un verre maintenant et continuez.';
  }

  @override
  String get notificationBodyGoalReached =>
      'Vous avez déjà atteint votre objectif du jour ! Continuez ainsi.';

  @override
  String get notificationBodyNoProfile =>
      'Calculez votre objectif quotidien et prenez soin de votre hydratation.';

  @override
  String get reminderChannelName => 'Rappels';

  @override
  String get reminderChannelDescription =>
      'Notifications pour vous rappeler de boire de l\'eau.';

  @override
  String get streakNone => 'Pas encore de série';

  @override
  String get streakStartHint =>
      'Atteignez votre objectif aujourd\'hui pour lancer une série.';

  @override
  String get streakKeepHint =>
      'Atteignez votre objectif aujourd\'hui pour la prolonger.';

  @override
  String get streakCompletedToday => 'Un jour de plus validé aujourd\'hui !';

  @override
  String get streakBest => 'Record';

  @override
  String get remindersTitle => 'Rappels';

  @override
  String get reminderSummaryOff => 'Désactivés';

  @override
  String get reminderSummaryNoDays => 'Choisissez au moins un jour';

  @override
  String reminderSummaryOnce(String p1) {
    return 'À $p1';
  }

  @override
  String reminderSummaryInterval(String p1, String p2, String p3) {
    return 'Toutes les $p1, de $p2 à $p3';
  }

  @override
  String get reminderSummaryEveryDay => 'tous les jours';

  @override
  String get reminderFrequency => 'Fréquence';

  @override
  String get reminderFrequencyOnce => 'Une fois par jour';

  @override
  String durationHours(int p1) {
    return '$p1 h';
  }

  @override
  String durationHoursMinutes(int p1, int p2) {
    return '$p1 h $p2';
  }

  @override
  String get reminderTime => 'Heure';

  @override
  String get reminderFrom => 'De';

  @override
  String get reminderUntil => 'À';

  @override
  String get reminderDays => 'Jours';

  @override
  String get reminderSkipWhenReached => 'Silence une fois l\'objectif atteint';

  @override
  String get reminderSkipWhenReachedDesc =>
      'Vous ne recevrez plus de rappels ce jour-là.';

  @override
  String get premiumDesc =>
      'Profitez de HydroDaily sans publicité. Choisissez un paiement unique à vie ou un abonnement mensuel.';

  @override
  String get premiumActive => 'Vous êtes Premium. Merci pour votre soutien !';

  @override
  String get premiumRestore => 'Restaurer l\'achat';

  @override
  String get premiumPending => 'Achat en attente de confirmation…';

  @override
  String get premiumErrorStore =>
      'Le store n\'est pas disponible pour le moment. Réessayez plus tard.';

  @override
  String get premiumErrorProduct =>
      'Impossible de charger le produit. Réessayez plus tard.';

  @override
  String get premiumErrorFailed => 'L\'achat n\'a pas pu être finalisé.';

  @override
  String get premiumNothingToRestore => 'Aucun achat à restaurer.';

  @override
  String get premiumRestored => 'Achat restauré. Fini les publicités !';

  @override
  String get premiumActiveMonthly =>
      'Votre abonnement sans publicité est actif. Merci pour votre soutien !';

  @override
  String premiumBuyLifetime(String p1) {
    return 'À vie pour $p1';
  }

  @override
  String get premiumBuyLifetimeNoPrice => 'Supprimer les pubs à vie';

  @override
  String premiumBuyMonthly(String p1) {
    return '$p1 par mois';
  }

  @override
  String get premiumBuyMonthlyNoPrice => 'Abonnement mensuel';

  @override
  String get premiumManageSubscription => 'Gérer ou résilier l\'abonnement';

  @override
  String streakCurrent(int p1) {
    String _temp0 = intl.Intl.pluralLogic(
      p1,
      locale: localeName,
      other: '$p1 jours d\'affilée',
      many: '$p1 jours d\'affilée',
      one: '$p1 jour d\'affilée',
    );
    return '$_temp0';
  }

  @override
  String notificationBodyStreak(String p1, String p2, int p3) {
    String _temp0 = intl.Intl.pluralLogic(
      p3,
      locale: localeName,
      other:
          'Vous avez bu $p1 sur $p2. Ne perdez pas votre série de $p3 jours !',
      many:
          'Vous avez bu $p1 sur $p2. Ne perdez pas votre série de $p3 jours !',
      one: 'Vous avez bu $p1 sur $p2. Ne perdez pas votre série de $p3 jour !',
    );
    return '$_temp0';
  }

  @override
  String get premiumHeadline => 'Passez à Premium';

  @override
  String get premiumBenefitNoAds => 'Sans publicité';

  @override
  String get premiumLoading => 'Chargement du prix…';

  @override
  String get premiumLegal =>
      'L\'abonnement se renouvelle chaque mois et vous pouvez le résilier à tout moment dans les réglages de votre compte App Store.';

  @override
  String get termsOfUse => 'Conditions d\'utilisation';

  @override
  String get notificationBodyGeneric =>
      'Buvez un verre d\'eau et rapprochez-vous de votre objectif du jour.';

  @override
  String get premiumTitle => 'HydroDaily Premium';

  @override
  String premiumMonthly(String p1) {
    return '$p1 par mois';
  }

  @override
  String premiumLifetime(String p1) {
    return 'À vie pour $p1';
  }

  @override
  String get premiumStoreUnavailable =>
      'Le store n\'est pas disponible pour le moment. Réessayez plus tard.';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get privacyOptions => 'Options de confidentialité';
}
