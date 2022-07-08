// import dos dominios
import 'package:meus_animais/domain/repositories/get_user.dart';
import 'package:meus_animais/domain/models/users/user.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserManager {

  GetUserManager(this.getUserRepository) {
    _getUser();
  }

  final GetUserRepository getUserRepository;

  ModelUser? modelUser;

  void setCredentials( ModelUser user ) {
    modelUser = ModelUser(user.id, user.name, user.email, picture: user.picture);
  }

  _getUser() async {
    modelUser = await getUserRepository.getUser(modelUser);
    return modelUser!;
  }

}