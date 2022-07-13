// import dos dominios
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/repositories/destroy.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

@lazySingleton
class DestroyManager {

  DestroyManager(this.destroyRepository) {
    _destroy();
  }

  final DestroyRepository destroyRepository;
  dynamic context;

  void _destroy() async {
    final getUser = getIt.get<GetUserManager>();
    if ( context != null ) {
      destroyRepository.destroy( getUser.modelUser!, context );
      analytics.logEvent(name: "destroy");
    }
  }

}