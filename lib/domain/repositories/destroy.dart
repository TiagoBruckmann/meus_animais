// import dos sources
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_animais/domain/models/users/login.dart';
import 'package:meus_animais/domain/models/users/user.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class DestroyRepository {
  destroy( ModelUser modelUser, context );
}

@Injectable(as: DestroyRepository, env: ["firebase"])
class LoginFirebase implements DestroyRepository {

  @override
  destroy( ModelUser modelUser, context ) async {

    db.collection("users").doc(modelUser.id).update(modelUser.deleteToMap());
    User? user = auth.currentUser;
    await user!.delete();
  }
}

@Injectable(as: DestroyRepository, env: ["api"])
class LoginApi implements DestroyRepository {

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