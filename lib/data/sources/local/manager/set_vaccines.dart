// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:meus_pets/data/sources/remote/services/services.dart';

// import dos domain
import 'package:meus_pets/domain/models/vaccines/vaccines.dart';
import 'package:meus_pets/domain/repositories/set_vaccines.dart';

@lazySingleton
class SetVaccineManager {

  SetVaccineManager(this.setVaccinesRepository) {
    setData();
  }

  final SetVaccinesRepository setVaccinesRepository;

  List<ModelVaccines> listVaccines = [];

  setData() {
    if ( listVaccines.isNotEmpty ) {
      _setVaccines();
    }
  }

  _setVaccines() async {
    await setVaccinesRepository.setVaccines( listVaccines );
    analytics.logEvent(name: "create_vaccines-v1");
  }

}