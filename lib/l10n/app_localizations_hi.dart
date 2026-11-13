// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class LHi extends L {
  LHi([String locale = 'hi']) : super(locale);

  @override
  String get navToday => 'आज';

  @override
  String get navProfile => 'प्रोफ़ाइल';

  @override
  String get todayTitle => 'आपका हाइड्रेशन';

  @override
  String todayOfGoal(String p1) {
    return '$p1 में से';
  }

  @override
  String todayRemaining(String p1) {
    return 'लक्ष्य तक पहुँचने के लिए $p1 बाकी';
  }

  @override
  String get todayGoalReached => 'लक्ष्य पूरा हुआ! पानी पीते रहें 💧';

  @override
  String get todayAddTitle => 'पानी जोड़ें';

  @override
  String get todayUndo => 'पूर्ववत करें';

  @override
  String get todayNoProfileTitle => 'अपनी प्रोफ़ाइल सेट करें';

  @override
  String get todayNoProfileBody =>
      'आप कितना पानी पीते हैं, यह दर्ज करना शुरू करने के लिए अपना दैनिक लक्ष्य निकालें।';

  @override
  String get todayNoProfileAction => 'मेरा लक्ष्य निकालें';

  @override
  String get statGoal => 'लक्ष्य';

  @override
  String get statRemaining => 'बाकी';

  @override
  String get statEntries => 'प्रविष्टियाँ';

  @override
  String get profileTitle => 'आपकी प्रोफ़ाइल';

  @override
  String get profileSubtitle => 'जानें कि आपको रोज़ कितने पानी की ज़रूरत है';

  @override
  String get profileWeightLabel => 'वज़न';

  @override
  String get profileWeightError => '20 से 300 किलो के बीच वज़न दर्ज करें';

  @override
  String get profileGenderLabel => 'लिंग';

  @override
  String get genderFemale => 'महिला';

  @override
  String get genderMale => 'पुरुष';

  @override
  String get profileGenderError => 'एक विकल्प चुनें';

  @override
  String get profileActivityLabel => 'शारीरिक गतिविधि';

  @override
  String get activityLow => 'कम';

  @override
  String get activityModerate => 'मध्यम';

  @override
  String get activityHigh => 'अधिक';

  @override
  String get activityLowDesc => 'सप्ताह में बहुत कम या कोई व्यायाम नहीं।';

  @override
  String get activityModerateDesc => 'सप्ताह में 3 से 5 दिन व्यायाम।';

  @override
  String get activityHighDesc => 'लगभग हर दिन तीव्र व्यायाम।';

  @override
  String get profileActivityError => 'अपना गतिविधि स्तर चुनें';

  @override
  String get profileCalculate => 'मेरा लक्ष्य निकालें';

  @override
  String get profileGoalTitle => 'आपका दैनिक लक्ष्य';

  @override
  String get profileGoalHint =>
      'यह गणना केवल अनुमान है। यदि आपकी कोई विशेष स्वास्थ्य ज़रूरत है, तो किसी स्वास्थ्य विशेषज्ञ से सलाह लें।';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsReminders => 'रिमाइंडर पाएँ';

  @override
  String get settingsNotificationsBlocked => 'इस ऐप के लिए सूचनाएँ बंद हैं।';

  @override
  String get settingsEnable => 'चालू करें';

  @override
  String get settingsPrivacy => 'गोपनीयता विकल्प';

  @override
  String get settingsPrivacyPolicy => 'गोपनीयता नीति';

  @override
  String get notificationTitle => 'पानी पीने का समय! 💧';

  @override
  String notificationBodyProgress(String p1, String p2) {
    return 'आपने $p2 में से $p1 पानी पिया है। अभी एक गिलास पिएँ और जारी रखें।';
  }

  @override
  String get notificationBodyGoalReached =>
      'आपने आज का लक्ष्य पूरा कर लिया है! ऐसे ही जारी रखें।';

  @override
  String get notificationBodyNoProfile =>
      'अपना दैनिक लक्ष्य निकालें और अपने हाइड्रेशन का ध्यान रखें।';

  @override
  String get reminderChannelName => 'रिमाइंडर';

  @override
  String get reminderChannelDescription =>
      'पानी पीने की याद दिलाने वाली सूचनाएँ।';

  @override
  String get streakNone => 'अभी कोई स्ट्रीक नहीं';

  @override
  String get streakStartHint =>
      'स्ट्रीक शुरू करने के लिए आज अपना लक्ष्य पूरा करें।';

  @override
  String get streakKeepHint => 'इसे जारी रखने के लिए आज अपना लक्ष्य पूरा करें।';

  @override
  String get streakCompletedToday => 'आज आपने एक और दिन जोड़ लिया!';

  @override
  String get streakBest => 'सर्वश्रेष्ठ';

  @override
  String get remindersTitle => 'रिमाइंडर';

  @override
  String get reminderSummaryOff => 'बंद';

  @override
  String get reminderSummaryNoDays => 'कम से कम एक दिन चुनें';

  @override
  String reminderSummaryOnce(String p1) {
    return '$p1 बजे';
  }

  @override
  String reminderSummaryInterval(String p1, String p2, String p3) {
    return 'हर $p1, $p2 से $p3 तक';
  }

  @override
  String get reminderSummaryEveryDay => 'हर दिन';

  @override
  String get reminderFrequency => 'आवृत्ति';

  @override
  String get reminderFrequencyOnce => 'दिन में एक बार';

  @override
  String durationHours(int p1) {
    return '$p1 घंटे';
  }

  @override
  String durationHoursMinutes(int p1, int p2) {
    return '$p1 घंटे $p2 मिनट';
  }

  @override
  String get reminderTime => 'समय';

  @override
  String get reminderFrom => 'से';

  @override
  String get reminderUntil => 'तक';

  @override
  String get reminderDays => 'दिन';

  @override
  String get reminderSkipWhenReached => 'लक्ष्य पूरा होने पर म्यूट करें';

  @override
  String get reminderSkipWhenReachedDesc =>
      'उस दिन आपको और रिमाइंडर नहीं मिलेंगे।';

  @override
  String get premiumDesc =>
      'बिना विज्ञापनों के HydroDaily का आनंद लें। हमेशा के लिए एकमुश्त भुगतान या मासिक सदस्यता चुनें।';

  @override
  String get premiumActive => 'आप Premium हैं। आपके समर्थन के लिए धन्यवाद!';

  @override
  String get premiumRestore => 'खरीदारी बहाल करें';

  @override
  String get premiumPending => 'खरीदारी की पुष्टि लंबित है…';

  @override
  String get premiumErrorStore =>
      'स्टोर अभी उपलब्ध नहीं है। कृपया बाद में फिर से कोशिश करें।';

  @override
  String get premiumErrorProduct =>
      'उत्पाद लोड नहीं हो सका। कृपया बाद में फिर से कोशिश करें।';

  @override
  String get premiumErrorFailed => 'खरीदारी पूरी नहीं हो सकी।';

  @override
  String get premiumNothingToRestore =>
      'बहाल करने के लिए कोई खरीदारी नहीं मिली।';

  @override
  String get premiumRestored => 'खरीदारी बहाल हो गई। अब कोई विज्ञापन नहीं!';

  @override
  String get premiumActiveMonthly =>
      'आपकी विज्ञापन-मुक्त सदस्यता सक्रिय है। आपके समर्थन के लिए धन्यवाद!';

  @override
  String premiumBuyLifetime(String p1) {
    return '$p1 में हमेशा के लिए';
  }

  @override
  String get premiumBuyLifetimeNoPrice => 'विज्ञापन हमेशा के लिए हटाएँ';

  @override
  String premiumBuyMonthly(String p1) {
    return '$p1 प्रति माह';
  }

  @override
  String get premiumBuyMonthlyNoPrice => 'मासिक सदस्यता';

  @override
  String get premiumManageSubscription => 'सदस्यता प्रबंधित करें या रद्द करें';

  @override
  String streakCurrent(int p1) {
    String _temp0 = intl.Intl.pluralLogic(
      p1,
      locale: localeName,
      other: 'लगातार $p1 दिन',
      one: 'लगातार $p1 दिन',
    );
    return '$_temp0';
  }

  @override
  String notificationBodyStreak(String p1, String p2, int p3) {
    String _temp0 = intl.Intl.pluralLogic(
      p3,
      locale: localeName,
      other:
          'आपने $p2 में से $p1 पी लिया है। अपनी $p3 दिन की स्ट्रीक न टूटने दें!',
      one:
          'आपने $p2 में से $p1 पी लिया है। अपनी $p3 दिन की स्ट्रीक न टूटने दें!',
    );
    return '$_temp0';
  }

  @override
  String get premiumHeadline => 'Premium लें';

  @override
  String get premiumBenefitNoAds => 'कोई विज्ञापन नहीं';

  @override
  String get premiumLoading => 'कीमत लोड हो रही है…';

  @override
  String get premiumLegal =>
      'सदस्यता हर महीने नवीनीकृत होती है और आप इसे कभी भी अपने App Store खाते की सेटिंग में रद्द कर सकते हैं।';

  @override
  String get termsOfUse => 'उपयोग की शर्तें';

  @override
  String get notificationBodyGeneric =>
      'एक गिलास पानी पिएँ और आज के लक्ष्य के करीब पहुँचें।';

  @override
  String get premiumTitle => 'HydroDaily Premium';

  @override
  String premiumMonthly(String p1) {
    return '$p1 प्रति माह';
  }

  @override
  String premiumLifetime(String p1) {
    return '$p1 में हमेशा के लिए';
  }

  @override
  String get premiumStoreUnavailable =>
      'स्टोर अभी उपलब्ध नहीं है। कृपया बाद में फिर से कोशिश करें।';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get privacyOptions => 'गोपनीयता विकल्प';
}
