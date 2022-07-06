// import dos sources
import 'package:flutter/material.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';

// import dos modelos
import 'package:meus_animais/domain/models/pets/pets.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class SetHygieneRepository {
  setHygiene( List<ModelHygienePets> list );
}

@Injectable(as: SetHygieneRepository, env: ["firebase"])
class SetHygieneFirebase implements SetHygieneRepository {
  @override
  setHygiene( List<ModelHygienePets> list ) async {

    for ( var item in list ) {
      await db.collection("hygiene").doc(item.id).set(item.toMap());
    }

    /*
    CustomSnackBar(
      modelLogin.context,
      "Vacina cadastrada com sucesso",
      Colors.green,
    );

    Navigator.pop(
      modelLogin.context,
      modelPets,
    );
    */

  }
}

@Injectable(as: SetHygieneRepository, env: ["api"])
class SetHygieneApi implements SetHygieneRepository {
  @override
  setHygiene( List<ModelHygienePets> list ) async {

  }
}