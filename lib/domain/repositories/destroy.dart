// import dos sources
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_animais/domain/models/users/user.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class DestroyRepository {
  destroy( ModelUser modelUser, context );
}

@Injectable(as: DestroyRepository, env: ["firebase"])
class DestroyFirebase implements DestroyRepository {

  @override
  destroy( ModelUser modelUser, context ) async {

    try {
      User? user = auth.currentUser;
      if ( user == null ) {
        CustomSnackBar(
          context,
          "Não foi possível deletar sua conta, tente novamente!",
          Colors.green,
        );
        return;
      }

      await db.collection("users").doc(modelUser.id).update(modelUser.deleteToMap());
      await user.delete().then((value) async {

        Services().deleteAllTokens();
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/login",
          (route) => false,
        );

        CustomSnackBar(
          context,
          "Conta deletada com sucesso!",
          Colors.green,
        );

      }).onError((error, stackTrace) {
        crash.recordError(error, stackTrace);
        crash.log(error.toString());
      });

    } catch ( error ) {
      crash.log(error.toString());
    }

  }
}

@Injectable(as: DestroyRepository, env: ["api"])
class DestroyApi implements DestroyRepository {

  @override
  destroy( ModelUser modelUser, context ) async {
    Services().deleteAllTokens();
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/login",
      (route) => false,
    );
  }
}