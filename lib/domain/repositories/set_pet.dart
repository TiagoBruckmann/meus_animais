// import dos sources
import 'package:meus_animais/data/sources/local/manager/set_vaccines.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/set_hygiene.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class SetPetRepository {
  setPet( ModelPets modelPets, List<ModelVaccines> listVaccines, List<ModelHygienePets> listHygienePets );
}

@Injectable(as: SetPetRepository, env: ["firebase"])
class SetPetFirebase implements SetPetRepository {

  @override
  setPet( ModelPets modelPets, List<ModelVaccines> listVaccines, List<ModelHygienePets> listHygienePets ) async {

    await db.collection("pets").doc(modelPets.id).set(modelPets.toMap()).whenComplete(() async {
      final vaccineManager = getIt.get<SetVaccineManager>();
      final hygieneManager = getIt.get<SetHygieneManager>();

      await vaccineManager.setData();
      await hygieneManager.setData();

    }).onError((error, stackTrace) {
      crash.log(error.toString());
    });

  }
}

@Injectable(as: SetPetRepository, env: ["api"])
class SetPetApi implements SetPetRepository {

  @override
  setPet( ModelPets modelPets, List<ModelVaccines> listVaccines, List<ModelHygienePets> listHygienePets ) async {

    final vaccineManager = getIt.get<SetVaccineManager>();
    final hygieneManager = getIt.get<SetHygieneManager>();

  }
}