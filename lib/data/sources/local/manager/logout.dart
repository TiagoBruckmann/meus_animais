// import dos dominios
import 'package:meus_animais/domain/repositories/logout.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

@lazySingleton
class LogoutManager {

  LogoutManager(this.logoutRepository) {
    disconnect();
  }

  final LogoutRepository logoutRepository;

  dynamic context;

  void disconnect() {
    if ( context != null ) {
      _logout();
    }
  }

  void _logout() async {
    logoutRepository.logout( context );
  }

}