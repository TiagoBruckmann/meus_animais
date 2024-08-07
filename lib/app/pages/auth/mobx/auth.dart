// pacotes nativos do flutter
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import dos pacotes
import 'package:meus_animais/domain/source/local/injection/injection.dart';
import 'package:meus_animais/domain/usecases/auth_use_case.dart';

// import dos pacotes
import 'package:mobx/mobx.dart';

part 'auth.g.dart';

enum AuthTypeEnum {
  register("register"),
  forgot("forgot"),
  login("login");

  final String value;
  const AuthTypeEnum(this.value);
}

class AuthMobx extends _AuthMobx with _$AuthMobx {}

abstract class _AuthMobx with Store {

  final _currentContext = Session.globalContext.currentContext!;
  final _authUseCase = AuthUseCase(getIt());

  @observable
  TextEditingController controllerName = TextEditingController(text: kDebugMode ? "Tiago Brückmann" : "");

  @observable
  TextEditingController controllerEmail = TextEditingController(text: kDebugMode ? "tiagobruckmann@gmail.com" : "");

  @observable
  TextEditingController controllerPasswd = TextEditingController(text: kDebugMode ? "Tiago12345" : "");

  @observable
  bool isLoading = false;

  @observable
  String message = "";

  @observable
  bool isEmailVerified = false;

  @observable
  bool passwdVisible = false;

  @action
  void setIsLoading( bool value ) => isLoading = value;

  @action
  void setMessage( String value ) => message = value;

  @action
  void changeVisible() {
    Session.appEvents.sharedEvent("change_visible_password");
    passwdVisible = !passwdVisible;
  }

  @action
  void setVerifyEmail( bool value ) => isEmailVerified = value;

  @action
  void validateFields( String authType ) {

    setIsLoading(true);

    Session.appEvents.sharedEvent("auth_validate_fields_$authType");
    
    final name = controllerName.text.trim();
    final email = controllerEmail.text.trim();
    final password = controllerPasswd.text.trim();

    if ( authType == AuthTypeEnum.register.value && ( name.isEmpty || name.length < 3 ) ) {
      setIsLoading(false);
      return setMessage("custom_message.register.validate.name");
    }
    
    if ( email.isEmpty || !email.contains("@") ) {
      setIsLoading(false);
      return setMessage("custom_message.register.validate.email");
    }

    if ( authType != AuthTypeEnum.forgot.value ) {
      if ( password.isEmpty || password.length < 5 ) {
        setIsLoading(false);
        return setMessage("custom_message.register.validate.password");
      }
    }
    
    setMessage("");

    if ( authType == AuthTypeEnum.register.value ) {
      _register();
      return;
    }

    if ( authType == AuthTypeEnum.forgot.value ) {
      setVerifyEmail(true);
      _forgot();
      return;
    }

    _login();
    return;
  }
  
  @action
  Future<void> _login() async {

    final params = {
      "email": controllerEmail.text.trim(),
      "password": controllerPasswd.text.trim(),
    };

    final successOrFailure = await _authUseCase.login(params);

    successOrFailure.fold(
      (failure) {
        setIsLoading(false);
        Session.logs.errorLog(failure.message);
        return setMessage(failure.message);
      },
      (success) {
        Session.user = success;
        _goToHome();
      },
    );
    
  }

  @action
  Future<void> _forgot() async {

    final successOrFailure = await _authUseCase.forgotPassword(controllerEmail.text.trim());

    successOrFailure.fold(
      (failure) {
        setIsLoading(false);
        Session.logs.errorLog(failure.message);
        return setMessage(failure.message);
      },
      (success) => Session.logs.successLog("forgot_success => "),
    );

  }

  @action
  Future<void> _register() async {

    final params = {
      "name": controllerName.text.trim(),
      "email": controllerEmail.text.trim(),
      "password": controllerPasswd.text.trim(),
    };

    final successOrFailure = await _authUseCase.register(params);

    successOrFailure.fold(
      (failure) {
        setIsLoading(false);
        Session.logs.errorLog(failure.message);
        return setMessage(failure.message);
      },
      (success) {
        Session.user = success;
        _goToHome();
      },
    );

  }

  @action
  void clear() {
    Session.appEvents.sharedEvent("auth_clear");
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPasswd.dispose();
    setMessage("");
    setVerifyEmail(false);
    setIsLoading(false);
  }

  @action
  void goToForgot() => Navigator.pushNamed(_currentContext, "/forgot-password");

  @action
  void goToRegister() => Navigator.pushNamed(_currentContext, "/register");

  @action
  void _goToHome() => Navigator.pushNamedAndRemoveUntil(_currentContext, "/", (route) => false);

}