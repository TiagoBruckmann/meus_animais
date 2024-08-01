// pacotes nativos do flutter
import 'package:flutter/material.dart';
import 'package:meus_animais/domain/usecases/notification_use_case.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/core/widgets/custom_snack_bar.dart';

// import dos domain
import 'package:meus_animais/domain/source/local/injection/injection.dart';
import 'package:meus_animais/domain/usecases/user_usecase.dart';

// import dos pacotes
import 'package:mobx/mobx.dart';

part 'user.g.dart';

class UserMobx extends _UserMobx with _$UserMobx {}

abstract class _UserMobx with Store {

  final _currentContext = Session.globalContext.currentContext!;
  final _notificationUseCase = NotificationUseCase(getIt());
  final _userUseCase = UserUseCase(getIt());

  @action
  Future<void> getUser() async {

    Session.appEvents.sharedEvent("get_user");

    final successOrFailure = await _userUseCase.getUserData();

    successOrFailure.fold(
      (failure) => Session.logs.errorLog(failure.message),
      (success) => Session.user = success,
    );
  }

  @action
  Future<void> requestInfoData() async {

    final successOrFailure = await _notificationUseCase.requestInfoData();

    successOrFailure.fold(
      (failure) => Session.logs.errorLog(failure.message),
      (success) => Session.logs.successLog("Solicitação efetuada com sucesso"),
    );

  }

  @action
  Future<void> logOut( Function clearUserData ) async {

    Session.appEvents.sharedEvent("settings_logout");

    final successOrFailure = await _userUseCase.logOut();

    successOrFailure.fold(
      (failure) => Session.logs.errorLog(failure.message),
      (success) {
        clearUserData.call();
        return _goToLogin();
      },
    );
  }

  @action
  Future<void> deleteAccount() async {

    Session.appEvents.sharedEvent("settings_delete_account_apply");

    Map<String, dynamic> params = {
      "subject": "Deletar conta!",
      "body": "Olá Tiago, me chamo ${Session.user.name} estou entrando em contato com você via email: ${Session.user.email}, através do aplicativo Meus Animais.\nO motivo do meu contato é: Deletar conta: Meus Animais, gostaria que você deleta-se minha conta.\n\nDesde já grato!"
    };

    final successOrFailure = await _userUseCase.sendEmailDeleteAccount(params);

    successOrFailure.fold(
      (failure) {
        Session.logs.errorLog(failure.message);
        CustomSnackBar(messageKey: "custom_message.destroy.error");
      },
      (success) {
        CustomSnackBar(messageKey: "custom_message.destroy.success", color: Colors.green);
        _goToLogin();
      },
    );

  }

  @action
  void goToTerms() {
    Session.appEvents.sharedEvent("settings_open_terms");
    Navigator.pushNamed(
      _currentContext,
      "/terms",
    );
  }

  @action
  void goToPolicy() {
    Session.appEvents.sharedEvent("settings_open_policy");
    Navigator.pushNamed(
      _currentContext,
      "/policy",
    );
  }

  @action
  void _goToLogin() {
    Session.appEvents.sharedEvent("settings_open_login");
    Navigator.pushNamedAndRemoveUntil(
      _currentContext,
      "/login",
      (route) => false,
    );
  }

}