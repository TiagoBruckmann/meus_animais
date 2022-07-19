// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:meus_pets/data/sources/remote/services/services.dart';

// import dos domain
import 'package:meus_pets/domain/models/hygiene/hygiene_pets.dart';
import 'package:meus_pets/domain/repositories/set_hygiene.dart';

@lazySingleton
class SetHygieneManager {

  SetHygieneManager(this.setHygieneRepository) {
    setData();
  }

  final SetHygieneRepository setHygieneRepository;

  List<ModelHygienePets> listHygiene = [];

  setData() {
    if ( listHygiene.isNotEmpty ) {
      _setHygiene();
    }
  }

  _setHygiene() async {
    await setHygieneRepository.setHygiene(listHygiene);
    analytics.logEvent(name: "create_hygiene-v1");
  }

}