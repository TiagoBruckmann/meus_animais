// imposts nativos do flutter
import 'dart:async';

// import das injecoes
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_pets.dart';

// import dos dominios
import 'package:meus_animais/domain/models/pets/pets.dart';

class PetsBloc {

  final List<ModelPets> _listPets = [];
  List<ModelPets> get listPets => _listPets;

  final _blocController = StreamController<List>();

  Stream<List> get listen => _blocController.stream;

  bool isLoading = true;

  getPets() async {
    final getPetsManager = getIt.get<GetPetsManager>();
    if ( _listPets.isEmpty ) {
      _listPets.addAll(getPetsManager.listPets);
    }
    return _blocController.sink.add(listPets);
  }

  refresh() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 200));
    if ( isLoading == false ) {
      clear();
      getPets();
    }
  }

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
    _listPets.clear();
    return _blocController.sink.add(listPets);
  }

  closeStream() {
    clear();
    _blocController.close();
  }
}