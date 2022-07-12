// imports nativos
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class UpdatePetRepository {
  updatePet( ModelPets modelPets, context );
}

@Injectable(as: UpdatePetRepository, env: ["firebase"])
class SetPetFirebase implements UpdatePetRepository {

  @override
  updatePet( ModelPets modelPets, context ) async {

    await db.collection("pets").doc(modelPets.id).update(modelPets.updateToMap()).then((value) async {

      Navigator.pushNamedAndRemoveUntil(
        context,
        "/",
        (route) => false,
      );

    }).onError((error, stackTrace) {
      CustomSnackBar(
        context,
        "não foi possivel atualizar o pet, tente novamente mais tarde",
        Colors.red,
      );
      crash.recordError(error, stackTrace);
      crash.log(error.toString());
    });

  }
}

@Injectable(as: UpdatePetRepository, env: ["api"])
class SetPetApi implements UpdatePetRepository {

  @override
  updatePet( ModelPets modelPets, context ) async {

    /*
    final vaccineManager = getIt.get<SetVaccineManager>();
    final hygieneManager = getIt.get<SetHygieneManager>();
    */

  }
}