// pacotes nativos flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/manager/set_vaccines.dart';
import 'package:meus_animais/data/sources/local/manager/set_hygiene.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/loading/loading_connection.dart';
import 'package:meus_animais/ui/pages/vaccines/vaccines.dart';
import 'package:meus_animais/ui/pages/hygiene/hygiene.dart';
import 'package:meus_animais/ui/styles/app_colors.dart';
import 'package:meus_animais/ui/styles/app_images.dart';

// import dos pacotes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';
import 'package:meus_animais/data/sources/local/mobx/edit_pets/edit.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';

class EditPets extends StatefulWidget {

  final ModelPets modelPets;
  const EditPets({ Key? key, required this.modelPets }) : super(key: key);

  @override
  State<EditPets> createState() => _EditPetsState();
}

class _EditPetsState extends State<EditPets> {

  final EditMobx _editMobx = EditMobx();
  late ConnectionMobx _connectionMobx;

  // injecoes de dependencia
  final vaccineManager = getIt.get<SetVaccineManager>();
  final hygieneManager = getIt.get<SetHygieneManager>();

  _goToVaccines() {
    Navigator.pushNamed(
      context,
      "/vaccines",
      arguments: widget.modelPets.id,
    );
  }

  _goToHygiene() {
    Navigator.pushNamed(
      context,
      "/hygiene",
      arguments: widget.modelPets.id,
    );
  }

  @override
  void initState() {
    super.initState();
    Services().sendScreen("Edit-pet");
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

        return Scaffold(
          appBar: AppBar(
            title: Text(widget.modelPets.name),
          ),

          body: ( _connectionMobx.connectionStatus.toString() == "ConnectivityResult.none" )
          ? const LoadingConnection()
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

                        ( widget.modelPets.picture.trim().isEmpty )
                        ? Image.asset(
                          AppImages.loading,
                        )
                        : Image.network(
                          widget.modelPets.picture,
                        ),

                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Card(
                    color: AppColors.barossa,
                    elevation: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric( vertical: 15 ),
                      child: Text(
                        "Dados do pet",
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: AppColors.whiteSmoke,
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
                      labelText: "Nome",
                      labelStyle: const TextStyle(
                        color: AppColors.barossa,
                      ),
                      filled: true,
                      fillColor: AppColors.blueSolitude,
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
                      labelText: "Peso",
                      labelStyle: const TextStyle(
                        color: AppColors.barossa,
                      ),
                      filled: true,
                      fillColor: AppColors.blueSolitude,
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
                      labelText: "Sexo",
                      labelStyle: const TextStyle(
                        color: AppColors.barossa,
                      ),
                      filled: true,
                      fillColor: AppColors.blueSolitude,
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
                      labelText: "Especie",
                      labelStyle: const TextStyle(
                        color: AppColors.barossa,
                      ),
                      filled: true,
                      fillColor: AppColors.blueSolitude,
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
                      labelText: "Raça",
                      labelStyle: const TextStyle(
                        color: AppColors.barossa,
                      ),
                      filled: true,
                      fillColor: AppColors.blueSolitude,
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
                      labelText: "Nascimento/Adoção",
                      labelStyle: const TextStyle(
                        color: AppColors.barossa,
                      ),
                      filled: true,
                      fillColor: AppColors.blueSolitude,
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
                      labelText: "Tempo de vida estimado",
                      labelStyle: const TextStyle(
                        color: AppColors.barossa,
                      ),
                      filled: true,
                      fillColor: AppColors.blueSolitude,
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
                    color: AppColors.barossa,
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric( vertical: 15 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const Text(""),

                          const Text(
                            "Vacinas",
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color: AppColors.whiteSmoke,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              _goToVaccines();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only( right: 10 ),
                              child: FaIcon(
                                FontAwesomeIcons.circlePlus,
                                color: AppColors.whiteSmoke,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                // vacinas
                for ( var item in vaccineManager.listVaccines )
                  Vaccines(
                    modelVaccines: item,
                  ),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: AppColors.barossa,
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric( vertical: 15 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const Text(""),

                          const Text(
                            "Higiene",
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color: AppColors.whiteSmoke,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              _goToHygiene();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only( right: 10 ),
                              child: FaIcon(
                                FontAwesomeIcons.circlePlus,
                                color: AppColors.whiteSmoke,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                // higienes
                for ( var item in hygieneManager.listHygiene )
                  Hygiene(
                    modelHygiene: item,
                  ),

                Container(
                  padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      // _createMobx.validateFields( context );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).cardColor,
                      padding: const EdgeInsets.symmetric( vertical: 16, horizontal: 36 ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Atualizar",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        );

      },
    );
  }
}
