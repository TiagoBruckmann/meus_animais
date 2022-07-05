// import dos sources
import 'package:flutter/material.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_animais/domain/models/pets/pets.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class SetVaccinesRepository {
  setVaccines( ModelVaccines modelVaccines );
}

@Injectable(as: SetVaccinesRepository, env: ["firebase"])
class SetVaccinesFirebase implements SetVaccinesRepository {
  @override
  setVaccines( ModelVaccines modelVaccines) async {

    await db.collection("vaccines").doc(modelVaccines.id).set(modelVaccines.toMap());

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

@Injectable(as: SetVaccinesRepository, env: ["api"])
class SetVaccinesApi implements SetVaccinesRepository {
  @override
  setVaccines( ModelVaccines modelVaccines ) async {

  }
}