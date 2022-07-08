// import dos dominios
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';
import 'package:meus_animais/domain/repositories/destroy.dart';
import 'package:meus_animais/domain/repositories/logout.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

@lazySingleton
class DestroyManager {

  DestroyManager(this.destroyRepository) {
    disconnect();
  }

  final DestroyRepository destroyRepository;

  dynamic context;

  void disconnect() {
    if ( context != null ) {
      _logout();
    }
  }

  void _logout() async {
    final getUser = getIt.get<GetUserManager>();
    destroyRepository.destroy( getUser.modelUser!, context );
  }

}