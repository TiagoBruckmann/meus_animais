// imports nativos do flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/register.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/users/login.dart';

// import dos pacotes
import 'package:mobx/mobx.dart';
part 'register.g.dart';

class RegisterMobx extends _RegisterMobx with _$RegisterMobx{}

abstract class _RegisterMobx with Store {

  final registerManager = getIt.get<RegisterManager>();

  @observable
  TextEditingController controllerName = TextEditingController(text: "tiago B");

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

    analytics.logEvent(name: "validate_register");
    String name = controllerName.text;
    String email = controllerEmail.text;
    String passwd = controllerPasswd.text;

    if ( name.trim().isEmpty || name.trim().length < 2 ) {
      return setMessage("Nós informe seu nome");
    }
    if ( email.trim().isEmpty || !email.contains("@") ) {
      return setMessage("Preencha um e-mail válido");
    }
    if ( passwd.trim().isEmpty && passwd.trim().length < 5 ) {
      return setMessage("Preencha a sua senha");
    }

    setMessage("");
    registerManager.modelLogin = ModelLogin( email, passwd, name: name, context: context );
    registerManager.setCredentials();

  }

  @action
  void clear() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPasswd.dispose();
    setMessage("");
  }

}