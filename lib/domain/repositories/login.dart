// import dos sources
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_animais/domain/models/users/login.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class LoginRepository {
  login( ModelLogin modelLogin );
}

@Injectable(as: LoginRepository, env: ["firebase"])
class LoginFirebase implements LoginRepository {

  @override
  login( ModelLogin modelLogin ) async {

    auth.signInWithEmailAndPassword(
      email: modelLogin.email,
      password: modelLogin.password,
    ).then((firebaseUser) async {

      Services().setToken("apiToken", firebaseUser.user!.uid);
      Navigator.pushNamedAndRemoveUntil(
        modelLogin.context,
        "/",
        (route) => false,
      );

    }).catchError((error){
      CustomSnackBar(
        modelLogin.context,
        "Houve um erro ao efetuar sua solicitação, tente novamente mais tarde!",
        Colors.red,
      );
      crash.log(error.toString());
    });
  }
}

@Injectable(as: LoginRepository, env: ["api"])
class LoginApi implements LoginRepository {

  @override
  login( ModelLogin modelLogin ) async {
    Services().setToken("apiToken", "ajklshdjkashdjkashbdjkasbhdjkasb");
    Navigator.pushNamedAndRemoveUntil(
      modelLogin.context,
      "/",
      (route) => false,
    );
  }
}