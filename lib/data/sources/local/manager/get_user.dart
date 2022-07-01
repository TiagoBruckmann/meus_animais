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
    modelUser = ModelUser(user.id, user.name, user.email, user.password, picture: user.picture);
  }

  void _getUser() {
    modelUser = getUserRepository.getUser(modelUser);
  }

}