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
        "Link de redefinição enviado com sucesso!",
        Colors.green,
      );
    }).onError((error, stackTrace) {
      emailVerified = false;
      CustomSnackBar(
        modelLogin.context,
        "Não foi possivel enviar sua senha de redefinição, tente novamente!",
        Colors.red,
      );
      crash.recordError(error, stackTrace);
      crash.log(error.toString());
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