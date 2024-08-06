// imports nativos
import 'package:flutter/material.dart';
import 'dart:async';

// imports globais
import 'package:meus_animais/session.dart';

// import dos domain
import 'package:meus_animais/domain/source/local/injection/injection.dart';
import 'package:meus_animais/domain/source/local/mobx/user/user.dart';
import 'package:meus_animais/domain/usecases/auth_use_case.dart';

// import dos pacotes
import 'package:mobx/mobx.dart';
part 'splash.g.dart';

class SplashMobx extends _SplashMobx with _$SplashMobx {}

abstract class _SplashMobx with Store {

  final BuildContext _currentContext = Session.globalContext.currentContext!;

  final AuthUseCase _useCase = AuthUseCase(getIt());

  @action
  Future<void> verifyConnection( UserMobx userMobx ) async {
    final connectedOrNot = await _useCase.verifyConnection();

    connectedOrNot.fold(
      (failure) => _goToLogin(),
      (success) {
        userMobx.getUser();
        redirect(success);
      },
    );
  }

  @action
  Future<void> redirect( bool connected ) async {
    if ( connected ) {
      return _goToHome();
    }

    return _goToLogin();
  }

  @action
  void _goToHome() {
    Navigator.pushNamedAndRemoveUntil(
      _currentContext,
      "/",
      (route) => false,
    );
  }

  @action
  void _goToLogin() {
    Navigator.pushNamedAndRemoveUntil(
      _currentContext,
      "/login",
      (route) => false,
    );
  }

}