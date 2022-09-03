// imports nativos
import 'package:flutter/material.dart';
import 'package:meus_animais/data/sources/remote/credentials.dart';
import 'package:meus_animais/data/sources/remote/routes/requests.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:injectable/injectable.dart';

abstract class UpdatePetRepository {
  updatePet( ModelPets modelPets, context );
}

@Injectable(as: UpdatePetRepository, env: ["firebase"])
class UpdatePetFirebase implements UpdatePetRepository {

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
        FlutterI18n.translate(context, "custom_message.update_pet.error"),
        Colors.red,
      );
      crash.recordError(error, stackTrace);
      crash.log(error.toString());
    });

  }
}

@Injectable(as: UpdatePetRepository, env: ["api"])
class UpdatePetApi implements UpdatePetRepository {

  @override
  updatePet( ModelPets modelPets, context ) async {

    Uri url = Uri.https(Credentials().apiUrl, Credentials().petsRoute);
    await Requests().httpPutDefault(url, modelPets.updateToMap());

  }
}

@Injectable(as: UpdatePetRepository, env: ["test"])
class UpdatePetTest implements UpdatePetRepository {

  @override
  updatePet( ModelPets modelPets, context ) async {
    return Services().setToken("pets", modelPets.updateToMap().toString());
  }
}