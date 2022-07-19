// imports nativos
import 'dart:io';

// import dos servicos
import 'package:meus_pets/data/sources/remote/services/services.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

// import dos modelos
import 'package:meus_pets/domain/repositories/set_pet.dart';
import 'package:meus_pets/domain/models/pets/pets.dart';

@lazySingleton
class SetPetManager {

  SetPetManager(this.setPetRepository) {
    setData();
  }

  final SetPetRepository setPetRepository;

  ModelPets modelPets;
  dynamic context;
  File picture;

  setData() {
    if ( modelPets != null && context != null && picture != null ) {
      _setPet();
    }
  }

  _setPet() async {
    await setPetRepository.setPet( modelPets, picture, context );
    analytics.logEvent(name: "create_pet-v1");
  }

}