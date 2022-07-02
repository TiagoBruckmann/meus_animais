// import dos dominios
import 'package:meus_animais/domain/repositories/get_pets.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPetsManager {

  GetPetsManager(this.getPetsRepository) {
    getPets();
  }

  final GetPetsRepository getPetsRepository;

  List<ModelPets> listPets = [];

  getPets() async {
    Iterable<ModelPets> iterable = await getPetsRepository.getPets();
    return listPets.addAll(iterable);
  }

}