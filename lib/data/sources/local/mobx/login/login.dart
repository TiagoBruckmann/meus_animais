// imports nativos do flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/login.dart';
import 'package:meus_animais/domain/models/users/login.dart';

// import dos pacotes
import 'package:mobx/mobx.dart';
part 'login.g.dart';

class LoginMobx = _LoginMobx with _$LoginMobx;

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

    String email = controllerEmail.text;
    String passwd = controllerPasswd.text;

    if ( email.isNotEmpty && email.contains("@") ) {

      if ( passwd.isNotEmpty && passwd.length > 5 ) {
        setMessage("");
        loginManager.modelLogin = ModelLogin(email, passwd, context: context);
        loginManager.setCredentials();

      } else {
        setMessage("Preencha a sua senha");
      }

    } else {
      setMessage("Preencha um e-mail valido");
    }
  }

  @action
  void clear() {
    controllerEmail.dispose();
    controllerPasswd.dispose();
    setMessage("");
  }

}