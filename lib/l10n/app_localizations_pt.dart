// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class LPt extends L {
  LPt([String locale = 'pt']) : super(locale);

  @override
  String get navToday => 'Hoje';

  @override
  String get navProfile => 'Perfil';

  @override
  String get todayTitle => 'Sua hidratação';

  @override
  String todayOfGoal(String p1) {
    return 'de $p1';
  }

  @override
  String todayRemaining(String p1) {
    return 'Faltam $p1 para atingir sua meta';
  }

  @override
  String get todayGoalReached => 'Meta cumprida! Continue se hidratando 💧';

  @override
  String get todayAddTitle => 'Adicionar água';

  @override
  String get todayUndo => 'Desfazer';

  @override
  String get todayNoProfileTitle => 'Configure seu perfil';

  @override
  String get todayNoProfileBody =>
      'Calcule sua meta diária de água para começar a registrar o que você bebe.';

  @override
  String get todayNoProfileAction => 'Calcular minha meta';

  @override
  String get statGoal => 'Meta';

  @override
  String get statRemaining => 'Restante';

  @override
  String get statEntries => 'Registros';

  @override
  String get profileTitle => 'Seu perfil';

  @override
  String get profileSubtitle => 'Descubra quanta água você precisa por dia';

  @override
  String get profileWeightLabel => 'Peso';

  @override
  String get profileWeightError => 'Insira um peso entre 20 e 300 kg';

  @override
  String get profileGenderLabel => 'Sexo';

  @override
  String get genderFemale => 'Mulher';

  @override
  String get genderMale => 'Homem';

  @override
  String get profileGenderError => 'Selecione uma opção';

  @override
  String get profileActivityLabel => 'Atividade física';

  @override
  String get activityLow => 'Baixa';

  @override
  String get activityModerate => 'Moderada';

  @override
  String get activityHigh => 'Alta';

  @override
  String get activityLowDesc => 'Pouco ou nenhum exercício durante a semana.';

  @override
  String get activityModerateDesc => 'Exercício de 3 a 5 dias por semana.';

  @override
  String get activityHighDesc => 'Exercício intenso quase todos os dias.';

  @override
  String get profileActivityError => 'Selecione seu nível de atividade';

  @override
  String get profileCalculate => 'Calcular minha meta';

  @override
  String get profileGoalTitle => 'Sua meta diária';

  @override
  String get profileGoalHint =>
      'Este cálculo é apenas uma estimativa. Se você tiver necessidades de saúde específicas, consulte um profissional de saúde.';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get settingsReminders => 'Receber lembretes';

  @override
  String get settingsNotificationsBlocked =>
      'As notificações estão desativadas para este app.';

  @override
  String get settingsEnable => 'Ativar';

  @override
  String get settingsPrivacy => 'Opções de privacidade';

  @override
  String get settingsPrivacyPolicy => 'Política de privacidade';

  @override
  String get notificationTitle => 'Hora de beber água! 💧';

  @override
  String notificationBodyProgress(String p1, String p2) {
    return 'Você já bebeu $p1 de $p2. Beba um copo agora e continue.';
  }

  @override
  String get notificationBodyGoalReached =>
      'Você já atingiu a meta de hoje! Continue assim.';

  @override
  String get notificationBodyNoProfile =>
      'Calcule sua meta diária e comece a cuidar da sua hidratação.';

  @override
  String get reminderChannelName => 'Lembretes';

  @override
  String get reminderChannelDescription =>
      'Notificações para lembrar você de beber água.';

  @override
  String get streakNone => 'Ainda sem sequência';

  @override
  String get streakStartHint =>
      'Alcance sua meta hoje para começar uma sequência.';

  @override
  String get streakKeepHint => 'Alcance sua meta hoje para mantê-la.';

  @override
  String get streakCompletedToday => 'Hoje você somou mais um dia!';

  @override
  String get streakBest => 'Recorde';

  @override
  String get remindersTitle => 'Lembretes';

  @override
  String get reminderSummaryOff => 'Desativados';

  @override
  String get reminderSummaryNoDays => 'Escolha pelo menos um dia';

  @override
  String reminderSummaryOnce(String p1) {
    return 'Às $p1';
  }

  @override
  String reminderSummaryInterval(String p1, String p2, String p3) {
    return 'A cada $p1, das $p2 às $p3';
  }

  @override
  String get reminderSummaryEveryDay => 'todos os dias';

  @override
  String get reminderFrequency => 'Frequência';

  @override
  String get reminderFrequencyOnce => 'Uma vez por dia';

  @override
  String durationHours(int p1) {
    return '$p1 h';
  }

  @override
  String durationHoursMinutes(int p1, int p2) {
    return '$p1 h $p2 min';
  }

  @override
  String get reminderTime => 'Horário';

  @override
  String get reminderFrom => 'Das';

  @override
  String get reminderUntil => 'Até';

  @override
  String get reminderDays => 'Dias';

  @override
  String get reminderSkipWhenReached => 'Silenciar ao atingir a meta';

  @override
  String get reminderSkipWhenReachedDesc =>
      'Você não receberá mais lembretes nesse dia.';

  @override
  String get premiumDesc =>
      'Aproveite o HydroDaily sem anúncios. Escolha um pagamento único vitalício ou uma assinatura mensal.';

  @override
  String get premiumActive => 'Você é Premium. Obrigado pelo seu apoio!';

  @override
  String get premiumRestore => 'Restaurar compra';

  @override
  String get premiumPending => 'Compra aguardando confirmação…';

  @override
  String get premiumErrorStore =>
      'A loja não está disponível agora. Tente novamente mais tarde.';

  @override
  String get premiumErrorProduct =>
      'Não foi possível carregar o produto. Tente novamente mais tarde.';

  @override
  String get premiumErrorFailed => 'Não foi possível concluir a compra.';

  @override
  String get premiumNothingToRestore =>
      'Nenhuma compra encontrada para restaurar.';

  @override
  String get premiumRestored => 'Compra restaurada. Chega de anúncios!';

  @override
  String get premiumActiveMonthly =>
      'Sua assinatura sem anúncios está ativa. Obrigado pelo seu apoio!';

  @override
  String premiumBuyLifetime(String p1) {
    return 'Para sempre por $p1';
  }

  @override
  String get premiumBuyLifetimeNoPrice => 'Remover anúncios para sempre';

  @override
  String premiumBuyMonthly(String p1) {
    return '$p1 por mês';
  }

  @override
  String get premiumBuyMonthlyNoPrice => 'Assinatura mensal';

  @override
  String get premiumManageSubscription => 'Gerenciar ou cancelar assinatura';

  @override
  String streakCurrent(int p1) {
    String _temp0 = intl.Intl.pluralLogic(
      p1,
      locale: localeName,
      other: '$p1 dias seguidos',
      many: '$p1 dias seguidos',
      one: '$p1 dia seguido',
    );
    return '$_temp0';
  }

  @override
  String notificationBodyStreak(String p1, String p2, int p3) {
    String _temp0 = intl.Intl.pluralLogic(
      p3,
      locale: localeName,
      other: 'Você bebeu $p1 de $p2. Não perca sua sequência de $p3 dias!',
      many: 'Você bebeu $p1 de $p2. Não perca sua sequência de $p3 dias!',
      one: 'Você bebeu $p1 de $p2. Não perca sua sequência de $p3 dia!',
    );
    return '$_temp0';
  }

  @override
  String get premiumHeadline => 'Torne-se Premium';

  @override
  String get premiumBenefitNoAds => 'Sem anúncios';

  @override
  String get premiumLoading => 'Carregando preço…';

  @override
  String get premiumLegal =>
      'A assinatura é renovada todo mês e você pode cancelá-la quando quiser nos ajustes da sua conta da App Store.';

  @override
  String get termsOfUse => 'Termos de uso';

  @override
  String get notificationBodyGeneric =>
      'Beba um copo de água e chegue mais perto da sua meta de hoje.';

  @override
  String get premiumTitle => 'HydroDaily Premium';

  @override
  String premiumMonthly(String p1) {
    return '$p1 por mês';
  }

  @override
  String premiumLifetime(String p1) {
    return 'Para sempre por $p1';
  }

  @override
  String get premiumStoreUnavailable =>
      'A loja não está disponível agora. Tente novamente mais tarde.';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get privacyOptions => 'Opções de privacidade';
}
