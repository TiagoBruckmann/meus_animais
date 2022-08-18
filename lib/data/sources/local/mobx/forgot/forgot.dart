// imports nativos do flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/forgot.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/users/login.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';
part 'forgot.g.dart';

class ForgotMobx extends _ForgotMobx with _$ForgotMobx {}

abstract class _ForgotMobx with Store {

  final forgotManager = getIt.get<ForgotManager>();

  @observable
  TextEditingController controllerEmail = TextEditingController();

  @observable
  String message = "";

  @observable
  bool emailVerified = false;

  @action
  void setMessage(String value ) => message = value;

  @action
  void verifyEmail( bool value ) => emailVerified = value;

  @action
  validateEmail( context ) async {
    Services().analyticsEvent("validate_email");
    Services().facebookEvent("validate_email");
    String email = controllerEmail.text;

    if ( email.trim().isEmpty || !email.contains("@") ) {
      return setMessage(FlutterI18n.translate(context, "custom_message.register.validate.email"));
    }

    forgotManager.modelLogin = ModelLogin(email, "", context: context);
    verifyEmail( await forgotManager.forgot() );

  }

  @action
  void clear() {
    controllerEmail.dispose();
    verifyEmail( false );
    setMessage("");
  }

}