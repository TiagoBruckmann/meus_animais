// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class SetVaccinesRepository {
  setVaccines( List<ModelVaccines> list );
}

@Injectable(as: SetVaccinesRepository, env: ["firebase"])
class SetVaccinesFirebase implements SetVaccinesRepository {
  @override
  setVaccines( List<ModelVaccines> list) async {

    for ( var item in list ) {
      await db.collection("vaccines").doc(item.id).set(item.toMap());
    }

  }
}

@Injectable(as: SetVaccinesRepository, env: ["api"])
class SetVaccinesApi implements SetVaccinesRepository {
  @override
  setVaccines( List<ModelVaccines> list ) async {

  }
}