// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class LRu extends L {
  LRu([String locale = 'ru']) : super(locale);

  @override
  String get navToday => 'Сегодня';

  @override
  String get navProfile => 'Профиль';

  @override
  String get todayTitle => 'Ваш водный баланс';

  @override
  String todayOfGoal(String p1) {
    return 'из $p1';
  }

  @override
  String todayRemaining(String p1) {
    return 'До цели осталось $p1';
  }

  @override
  String get todayGoalReached => 'Цель достигнута! Продолжайте пить воду 💧';

  @override
  String get todayAddTitle => 'Добавить воду';

  @override
  String get todayUndo => 'Отменить';

  @override
  String get todayNoProfileTitle => 'Настройте профиль';

  @override
  String get todayNoProfileBody =>
      'Рассчитайте дневную норму воды, чтобы начать отслеживать, сколько вы пьёте.';

  @override
  String get todayNoProfileAction => 'Рассчитать норму';

  @override
  String get statGoal => 'Цель';

  @override
  String get statRemaining => 'Осталось';

  @override
  String get statEntries => 'Записи';

  @override
  String get profileTitle => 'Ваш профиль';

  @override
  String get profileSubtitle => 'Узнайте, сколько воды вам нужно каждый день';

  @override
  String get profileWeightLabel => 'Вес';

  @override
  String get profileWeightError => 'Введите вес от 20 до 300 кг';

  @override
  String get profileGenderLabel => 'Пол';

  @override
  String get genderFemale => 'Женский';

  @override
  String get genderMale => 'Мужской';

  @override
  String get profileGenderError => 'Выберите вариант';

  @override
  String get profileActivityLabel => 'Физическая активность';

  @override
  String get activityLow => 'Низкая';

  @override
  String get activityModerate => 'Средняя';

  @override
  String get activityHigh => 'Высокая';

  @override
  String get activityLowDesc => 'Мало или совсем нет тренировок в неделю.';

  @override
  String get activityModerateDesc => 'Тренировки 3–5 дней в неделю.';

  @override
  String get activityHighDesc => 'Интенсивные тренировки почти каждый день.';

  @override
  String get profileActivityError => 'Выберите уровень активности';

  @override
  String get profileCalculate => 'Рассчитать норму';

  @override
  String get profileGoalTitle => 'Ваша дневная норма';

  @override
  String get profileGoalHint =>
      'Этот расчёт носит ориентировочный характер. При особых потребностях здоровья проконсультируйтесь со специалистом.';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsReminders => 'Получать напоминания';

  @override
  String get settingsNotificationsBlocked =>
      'Уведомления для этого приложения отключены.';

  @override
  String get settingsEnable => 'Включить';

  @override
  String get settingsPrivacy => 'Настройки конфиденциальности';

  @override
  String get settingsPrivacyPolicy => 'Политика конфиденциальности';

  @override
  String get notificationTitle => 'Пора выпить воды! 💧';

  @override
  String notificationBodyProgress(String p1, String p2) {
    return 'Вы выпили $p1 из $p2. Выпейте стакан сейчас и продолжайте.';
  }

  @override
  String get notificationBodyGoalReached =>
      'Вы уже достигли сегодняшней цели! Так держать.';

  @override
  String get notificationBodyNoProfile =>
      'Рассчитайте дневную норму и начните заботиться о водном балансе.';

  @override
  String get reminderChannelName => 'Напоминания';

  @override
  String get reminderChannelDescription =>
      'Уведомления, которые напоминают пить воду.';

  @override
  String get streakNone => 'Серии пока нет';

  @override
  String get streakStartHint => 'Выполните цель сегодня, чтобы начать серию.';

  @override
  String get streakKeepHint => 'Выполните цель сегодня, чтобы продолжить её.';

  @override
  String get streakCompletedToday => 'Сегодня вы добавили ещё один день!';

  @override
  String get streakBest => 'Рекорд';

  @override
  String get remindersTitle => 'Напоминания';

  @override
  String get reminderSummaryOff => 'Выключены';

  @override
  String get reminderSummaryNoDays => 'Выберите хотя бы один день';

  @override
  String reminderSummaryOnce(String p1) {
    return 'В $p1';
  }

  @override
  String reminderSummaryInterval(String p1, String p2, String p3) {
    return 'Каждые $p1, с $p2 до $p3';
  }

  @override
  String get reminderSummaryEveryDay => 'каждый день';

  @override
  String get reminderFrequency => 'Частота';

  @override
  String get reminderFrequencyOnce => 'Раз в день';

  @override
  String durationHours(int p1) {
    return '$p1 ч';
  }

  @override
  String durationHoursMinutes(int p1, int p2) {
    return '$p1 ч $p2 мин';
  }

  @override
  String get reminderTime => 'Время';

  @override
  String get reminderFrom => 'С';

  @override
  String get reminderUntil => 'До';

  @override
  String get reminderDays => 'Дни';

  @override
  String get reminderSkipWhenReached => 'Не беспокоить после цели';

  @override
  String get reminderSkipWhenReachedDesc =>
      'В этот день напоминаний больше не будет.';

  @override
  String get premiumDesc =>
      'Пользуйтесь HydroDaily без рекламы. Выберите разовый платёж навсегда или ежемесячную подписку.';

  @override
  String get premiumActive => 'У вас Premium. Спасибо за поддержку!';

  @override
  String get premiumRestore => 'Восстановить покупку';

  @override
  String get premiumPending => 'Покупка ожидает подтверждения…';

  @override
  String get premiumErrorStore =>
      'Магазин сейчас недоступен. Повторите попытку позже.';

  @override
  String get premiumErrorProduct =>
      'Не удалось загрузить товар. Повторите попытку позже.';

  @override
  String get premiumErrorFailed => 'Не удалось завершить покупку.';

  @override
  String get premiumNothingToRestore =>
      'Покупки для восстановления не найдены.';

  @override
  String get premiumRestored =>
      'Покупка восстановлена. Больше никакой рекламы!';

  @override
  String get premiumActiveMonthly =>
      'Ваша подписка без рекламы активна. Спасибо за поддержку!';

  @override
  String premiumBuyLifetime(String p1) {
    return 'Навсегда за $p1';
  }

  @override
  String get premiumBuyLifetimeNoPrice => 'Убрать рекламу навсегда';

  @override
  String premiumBuyMonthly(String p1) {
    return '$p1 в месяц';
  }

  @override
  String get premiumBuyMonthlyNoPrice => 'Ежемесячная подписка';

  @override
  String get premiumManageSubscription => 'Управлять подпиской или отменить её';

  @override
  String streakCurrent(int p1) {
    String _temp0 = intl.Intl.pluralLogic(
      p1,
      locale: localeName,
      other: '$p1 дня подряд',
      many: '$p1 дней подряд',
      few: '$p1 дня подряд',
      one: '$p1 день подряд',
    );
    return '$_temp0';
  }

  @override
  String notificationBodyStreak(String p1, String p2, int p3) {
    String _temp0 = intl.Intl.pluralLogic(
      p3,
      locale: localeName,
      other: 'Вы выпили $p1 из $p2. Не прерывайте серию в $p3 дня!',
      many: 'Вы выпили $p1 из $p2. Не прерывайте серию в $p3 дней!',
      few: 'Вы выпили $p1 из $p2. Не прерывайте серию в $p3 дня!',
      one: 'Вы выпили $p1 из $p2. Не прерывайте серию в $p3 день!',
    );
    return '$_temp0';
  }

  @override
  String get premiumHeadline => 'Перейти на Premium';

  @override
  String get premiumBenefitNoAds => 'Без рекламы';

  @override
  String get premiumLoading => 'Загрузка цены…';

  @override
  String get premiumLegal =>
      'Подписка продлевается каждый месяц, и её можно отменить в любое время в настройках учётной записи App Store.';

  @override
  String get termsOfUse => 'Условия использования';

  @override
  String get notificationBodyGeneric =>
      'Выпейте стакан воды и приблизьтесь к сегодняшней цели.';

  @override
  String get premiumTitle => 'HydroDaily Premium';

  @override
  String premiumMonthly(String p1) {
    return '$p1 в месяц';
  }

  @override
  String premiumLifetime(String p1) {
    return 'Навсегда за $p1';
  }

  @override
  String get premiumStoreUnavailable =>
      'Магазин сейчас недоступен. Повторите попытку позже.';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get privacyOptions => 'Настройки конфиденциальности';
}
