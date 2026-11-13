// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class LAr extends L {
  LAr([String locale = 'ar']) : super(locale);

  @override
  String get navToday => 'اليوم';

  @override
  String get navProfile => 'الملف الشخصي';

  @override
  String get todayTitle => 'ترطيبك اليومي';

  @override
  String todayOfGoal(String p1) {
    return 'من $p1';
  }

  @override
  String todayRemaining(String p1) {
    return 'تبقّى $p1 للوصول إلى هدفك';
  }

  @override
  String get todayGoalReached => 'تم تحقيق الهدف! استمر في شرب الماء 💧';

  @override
  String get todayAddTitle => 'إضافة ماء';

  @override
  String get todayUndo => 'تراجع';

  @override
  String get todayNoProfileTitle => 'أعدّ ملفك الشخصي';

  @override
  String get todayNoProfileBody =>
      'احسب هدفك اليومي من الماء لتبدأ بتسجيل ما تشربه.';

  @override
  String get todayNoProfileAction => 'احسب هدفي';

  @override
  String get statGoal => 'الهدف';

  @override
  String get statRemaining => 'المتبقي';

  @override
  String get statEntries => 'السجلات';

  @override
  String get profileTitle => 'ملفك الشخصي';

  @override
  String get profileSubtitle => 'اعرف كمية الماء التي تحتاجها كل يوم';

  @override
  String get profileWeightLabel => 'الوزن';

  @override
  String get profileWeightError => 'أدخل وزنًا بين 20 و300 كغ';

  @override
  String get profileGenderLabel => 'الجنس';

  @override
  String get genderFemale => 'أنثى';

  @override
  String get genderMale => 'ذكر';

  @override
  String get profileGenderError => 'اختر أحد الخيارات';

  @override
  String get profileActivityLabel => 'النشاط البدني';

  @override
  String get activityLow => 'منخفض';

  @override
  String get activityModerate => 'متوسط';

  @override
  String get activityHigh => 'مرتفع';

  @override
  String get activityLowDesc => 'تمارين قليلة أو بدون تمارين خلال الأسبوع.';

  @override
  String get activityModerateDesc => 'تمارين من 3 إلى 5 أيام في الأسبوع.';

  @override
  String get activityHighDesc => 'تمارين مكثفة كل يوم تقريبًا.';

  @override
  String get profileActivityError => 'اختر مستوى نشاطك';

  @override
  String get profileCalculate => 'احسب هدفي';

  @override
  String get profileGoalTitle => 'هدفك اليومي';

  @override
  String get profileGoalHint =>
      'هذا الحساب تقديري فقط. إذا كانت لديك احتياجات صحية خاصة، فاستشر أخصائيًا صحيًا.';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsReminders => 'تلقي التذكيرات';

  @override
  String get settingsNotificationsBlocked => 'الإشعارات متوقفة لهذا التطبيق.';

  @override
  String get settingsEnable => 'تفعيل';

  @override
  String get settingsPrivacy => 'خيارات الخصوصية';

  @override
  String get settingsPrivacyPolicy => 'سياسة الخصوصية';

  @override
  String get notificationTitle => 'حان وقت شرب الماء! 💧';

  @override
  String notificationBodyProgress(String p1, String p2) {
    return 'شربت $p1 من $p2. اشرب كوبًا الآن واستمر.';
  }

  @override
  String get notificationBodyGoalReached =>
      'لقد حققت هدف اليوم بالفعل! أحسنت، استمر.';

  @override
  String get notificationBodyNoProfile =>
      'احسب هدفك اليومي وابدأ بالاهتمام بترطيب جسمك.';

  @override
  String get reminderChannelName => 'التذكيرات';

  @override
  String get reminderChannelDescription => 'إشعارات لتذكيرك بشرب الماء.';

  @override
  String get streakNone => 'لا توجد سلسلة بعد';

  @override
  String get streakStartHint => 'حقق هدفك اليوم لتبدأ سلسلة.';

  @override
  String get streakKeepHint => 'حقق هدفك اليوم لتحافظ عليها.';

  @override
  String get streakCompletedToday => 'أضفت يومًا جديدًا اليوم!';

  @override
  String get streakBest => 'الأفضل';

  @override
  String get remindersTitle => 'التذكيرات';

  @override
  String get reminderSummaryOff => 'متوقفة';

  @override
  String get reminderSummaryNoDays => 'اختر يومًا واحدًا على الأقل';

  @override
  String reminderSummaryOnce(String p1) {
    return 'الساعة $p1';
  }

  @override
  String reminderSummaryInterval(String p1, String p2, String p3) {
    return 'كل $p1، من $p2 إلى $p3';
  }

  @override
  String get reminderSummaryEveryDay => 'كل يوم';

  @override
  String get reminderFrequency => 'التكرار';

  @override
  String get reminderFrequencyOnce => 'مرة واحدة يوميًا';

  @override
  String durationHours(int p1) {
    return '$p1 س';
  }

  @override
  String durationHoursMinutes(int p1, int p2) {
    return '$p1 س $p2 د';
  }

  @override
  String get reminderTime => 'الوقت';

  @override
  String get reminderFrom => 'من';

  @override
  String get reminderUntil => 'إلى';

  @override
  String get reminderDays => 'الأيام';

  @override
  String get reminderSkipWhenReached => 'كتم الصوت عند تحقيق الهدف';

  @override
  String get reminderSkipWhenReachedDesc =>
      'لن تتلقى مزيدًا من التذكيرات في ذلك اليوم.';

  @override
  String get premiumDesc =>
      'استمتع بـ HydroDaily دون إعلانات. اختر دفعة واحدة مدى الحياة أو اشتراكًا شهريًا.';

  @override
  String get premiumActive => 'أنت مشترك في Premium. شكرًا لدعمك!';

  @override
  String get premiumRestore => 'استعادة الشراء';

  @override
  String get premiumPending => 'الشراء بانتظار التأكيد…';

  @override
  String get premiumErrorStore =>
      'المتجر غير متاح حاليًا. حاول مرة أخرى لاحقًا.';

  @override
  String get premiumErrorProduct => 'تعذّر تحميل المنتج. حاول مرة أخرى لاحقًا.';

  @override
  String get premiumErrorFailed => 'تعذّر إتمام الشراء.';

  @override
  String get premiumNothingToRestore => 'لم يتم العثور على مشتريات لاستعادتها.';

  @override
  String get premiumRestored => 'تمت استعادة الشراء. لا مزيد من الإعلانات!';

  @override
  String get premiumActiveMonthly =>
      'اشتراكك الخالي من الإعلانات نشط. شكرًا لدعمك!';

  @override
  String premiumBuyLifetime(String p1) {
    return 'مدى الحياة مقابل $p1';
  }

  @override
  String get premiumBuyLifetimeNoPrice => 'إزالة الإعلانات مدى الحياة';

  @override
  String premiumBuyMonthly(String p1) {
    return '$p1 شهريًا';
  }

  @override
  String get premiumBuyMonthlyNoPrice => 'اشتراك شهري';

  @override
  String get premiumManageSubscription => 'إدارة الاشتراك أو إلغاؤه';

  @override
  String streakCurrent(int p1) {
    String _temp0 = intl.Intl.pluralLogic(
      p1,
      locale: localeName,
      other: '$p1 يوم متتالٍ',
      many: '$p1 يومًا متتاليًا',
      few: '$p1 أيام متتالية',
      two: '$p1 يومان متتاليان',
      one: '$p1 يوم متتالٍ',
      zero: '$p1 يوم متتالٍ',
    );
    return '$_temp0';
  }

  @override
  String notificationBodyStreak(String p1, String p2, int p3) {
    String _temp0 = intl.Intl.pluralLogic(
      p3,
      locale: localeName,
      other: 'شربت $p1 من $p2. لا تفقد سلسلتك المستمرة منذ $p3 يوم!',
      many: 'شربت $p1 من $p2. لا تفقد سلسلتك المستمرة منذ $p3 يومًا!',
      few: 'شربت $p1 من $p2. لا تفقد سلسلتك المستمرة منذ $p3 أيام!',
      two: 'شربت $p1 من $p2. لا تفقد سلسلتك المستمرة منذ $p3 يومين!',
      one: 'شربت $p1 من $p2. لا تفقد سلسلتك المستمرة منذ $p3 يوم!',
      zero: 'شربت $p1 من $p2. لا تفقد سلسلتك المستمرة منذ $p3 يوم!',
    );
    return '$_temp0';
  }

  @override
  String get premiumHeadline => 'اشترك في Premium';

  @override
  String get premiumBenefitNoAds => 'بدون إعلانات';

  @override
  String get premiumLoading => 'جارٍ تحميل السعر…';

  @override
  String get premiumLegal =>
      'يتجدد الاشتراك كل شهر ويمكنك إلغاؤه في أي وقت من إعدادات حسابك في App Store.';

  @override
  String get termsOfUse => 'شروط الاستخدام';

  @override
  String get notificationBodyGeneric =>
      'اشرب كوبًا من الماء واقترب من هدفك اليوم.';

  @override
  String get premiumTitle => 'HydroDaily Premium';

  @override
  String premiumMonthly(String p1) {
    return '$p1 شهريًا';
  }

  @override
  String premiumLifetime(String p1) {
    return 'مدى الحياة مقابل $p1';
  }

  @override
  String get premiumStoreUnavailable =>
      'المتجر غير متاح حاليًا. حاول مرة أخرى لاحقًا.';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get privacyOptions => 'خيارات الخصوصية';
}
