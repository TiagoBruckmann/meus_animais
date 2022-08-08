// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos domain
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';
import 'package:meus_animais/domain/repositories/set_vaccines.dart';

@lazySingleton
class SetVaccineManager {

  SetVaccineManager(this.setVaccinesRepository) {
    setData();
  }

  final SetVaccinesRepository setVaccinesRepository;

  List<ModelVaccines> listVaccines = [];
  String? userName;
  String? petName;

  setData() {
    if ( listVaccines.isNotEmpty && userName != null && petName != null ) {
      _setVaccines();
    }
  }

  _setVaccines() async {
    await setVaccinesRepository.setVaccines( listVaccines, userName!, petName! );
    analytics.logEvent(name: "create_vaccines");
  }

}