// imports nativos do flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/login.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/users/login.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';
part 'login.g.dart';

class LoginMobx extends _LoginMobx with _$LoginMobx {}

abstract class _LoginMobx with Store {

  final loginManager = getIt.get<LoginManager>();

  @observable
  TextEditingController controllerEmail = TextEditingController(text: "tiagobruckmann@gmail.com");

  @observable
  TextEditingController controllerPasswd = TextEditingController(text: "Teste12345");

  @observable
  String message = "";

  @observable
  bool passwdVisible = false;

  @action
  void setMessage(String value ) => message = value;

  @action
  void changeVisible() => passwdVisible = !passwdVisible;

  @action
  validateFields( context ) {

    analytics.logEvent(name: "validate_login");
    String email = controllerEmail.text;
    String passwd = controllerPasswd.text;

    if ( email.trim().isEmpty || !email.contains("@") ) {
      return setMessage(FlutterI18n.translate(context, "custom_message.register.validate.email"));
    }

    if ( passwd.trim().isEmpty || passwd.trim().length < 5 ) {
      return setMessage(FlutterI18n.translate(context, "custom_message.register.validate.password"));
    }

    setMessage("");
    loginManager.modelLogin = ModelLogin(email, passwd, context: context);
    loginManager.setCredentials();

  }

  @action
  void clear() {
    controllerEmail.dispose();
    controllerPasswd.dispose();
    setMessage("");
  }

}