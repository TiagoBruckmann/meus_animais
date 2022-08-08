// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class SetVaccinesRepository {
  setVaccines( List<ModelVaccines> list, String userName, String petName );
}

@Injectable(as: SetVaccinesRepository, env: ["firebase"])
class SetVaccinesFirebase implements SetVaccinesRepository {
  @override
  setVaccines( List<ModelVaccines> list, String userName, String petName ) async {

    for ( var item in list ) {
      await db.collection("pets").doc(item.petId).collection("vaccines").doc(item.id).set(item.toMap());
      if ( !item.reapply ) {
        await Services().sendNotification(userName, item, petName);
      }
    }

  }
}

@Injectable(as: SetVaccinesRepository, env: ["api"])
class SetVaccinesApi implements SetVaccinesRepository {
  @override
  setVaccines( List<ModelVaccines> list, String userName, String petName  ) async {

  }
}

@Injectable(as: SetVaccinesRepository, env: ["test"])
class SetVaccinesTest implements SetVaccinesRepository {
  @override
  setVaccines( List<ModelVaccines> list, String userName, String petName  ) async {
    for ( var item in list ) {
      Services().setToken("listVaccines", item.toMap().toString());
    }
  }
}