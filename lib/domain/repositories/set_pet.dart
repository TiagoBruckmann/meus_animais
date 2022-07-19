// imports nativos
import 'package:flutter/material.dart';
import 'dart:io';

// import dos sources
import 'package:meus_pets/data/sources/local/manager/set_vaccines.dart';
import 'package:meus_pets/data/sources/local/injection/injection.dart';
import 'package:meus_pets/data/sources/local/manager/set_hygiene.dart';
import 'package:meus_pets/data/sources/remote/services/services.dart';
import 'package:meus_pets/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_pets/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:injectable/injectable.dart';

abstract class SetPetRepository {
  setPet( ModelPets modelPets, File picture, context );
}

@Injectable(as: SetPetRepository, env: ["firebase"])
class SetPetFirebase implements SetPetRepository {

  @override
  setPet( ModelPets modelPets, File picture, context ) async {

    await db.collection("pets")
    .doc(modelPets.id)
    .set(modelPets.toMap())
    .then(( data ) async {

      final vaccineManager = getIt.get<SetVaccineManager>();
      final hygieneManager = getIt.get<SetHygieneManager>();

      if ( vaccineManager.listVaccines.isNotEmpty ) {
        await vaccineManager.setData();
      }
      if ( hygieneManager.listHygiene.isNotEmpty ) {
        await hygieneManager.setData();
      }

      await Services().uploadPicture( modelPets, picture, context );

    }).catchError((onError) {
      CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.set_pet.error"),
        Colors.red,
      );
      crash.log(onError.toString());
    });

  }
}

@Injectable(as: SetPetRepository, env: ["api"])
class SetPetApi implements SetPetRepository {

  @override
  setPet( ModelPets modelPets, File picture, context ) async {

    /*
    final vaccineManager = getIt.get<SetVaccineManager>();
    final hygieneManager = getIt.get<SetHygieneManager>();
    */

  }
}