// import dos modelos
import 'package:meus_animais/domain/models/hygiene_pets/hygiene_pets.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';


abstract class SetPetRepository {
  setPet( ModelPets modelPets, ModelVaccines? modelVaccines, ModelHygienePets? modelHygienePets );
}

@Injectable(as: SetPetRepository, env: ["firebase"])
class SetPetFirebase implements SetPetRepository {

  @override
  setPet( ModelPets modelPets, ModelVaccines? modelVaccines, ModelHygienePets? modelHygienePets ) async {


  }
}

@Injectable(as: SetPetRepository, env: ["api"])
class SetPetApi implements SetPetRepository {

  @override
  setPet( ModelPets modelPets, ModelVaccines? modelVaccines, ModelHygienePets? modelHygienePets ) async {

  }
}