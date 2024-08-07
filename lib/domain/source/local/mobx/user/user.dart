// pacotes nativos do flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/core/widgets/custom_snack_bar.dart';

// import dos domain
import 'package:meus_animais/domain/source/local/injection/injection.dart';
import 'package:meus_animais/domain/usecases/notification_use_case.dart';
import 'package:meus_animais/domain/usecases/user_usecase.dart';

// import dos pacotes
import 'package:new_version_plus/new_version_plus.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';

part 'user.g.dart';

class UserMobx extends _UserMobx with _$UserMobx {}

abstract class _UserMobx with Store {

  final _currentContext = Session.globalContext.currentContext!;
  final _notificationUseCase = NotificationUseCase(getIt());
  final _userUseCase = UserUseCase(getIt());

  @observable
  bool isLoading = false;

  @action
  void setIsLoading( bool value ) => isLoading = value;

  @action
  Future<void> _verifyVersion() async {

    final newVersion = NewVersionPlus();
    final versionStatus = await newVersion.getVersionStatus();

    if ( versionStatus == null ) return;

    int storeVersion = int.parse(versionStatus.storeVersion.replaceAll(".", ""));
    int localVersion = int.parse(versionStatus.localVersion.replaceAll(".", ""));

    if ( localVersion < storeVersion && versionStatus.canUpdate ) {

      Map<String, String> params = {
        "store_version": versionStatus.storeVersion,
      };

      _showDialogNewVersion(newVersion, versionStatus, params);

    }

  }

  @action
  void _showDialogNewVersion( NewVersionPlus newVersion, VersionStatus versionStatus, Map<String, String> params ) {
    newVersion.showUpdateDialog(
      context: _currentContext,
      versionStatus: versionStatus,
      dialogTitle: FlutterI18n.translate(_currentContext, "update.title"),
      dialogText: FlutterI18n.translate(_currentContext, "update.body", translationParams: params),
      updateButtonText: FlutterI18n.translate(_currentContext, "btn_update"),
      allowDismissal: false,
    );
  }

  @action
  Future<void> getUser() async {

    Session.appEvents.sharedEvent("get_user");

    final successOrFailure = await _userUseCase.getUserData();

    successOrFailure.fold(
      (failure) => Session.logs.errorLog(failure.message),
      (success) => Session.user = success,
    );

    // await _verifyVersion();
  }

  @action
  Future<void> requestInfoData() async {

    setIsLoading(true);

    final successOrFailure = await _notificationUseCase.requestInfoData();

    successOrFailure.fold(
      (failure) => Session.logs.errorLog(failure.message),
      (success) => Session.logs.successLog("Solicitação efetuada com sucesso"),
    );

    setIsLoading(false);

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
    Session.appEvents.sendScreen("terms");
    Navigator.pushNamed(
      _currentContext,
      "/terms",
    );
  }

  @action
  void goToPolicy() {
    Session.appEvents.sendScreen("policy");
    Navigator.pushNamed(
      _currentContext,
      "/policy",
    );
  }

  @action
  void _goToLogin() {
    Session.appEvents.sharedEvent("settings_return_to_login");
    Navigator.pushNamedAndRemoveUntil(
      _currentContext,
      "/login",
      (route) => false,
    );
  }

}