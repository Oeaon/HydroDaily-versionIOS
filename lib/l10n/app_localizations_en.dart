// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class LEn extends L {
  LEn([String locale = 'en']) : super(locale);

  @override
  String get navToday => 'Today';

  @override
  String get navProfile => 'Profile';

  @override
  String get todayTitle => 'Your hydration';

  @override
  String todayOfGoal(String p1) {
    return 'of $p1';
  }

  @override
  String todayRemaining(String p1) {
    return '$p1 left to reach your goal';
  }

  @override
  String get todayGoalReached => 'Goal reached! Keep staying hydrated 💧';

  @override
  String get todayAddTitle => 'Add water';

  @override
  String get todayUndo => 'Undo';

  @override
  String get todayNoProfileTitle => 'Set up your profile';

  @override
  String get todayNoProfileBody =>
      'Calculate your daily water goal to start tracking what you drink.';

  @override
  String get todayNoProfileAction => 'Calculate my goal';

  @override
  String get statGoal => 'Goal';

  @override
  String get statRemaining => 'Left';

  @override
  String get statEntries => 'Entries';

  @override
  String get profileTitle => 'Your profile';

  @override
  String get profileSubtitle => 'Find out how much water you need every day';

  @override
  String get profileWeightLabel => 'Weight';

  @override
  String get profileWeightError => 'Enter a weight between 20 and 300 kg';

  @override
  String get profileGenderLabel => 'Sex';

  @override
  String get genderFemale => 'Female';

  @override
  String get genderMale => 'Male';

  @override
  String get profileGenderError => 'Select an option';

  @override
  String get profileActivityLabel => 'Physical activity';

  @override
  String get activityLow => 'Low';

  @override
  String get activityModerate => 'Moderate';

  @override
  String get activityHigh => 'High';

  @override
  String get activityLowDesc => 'Little or no exercise during the week.';

  @override
  String get activityModerateDesc => 'Exercise 3 to 5 days a week.';

  @override
  String get activityHighDesc => 'Intense exercise almost every day.';

  @override
  String get profileActivityError => 'Select your activity level';

  @override
  String get profileCalculate => 'Calculate my goal';

  @override
  String get profileGoalTitle => 'Your daily goal';

  @override
  String get profileGoalHint =>
      'This is an estimate. If you have specific health needs, please consult a healthcare professional.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsReminders => 'Get reminders';

  @override
  String get settingsNotificationsBlocked =>
      'Notifications are turned off for this app.';

  @override
  String get settingsEnable => 'Turn on';

  @override
  String get settingsPrivacy => 'Privacy options';

  @override
  String get settingsPrivacyPolicy => 'Privacy policy';

  @override
  String get notificationTitle => 'Time to drink water! 💧';

  @override
  String notificationBodyProgress(String p1, String p2) {
    return 'You\'ve had $p1 of $p2. Drink a glass now and keep going.';
  }

  @override
  String get notificationBodyGoalReached =>
      'You\'ve already reached today\'s goal! Keep it up.';

  @override
  String get notificationBodyNoProfile =>
      'Calculate your daily goal and start taking care of your hydration.';

  @override
  String get reminderChannelName => 'Reminders';

  @override
  String get reminderChannelDescription =>
      'Notifications to remind you to drink water.';

  @override
  String get streakNone => 'No streak yet';

  @override
  String get streakStartHint => 'Reach your goal today to start a streak.';

  @override
  String get streakKeepHint => 'Reach your goal today to keep it going.';

  @override
  String get streakCompletedToday => 'You\'ve added another day today!';

  @override
  String get streakBest => 'Best';

  @override
  String get remindersTitle => 'Reminders';

  @override
  String get reminderSummaryOff => 'Off';

  @override
  String get reminderSummaryNoDays => 'Choose at least one day';

  @override
  String reminderSummaryOnce(String p1) {
    return 'At $p1';
  }

  @override
  String reminderSummaryInterval(String p1, String p2, String p3) {
    return 'Every $p1, from $p2 to $p3';
  }

  @override
  String get reminderSummaryEveryDay => 'every day';

  @override
  String get reminderFrequency => 'Frequency';

  @override
  String get reminderFrequencyOnce => 'Once a day';

  @override
  String durationHours(int p1) {
    return '$p1 h';
  }

  @override
  String durationHoursMinutes(int p1, int p2) {
    return '$p1 h $p2 min';
  }

  @override
  String get reminderTime => 'Time';

  @override
  String get reminderFrom => 'From';

  @override
  String get reminderUntil => 'Until';

  @override
  String get reminderDays => 'Days';

  @override
  String get reminderSkipWhenReached => 'Mute once goal is reached';

  @override
  String get reminderSkipWhenReachedDesc =>
      'You won\'t get more reminders that day.';

  @override
  String get premiumDesc =>
      'Enjoy HydroDaily without ads. Choose a one-time payment for life or a monthly subscription.';

  @override
  String get premiumActive => 'You\'re Premium. Thanks for your support!';

  @override
  String get premiumRestore => 'Restore purchase';

  @override
  String get premiumPending => 'Purchase pending confirmation…';

  @override
  String get premiumErrorStore =>
      'The store isn\'t available right now. Please try again later.';

  @override
  String get premiumErrorProduct =>
      'The product couldn\'t be loaded. Please try again later.';

  @override
  String get premiumErrorFailed => 'The purchase couldn\'t be completed.';

  @override
  String get premiumNothingToRestore => 'No purchases found to restore.';

  @override
  String get premiumRestored => 'Purchase restored. No more ads!';

  @override
  String get premiumActiveMonthly =>
      'Your ad-free subscription is active. Thanks for your support!';

  @override
  String premiumBuyLifetime(String p1) {
    return 'Forever for $p1';
  }

  @override
  String get premiumBuyLifetimeNoPrice => 'Remove ads forever';

  @override
  String premiumBuyMonthly(String p1) {
    return '$p1 per month';
  }

  @override
  String get premiumBuyMonthlyNoPrice => 'Monthly subscription';

  @override
  String get premiumManageSubscription => 'Manage or cancel subscription';

  @override
  String streakCurrent(int p1) {
    String _temp0 = intl.Intl.pluralLogic(
      p1,
      locale: localeName,
      other: '$p1 days in a row',
      one: '$p1 day in a row',
    );
    return '$_temp0';
  }

  @override
  String notificationBodyStreak(String p1, String p2, int p3) {
    String _temp0 = intl.Intl.pluralLogic(
      p3,
      locale: localeName,
      other: 'You\'ve had $p1 of $p2. Don\'t lose your $p3-day streak!',
      one: 'You\'ve had $p1 of $p2. Don\'t lose your $p3-day streak!',
    );
    return '$_temp0';
  }

  @override
  String get premiumHeadline => 'Go Premium';

  @override
  String get premiumBenefitNoAds => 'No ads';

  @override
  String get premiumLoading => 'Loading price…';

  @override
  String get premiumLegal =>
      'The subscription renews every month and you can cancel it anytime in your App Store account settings.';

  @override
  String get termsOfUse => 'Terms of use';

  @override
  String get notificationBodyGeneric =>
      'Drink a glass of water and get closer to today\'s goal.';

  @override
  String get premiumTitle => 'HydroDaily Premium';

  @override
  String premiumMonthly(String p1) {
    return '$p1 per month';
  }

  @override
  String premiumLifetime(String p1) {
    return 'Forever for $p1';
  }

  @override
  String get premiumStoreUnavailable =>
      'The store isn\'t available right now. Please try again later.';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get privacyOptions => 'Privacy options';
}
