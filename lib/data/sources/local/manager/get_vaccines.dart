// import dos dominios
import 'package:meus_animais/domain/repositories/get_vaccines.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

@lazySingleton
class GetVaccinesManager {

  GetVaccinesManager(this.getVaccinesRepository) {
    _getVaccines();
  }

  final GetVaccinesRepository getVaccinesRepository;

  List<ModelPets> listVaccines = [];

  void _getVaccines() {
    listVaccines.addAll(getVaccinesRepository.getVaccines());
  }

}