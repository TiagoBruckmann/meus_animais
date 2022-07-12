// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';

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
      await db.collection("hygiene_pets").doc(item.id).set(item.toMap());
    }

  }
}

@Injectable(as: SetHygieneRepository, env: ["api"])
class SetHygieneApi implements SetHygieneRepository {
  @override
  setHygiene( List<ModelHygienePets> list ) async {

  }
}