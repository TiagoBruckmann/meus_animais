// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'dart:io';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/events.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/loading/loading_connection.dart';
import 'package:meus_animais/ui/pages/widgets/camera/crop_page.dart';
import 'package:meus_animais/ui/pages/vaccines/vaccines.dart';
import 'package:meus_animais/ui/pages/hygiene/hygiene.dart';
import 'package:meus_animais/ui/styles/app_images.dart';

// import dos pacotes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';
import 'package:meus_animais/data/sources/local/mobx/edit_pets/edit.dart';
import 'package:meus_animais/data/sources/local/mobx/crop/crop.dart';

class EditPets extends StatefulWidget {

  final ModelPets modelPets;
  const EditPets({ Key? key, required this.modelPets }) : super(key: key);

  @override
  State<EditPets> createState() => _EditPetsState();
}

class _EditPetsState extends State<EditPets> {

  // injecoes de dependencia
  final EditMobx _editMobx = EditMobx();
  final CropMobx _cropMobx = CropMobx();
  late ConnectionMobx _connectionMobx;

  _goToVaccines() async {
    EventsApp().sharedEvent("edit_pet_open_vaccines");
    Map params = {
      "pet_id": widget.modelPets.id,
      "update": true,
      "pet_name": widget.modelPets.name,
    };

    final vaccines = await Navigator.pushNamed(
      context,
      "/vaccines",
      arguments: params,
    );

    if ( vaccines != null ) {
      Iterable<ModelVaccines> listVaccines = vaccines as Iterable<ModelVaccines>;
      _editMobx.setVaccines(listVaccines);
    }
  }

  _goToHygiene() async {

    EventsApp().sharedEvent("edit_pet_open_hygiene");
    Map params = {
      "pet_id": widget.modelPets.id,
      "update": true,
    };

    final hygiene = await Navigator.pushNamed(
      context,
      "/hygiene",
      arguments: params,
    );

    if ( hygiene != null ) {
      Iterable<ModelHygienePets> listHygiene = hygiene as Iterable<ModelHygienePets>;
      _editMobx.setHygiene(listHygiene);
    }
  }

  @override
  void initState() {
    super.initState();
    EventsApp().sendScreen("edit_pet");
    _editMobx.setAllData( widget.modelPets );
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _connectionMobx = Provider.of<ConnectionMobx>(context);
    await _connectionMobx.verifyConnection();
    _connectionMobx.connectivity.onConnectivityChanged.listen(_connectionMobx.updateConnectionStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: ( builder ) {

        double width = MediaQuery.of(context).size.width;

        return WillPopScope(
          onWillPop: () async {
            return _editMobx.willPopUp;
          },
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              title: Text(
                widget.modelPets.name,
                style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
            ),

            body: ( _connectionMobx.connectionStatus.toString() == "ConnectivityResult.none" )
            ? const LoadingConnection()
            : ( _cropMobx.sampleImage != null )
            ? CropPage( cropMobx: _cropMobx )
            : SingleChildScrollView(
              child: Column(
                children: [

                  // adicionar imagem do animal
                  SizedBox(
                    width: width,
                    child: ClipRect(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [

                          Image.asset( AppImages.banner ),

                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar( _cropMobx.settingCamera("edit_pet") );
                            },
                            child: ( _cropMobx.image == null )
                            ? Image.network( widget.modelPets.picture )
                            : Image.file(File(_cropMobx.image!.path)),
                          ),

                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric( vertical: 15 ),
                        child: Text(
                          FlutterI18n.translate(context, "pages.pets.edit.detail"),
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // nome
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
                    child: TextField(
                      controller: _editMobx.controllerName,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        labelText: FlutterI18n.translate(context, "pages.pets.edit.name"),
                        labelStyle: TextStyle(
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  // peso
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
                    child: TextField(
                      controller: _editMobx.controllerWeight,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        labelText: FlutterI18n.translate(context, "pages.pets.edit.weight"),
                        labelStyle: TextStyle(
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  // sexo
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
                    child: TextField(
                      controller: _editMobx.controllerSex,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        labelText: FlutterI18n.translate(context, "pages.pets.edit.sex"),
                        labelStyle: TextStyle(
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  // especie
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
                    child: TextField(
                      controller: _editMobx.controllerSpecie,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        labelText: FlutterI18n.translate(context, "pages.pets.edit.specie"),
                        labelStyle: TextStyle(
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  //raca
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
                    child: TextField(
                      controller: _editMobx.controllerBreed,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        labelText: FlutterI18n.translate(context, "pages.pets.edit.breed"),
                        labelStyle: TextStyle(
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  // nascimento/adocao
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
                    child: TextField(
                      controller: _editMobx.controllerBirth,
                      enabled: false,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        labelText: FlutterI18n.translate(context, "pages.pets.edit.birth"),
                        labelStyle: TextStyle(
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  // tempo de vida estimado
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
                    child: TextField(
                      controller: _editMobx.controllerLifeTime,
                      enabled: false,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        labelText: FlutterI18n.translate(context, "pages.pets.edit.life_time"),
                        labelStyle: TextStyle(
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  // card das vacinas
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric( vertical: 15 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            const Text(""),

                            Text(
                              FlutterI18n.translate(context, "pages.pets.edit.vaccines"),
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                _goToVaccines();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only( right: 10 ),
                                child: FaIcon(
                                  FontAwesomeIcons.circlePlus,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                  // vacinas
                  for ( var item in _editMobx.listVaccines )
                    Vaccines(
                      modelVaccines: item,
                    ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric( vertical: 15 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            const Text(""),

                            Text(
                              FlutterI18n.translate(context, "pages.pets.edit.hygiene"),
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                _goToHygiene();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only( right: 10 ),
                                child: FaIcon(
                                  FontAwesomeIcons.circlePlus,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                  // higienes
                  for ( var item in _editMobx.listHygiene )
                    Hygiene(
                      modelHygiene: item,
                    ),

                  if ( _editMobx.willPopUp )
                    BlockSemantics(
                      blocking: _editMobx.willPopUp,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {
                            _editMobx.changeWillPopUp( false );
                            _editMobx.validateFields( widget.modelPets, _cropMobx.image, context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.symmetric( vertical: 16, horizontal: 36 ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            FlutterI18n.translate(context, "btn_update"),
                            style: TextStyle(
                              color: Theme.of(context).secondaryHeaderColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),

                ],
              ),
            ),
          )
        );

      },
    );
  }
}
