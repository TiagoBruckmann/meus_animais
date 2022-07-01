// import dos sources
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_animais/domain/models/users/login.dart';
import 'package:meus_animais/domain/models/users/user.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:meus_animais/ui/pages/widgets/message.dart';

abstract class RegisterRepository {
  register( ModelLogin modelLogin );
}

@Injectable(as: RegisterRepository, env: ["firebase"])
class RegisterFirebase implements RegisterRepository {

  @override
  register( ModelLogin modelLogin ) async {

    auth.createUserWithEmailAndPassword(
      email: modelLogin.email,
      password: modelLogin.password,
    ).then((firebaseUser) async {

      ModelUser user = ModelUser(
        firebaseUser.user!.uid,
        modelLogin.name!,
        modelLogin.email,
        modelLogin.password,
      );
      await db.collection("users").doc(firebaseUser.user!.uid).set(user.toMap());
      Services().setToken("apiToken", firebaseUser.user!.uid);

      CustomSnackBar(
        modelLogin.context,
        "Cadastro efetuado com sucesso",
        Colors.green,
      );

      Navigator.pushNamedAndRemoveUntil(
        modelLogin.context,
        "/",
        (route) => false,
      );

    }).catchError((error) {
      CustomSnackBar(
        modelLogin.context,
        "Houve um erro ao efetuar sua solicitação, tente novamente mais tarde!",
        Colors.red,
      );
      crash.log(error.toString());
    });
  }
}

@Injectable(as: RegisterRepository, env: ["api"])
class RegisterApi implements RegisterRepository {

  @override
  register( ModelLogin modelLogin ) async {

  }
}