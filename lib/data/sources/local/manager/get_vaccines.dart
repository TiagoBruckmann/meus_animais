// import dos dominios
import 'package:meus_animais/domain/repositories/get_vaccines.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

@lazySingleton
class GetVaccinesManager {

  GetVaccinesManager(this.getVaccinesRepository) {
    getVaccines();
  }

  final GetVaccinesRepository getVaccinesRepository;

  List<ModelVaccines> listVaccines = [];
  String petId = "";

  getVaccines() async {
    if ( petId.trim().isNotEmpty ) {
      listVaccines.clear();
      Iterable<ModelVaccines> iterable = await getVaccinesRepository.getVaccines( petId );
      listVaccines.addAll(iterable);
      return listVaccines;
    }
  }

}