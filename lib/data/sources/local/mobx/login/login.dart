// imports nativos do flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/data/sources/remote/services/events.dart';
import 'package:meus_animais/data/sources/local/manager/login.dart';
import 'package:meus_animais/domain/models/users/login.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';
part 'login.g.dart';

class LoginMobx extends _LoginMobx with _$LoginMobx {}

abstract class _LoginMobx with Store {

  final loginManager = getIt.get<LoginManager>();

  @observable
  TextEditingController controllerEmail = TextEditingController();
  // TextEditingController controllerEmail = TextEditingController(text: "tiagobruckmann@gmail.com");

  @observable
  TextEditingController controllerPasswd = TextEditingController();
  // TextEditingController controllerPasswd = TextEditingController(text: "Tiago12345");

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

    EventsApp().sharedEvent("login_validate_login");
    String email = controllerEmail.text;
    String passwd = controllerPasswd.text;

    if ( email.trim().isEmpty || !email.contains("@") ) {
      return setMessage(FlutterI18n.translate(context, "custom_message.register.validate.email"));
    }

    if ( passwd.trim().isEmpty || passwd.trim().length < 5 ) {
      return setMessage(FlutterI18n.translate(context, "custom_message.register.validate.password"));
    }

    setMessage("");
    Services().setEmail( email );
    loginManager.modelLogin = ModelLogin(email, passwd, context: context);
    EventsApp().sharedEvent("login_access_account");
    loginManager.setCredentials();

  }

  @action
  void clear() {
    EventsApp().sharedEvent("login_clear");
    controllerEmail.dispose();
    controllerPasswd.dispose();
    setMessage("");
  }

}