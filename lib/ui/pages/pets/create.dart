// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'dart:io';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/data/sources/local/manager/life_time.dart';
import 'package:meus_animais/data/sources/local/mobx/crop/crop.dart';
import 'package:meus_animais/domain/models/life_time/life_time.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/loading/loading_connection.dart';
import 'package:meus_animais/ui/pages/widgets/camera/crop_page.dart';
import 'package:meus_animais/ui/pages/widgets/dropdown_error.dart';
import 'package:meus_animais/ui/pages/vaccines/vaccines.dart';
import 'package:meus_animais/ui/pages/hygiene/hygiene.dart';
import 'package:meus_animais/ui/styles/app_colors.dart';
import 'package:meus_animais/ui/styles/app_images.dart';

// import dos pacotes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';
import 'package:meus_animais/data/sources/local/mobx/create_pets/create.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';

class CreatePetPage extends StatefulWidget {
  const CreatePetPage({Key? key}) : super(key: key);

  @override
  State<CreatePetPage> createState() => _CreatePetPageState();
}

class _CreatePetPageState extends State<CreatePetPage> {

  final _lifeTimeManager = getIt.get<LifeTimeManager>();
  final CreateMobx _createMobx = CreateMobx();
  final CropMobx _cropMobx = CropMobx();
  late ConnectionMobx _connectionMobx;

  final String _petId = DateFormat('yyyyMMddkkmmss').format(DateTime.now());

  _goToVaccines() async {
    Map params = {
      "pet_id": _petId,
      "update": false,
    };

    final vaccines = await Navigator.pushNamed(
      context,
      "/vaccines",
      arguments: params,
    );

    if ( vaccines != null ) {
      _createMobx.setVaccine( vaccines );
    }
  }

  _goToHygiene() async {
    Map params = {
      "pet_id": _petId,
      "update": false,
    };

    final hygiene = await Navigator.pushNamed(
      context,
      "/hygiene",
      arguments: params,
    );

    if ( hygiene != null ) {
      _createMobx.setHygiene( hygiene );
    }
  }

  @override
  void initState() {
    super.initState();
    Services().sendScreen("Create-pet");
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
            title: const Text("Cadastrar pet"),
          ),

          body: ( _connectionMobx.connectionStatus.toString() == "ConnectivityResult.none" )
          ? const LoadingConnection()
          : ( _cropMobx.sampleImage != null )
          ? CropPage(
            cropMobx: _cropMobx,
          )
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
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar( _cropMobx.settingCamera() );
                          },
                          child: Image.asset(
                            AppImages.loading,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar( _cropMobx.settingCamera() );
                          },
                          child: ( _cropMobx.image == null )
                          ? Image.asset(AppImages.loading)
                          : Image.file(File(_cropMobx.image!.path)),
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
                    controller: _createMobx.controllerName,
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
                  padding: const EdgeInsets.symmetric( vertical: 4, horizontal: 10 ),
                  child: TextField(
                    controller: _createMobx.controllerWeight,
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
                  child: FindDropdown(
                    showSearchBox: false,
                    items: const [
                      "Macho",
                      "Femea",
                    ],
                    label: "Sexo do animal",
                    selectedItem: _createMobx.sex,
                    onChanged: (value) {
                      _createMobx.setSex(value.toString());
                    },
                    dropdownBuilder: (context, sex) {
                      return Container(
                        width: width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.blueSolitude,
                        ),
                        child: ListTile(
                          title: Text(
                            ( _createMobx.sex.trim().isEmpty )
                            ? "Selecione o sexo do animal"
                            : _createMobx.sex,
                          ),
                        ),
                      );
                    },
                    dropdownItemBuilder: (context, sex, isSelected) {
                      return Container(
                        decoration: !isSelected
                        ? null
                        : BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          selected: isSelected,
                          title: Text( sex.toString() ),
                        ),
                      );
                    },
                  ),
                ),

                // especie
                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
                  child: FindDropdown<ModelLifeTime>(
                    items: _lifeTimeManager.list,
                    showSearchBox: false,
                    label: "Especie do animal",
                    errorBuilder: ( context, item ) {
                      return const DropdownError(text: "Nenhuma especie encontrada.");
                    },
                    emptyBuilder: ( item ) {
                      return const DropdownError(text: "Nenhuma especie encontrada.");
                    },
                    onChanged: (value) {
                      _createMobx.setSpecie(value!.name);
                    },
                    dropdownBuilder: (context, specie) {
                      return Container(
                        width: width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.blueSolitude,
                        ),
                        child: ListTile(
                          title: Text(
                            ( _createMobx.specie.trim().isEmpty )
                            ? "Selecione a especie do animal"
                            : _createMobx.specie,
                          ),
                        ),
                      );
                    },
                    dropdownItemBuilder: (context, specie, isSelected) {
                      return Container(
                        decoration: !isSelected
                        ? null
                        : BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          selected: isSelected,
                          title: Text( specie.toString() ),
                        ),
                      );
                    },
                  ),
                ),

                //raca
                Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 4 ),
                  child: TextField(
                    controller: _createMobx.controllerBreed,
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
                  padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 12 ),
                  child: TextField(
                    controller: _createMobx.controllerBirth,
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
                for ( var item in _createMobx.listVaccines )
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
                for ( var item in _createMobx.listHygiene )
                  Hygiene(
                    modelHygiene: item,
                  ),

                Container(
                  padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      if ( _createMobx.clicked == false ) {
                        _createMobx.validateFields( _cropMobx.image, context );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).cardColor,
                      padding: const EdgeInsets.symmetric( vertical: 16, horizontal: 36 ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      ( _createMobx.clicked == false )
                      ? "Cadastrar"
                      : "Aguarde...",
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
