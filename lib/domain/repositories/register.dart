// import dos sources
import 'package:flutter/material.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_animais/domain/models/users/login.dart';
import 'package:meus_animais/domain/models/users/user.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:injectable/injectable.dart';

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
      );
      await db.collection("users").doc(firebaseUser.user!.uid).set(user.toMap());
      Services().setToken("apiToken", firebaseUser.user!.uid);

      CustomSnackBar(
        modelLogin.context,
        FlutterI18n.translate(modelLogin.context, "custom_message.register.success"),
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
        FlutterI18n.translate(modelLogin.context, "custom_message.register.error"),
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