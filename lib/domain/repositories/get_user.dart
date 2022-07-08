// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/users/user.dart';

// import dos pacotes
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class GetUserRepository {
  Future<ModelUser> getUser( ModelUser? modelUser );
}

@Injectable(as: GetUserRepository, env: ["firebase"])
class GetUserFirebase implements GetUserRepository {

  @override
  Future<ModelUser> getUser( ModelUser? modelUser ) async {
    User? userData = auth.currentUser;
    if ( modelUser == null && userData != null ) {

      dynamic data = await db.collection("users").where("id", isEqualTo: userData.uid).get();
      for ( dynamic item in data.docs ) {
        modelUser = ModelUser.fromJson(item, uid: userData.uid);
      }

    }
    return modelUser!;
  }
}

@Injectable(as: GetUserRepository, env: ["api"])
class GetUserApi implements GetUserRepository {

  @override
  Future<ModelUser> getUser( ModelUser? modelUser ) async {
    return ModelUser(
      "5",
      "Tiago Api",
      "tiagobruckmann@gmail.com",
    );
  }
}