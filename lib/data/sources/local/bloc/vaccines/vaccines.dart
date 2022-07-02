// imposts nativos do flutter
import 'dart:async';

// import das injecoes
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_vaccines.dart';
import 'package:meus_animais/data/sources/local/manager/set_vaccines.dart';

// import dos dominios
import 'package:meus_animais/domain/models/pets/pets.dart';

class VaccinesBloc {

  final setVaccinesManager = getIt.get<SetVaccineManager>();
  final List<ModelPets> _listVaccines = [];
  List<ModelPets> get listVaccines => _listVaccines;

  final _blocController = StreamController<List>();

  Stream<List> get listen => _blocController.stream;

  getVaccines() {
    final getVaccinesManager = getIt.get<GetVaccinesManager>();
    _listVaccines.addAll(getVaccinesManager.listVaccines);
    return _blocController.sink.add(listVaccines);
  }

  /*
  setVaccines( context ) {
    setVaccinesManager.modelPets = ModelPets.setIds(userId, context: context);
    setVaccinesManager.setData();
  }
  */

  /*
  // reordenar o grupo de ingredientes
  _reOrderIngredients() async {

    final updateOrder = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
          ReorderIngredients(
            token: widget.token,
            groups: _listIngredients,
          ),
      ),
    );

    // atualizar a ordem dos grupos
    if ( updateOrder != null ) {
      setState(() {
        _listIngredients = updateOrder;
      });
    }
  }
   */

  clear() {
    _listVaccines.clear();
    return _blocController.sink.add(listVaccines);
  }

  closeStream() {
    clear();
    _blocController.close();
  }
}