// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class LZh extends L {
  LZh([String locale = 'zh']) : super(locale);

  @override
  String get navToday => '今天';

  @override
  String get navProfile => '个人资料';

  @override
  String get todayTitle => '你的饮水情况';

  @override
  String todayOfGoal(String p1) {
    return '目标 $p1';
  }

  @override
  String todayRemaining(String p1) {
    return '距离目标还差 $p1';
  }

  @override
  String get todayGoalReached => '目标已达成！继续保持水分 💧';

  @override
  String get todayAddTitle => '添加饮水';

  @override
  String get todayUndo => '撤销';

  @override
  String get todayNoProfileTitle => '设置个人资料';

  @override
  String get todayNoProfileBody => '计算你的每日饮水目标，开始记录你的饮水量。';

  @override
  String get todayNoProfileAction => '计算我的目标';

  @override
  String get statGoal => '目标';

  @override
  String get statRemaining => '剩余';

  @override
  String get statEntries => '记录';

  @override
  String get profileTitle => '个人资料';

  @override
  String get profileSubtitle => '了解你每天需要喝多少水';

  @override
  String get profileWeightLabel => '体重';

  @override
  String get profileWeightError => '请输入 20 到 300 公斤之间的体重';

  @override
  String get profileGenderLabel => '性别';

  @override
  String get genderFemale => '女';

  @override
  String get genderMale => '男';

  @override
  String get profileGenderError => '请选择一个选项';

  @override
  String get profileActivityLabel => '运动量';

  @override
  String get activityLow => '低';

  @override
  String get activityModerate => '中等';

  @override
  String get activityHigh => '高';

  @override
  String get activityLowDesc => '每周很少或不运动。';

  @override
  String get activityModerateDesc => '每周运动 3 到 5 天。';

  @override
  String get activityHighDesc => '几乎每天进行高强度运动。';

  @override
  String get profileActivityError => '请选择你的运动量';

  @override
  String get profileCalculate => '计算我的目标';

  @override
  String get profileGoalTitle => '你的每日目标';

  @override
  String get profileGoalHint => '此计算仅供参考。如有特殊健康需求，请咨询专业医疗人员。';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsReminders => '接收提醒';

  @override
  String get settingsNotificationsBlocked => '此应用的通知已关闭。';

  @override
  String get settingsEnable => '开启';

  @override
  String get settingsPrivacy => '隐私选项';

  @override
  String get settingsPrivacyPolicy => '隐私政策';

  @override
  String get notificationTitle => '该喝水啦！💧';

  @override
  String notificationBodyProgress(String p1, String p2) {
    return '你已喝了 $p1，目标 $p2。现在喝一杯，继续加油。';
  }

  @override
  String get notificationBodyGoalReached => '你已完成今天的目标！继续保持。';

  @override
  String get notificationBodyNoProfile => '计算你的每日目标，开始关注你的水分补充。';

  @override
  String get reminderChannelName => '提醒';

  @override
  String get reminderChannelDescription => '提醒你喝水的通知。';

  @override
  String get streakNone => '还没有连续记录';

  @override
  String get streakStartHint => '今天达成目标即可开始连续记录。';

  @override
  String get streakKeepHint => '今天达成目标即可保持连续记录。';

  @override
  String get streakCompletedToday => '今天又多坚持了一天！';

  @override
  String get streakBest => '最佳';

  @override
  String get remindersTitle => '提醒';

  @override
  String get reminderSummaryOff => '已关闭';

  @override
  String get reminderSummaryNoDays => '请至少选择一天';

  @override
  String reminderSummaryOnce(String p1) {
    return '$p1';
  }

  @override
  String reminderSummaryInterval(String p1, String p2, String p3) {
    return '每 $p1，$p2 至 $p3';
  }

  @override
  String get reminderSummaryEveryDay => '每天';

  @override
  String get reminderFrequency => '频率';

  @override
  String get reminderFrequencyOnce => '每天一次';

  @override
  String durationHours(int p1) {
    return '$p1 小时';
  }

  @override
  String durationHoursMinutes(int p1, int p2) {
    return '$p1 小时 $p2 分钟';
  }

  @override
  String get reminderTime => '时间';

  @override
  String get reminderFrom => '开始';

  @override
  String get reminderUntil => '结束';

  @override
  String get reminderDays => '日期';

  @override
  String get reminderSkipWhenReached => '达成目标后静音';

  @override
  String get reminderSkipWhenReachedDesc => '当天将不再收到提醒。';

  @override
  String get premiumDesc => '畅享无广告的 HydroDaily。可选择一次性永久买断或按月订阅。';

  @override
  String get premiumActive => '你已是 Premium 用户，感谢你的支持！';

  @override
  String get premiumRestore => '恢复购买';

  @override
  String get premiumPending => '购买等待确认…';

  @override
  String get premiumErrorStore => '商店暂时不可用，请稍后再试。';

  @override
  String get premiumErrorProduct => '无法加载商品，请稍后再试。';

  @override
  String get premiumErrorFailed => '无法完成购买。';

  @override
  String get premiumNothingToRestore => '未找到可恢复的购买。';

  @override
  String get premiumRestored => '购买已恢复，再也不会看到广告了！';

  @override
  String get premiumActiveMonthly => '你的无广告订阅已生效。感谢你的支持！';

  @override
  String premiumBuyLifetime(String p1) {
    return '$p1 永久买断';
  }

  @override
  String get premiumBuyLifetimeNoPrice => '永久移除广告';

  @override
  String premiumBuyMonthly(String p1) {
    return '每月 $p1';
  }

  @override
  String get premiumBuyMonthlyNoPrice => '按月订阅';

  @override
  String get premiumManageSubscription => '管理或取消订阅';

  @override
  String streakCurrent(int p1) {
    String _temp0 = intl.Intl.pluralLogic(
      p1,
      locale: localeName,
      other: '连续 $p1 天',
    );
    return '$_temp0';
  }

  @override
  String notificationBodyStreak(String p1, String p2, int p3) {
    String _temp0 = intl.Intl.pluralLogic(
      p3,
      locale: localeName,
      other: '你已喝了 $p1，目标 $p2。别让连续 $p3 天的记录中断！',
    );
    return '$_temp0';
  }

  @override
  String get premiumHeadline => '升级到 Premium';

  @override
  String get premiumBenefitNoAds => '无广告';

  @override
  String get premiumLoading => '正在加载价格…';

  @override
  String get premiumLegal => '订阅每月自动续订，你可以随时在 App Store 账户设置中取消。';

  @override
  String get termsOfUse => '使用条款';

  @override
  String get notificationBodyGeneric => '喝一杯水，离今天的目标更近一步。';

  @override
  String get premiumTitle => 'HydroDaily Premium';

  @override
  String premiumMonthly(String p1) {
    return '每月 $p1';
  }

  @override
  String premiumLifetime(String p1) {
    return '$p1 永久买断';
  }

  @override
  String get premiumStoreUnavailable => '商店暂时不可用，请稍后再试。';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get privacyOptions => '隐私选项';
}
