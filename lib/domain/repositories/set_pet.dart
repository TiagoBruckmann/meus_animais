// import dos sources
import 'package:flutter/material.dart';
import 'package:meus_animais/data/sources/local/manager/set_vaccines.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/set_hygiene.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class SetPetRepository {
  setPet( ModelPets modelPets, context );
}

@Injectable(as: SetPetRepository, env: ["firebase"])
class SetPetFirebase implements SetPetRepository {

  @override
  setPet( ModelPets modelPets, context ) async {

    await db.collection("pets").doc(modelPets.id).set(modelPets.toMap()).whenComplete(() async {
      final vaccineManager = getIt.get<SetVaccineManager>();
      final hygieneManager = getIt.get<SetHygieneManager>();

      if ( vaccineManager.listVaccines.isNotEmpty ) {
        await vaccineManager.setData();
      }
      if ( hygieneManager.listHygiene.isNotEmpty ) {
        await hygieneManager.setData();
      }

      Navigator.pushNamedAndRemoveUntil(
        context,
        "/",
        (route) => false,
      );

    }).onError((error, stackTrace) {
      crash.recordError(error, stackTrace);
    });

  }
}

@Injectable(as: SetPetRepository, env: ["api"])
class SetPetApi implements SetPetRepository {

  @override
  setPet( ModelPets modelPets, context ) async {

    final vaccineManager = getIt.get<SetVaccineManager>();
    final hygieneManager = getIt.get<SetHygieneManager>();

  }
}