// imports nativos
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/manager/set_vaccines.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/set_hygiene.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

abstract class SetPetRepository {
  setPet( ModelPets modelPets, XFile picture, String userName, context );
}

@Injectable(as: SetPetRepository, env: ["firebase"])
class SetPetFirebase implements SetPetRepository {

  @override
  setPet( ModelPets modelPets, XFile picture, String userName, context ) async {

    await db.collection("pets")
    .doc(modelPets.id)
    .set(modelPets.toMap())
    .then(( data ) async {

      final vaccineManager = getIt.get<SetVaccineManager>();
      final hygieneManager = getIt.get<SetHygieneManager>();

      if ( vaccineManager.listVaccines.isNotEmpty ) {
        vaccineManager.userName = userName;
        vaccineManager.petName = modelPets.name;
        await vaccineManager.setData();
      }
      if ( hygieneManager.listHygiene.isNotEmpty ) {
        await hygieneManager.setData();
      }

      await Services().uploadPicture( modelPets, picture, context );

    }).onError((error, stackTrace) {
      CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.set_pet.error"),
        Colors.red,
      );
      crash.recordError(error, stackTrace);
      crash.log(error.toString());
    });

  }
}

@Injectable(as: SetPetRepository, env: ["api"])
class SetPetApi implements SetPetRepository {

  @override
  setPet( ModelPets modelPets, XFile picture, String userName, context ) async {

    /*
    final vaccineManager = getIt.get<SetVaccineManager>();
    final hygieneManager = getIt.get<SetHygieneManager>();
    */

  }
}

@Injectable(as: SetPetRepository, env: ["test"])
class SetPetTest implements SetPetRepository {

  @override
  setPet( ModelPets modelPets, XFile picture, String userName, context ) async {

    return Services().setToken("pets", modelPets.toMap().toString());

  }
}