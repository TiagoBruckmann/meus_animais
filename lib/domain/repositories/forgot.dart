// import dos sources
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_pets/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_pets/domain/models/users/login.dart';

// import das telas
import 'package:meus_pets/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:injectable/injectable.dart';

abstract class ForgotRepository {
  Future<bool> forgot( ModelLogin modelLogin, bool emailVerified );
}

@Injectable(as: ForgotRepository, env: ["firebase"])
class ForgotFirebase implements ForgotRepository {

  @override
  Future<bool> forgot( ModelLogin modelLogin, bool emailVerified ) async {
    await auth.sendPasswordResetEmail(
      email: modelLogin.email,
    ).then(( data ) async {

      emailVerified = true;
      CustomSnackBar(
        modelLogin.context,
        FlutterI18n.translate(modelLogin.context, "custom_message.forgot.success"),
        Colors.green,
      );

    }).catchError((onError) {
      emailVerified = false;
      CustomSnackBar(
        modelLogin.context,
        FlutterI18n.translate(modelLogin.context, "custom_message.forgot.error"),
        Colors.red,
      );

      crash.log(onError.toString());
    });

    return emailVerified;
  }
}

@Injectable(as: ForgotRepository, env: ["api"])
class ForgotApi implements ForgotRepository {

  @override
  Future<bool> forgot( ModelLogin modelLogin, bool emailVerified ) async {

    return emailVerified;
  }
}