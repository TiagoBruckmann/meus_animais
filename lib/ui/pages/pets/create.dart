// pacotes nativos flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/data/sources/local/manager/life_time.dart';
import 'package:meus_animais/data/sources/local/mobx/crop/crop.dart';
import 'package:meus_animais/data/sources/local/mobx/pets/pets.dart';
import 'package:meus_animais/domain/models/life_time/life_time.dart';
import 'package:meus_animais/ui/pages/widgets/dropdown_error.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/loading/loading_connection.dart';
import 'package:meus_animais/ui/pages/widgets/camera/crop_page.dart';
import 'package:meus_animais/ui/pages/widgets/card_pets.dart';
import 'package:meus_animais/ui/styles/app_colors.dart';
import 'package:meus_animais/ui/styles/app_images.dart';

// import dos pacotes
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';

class CreatePetPage extends StatefulWidget {
  const CreatePetPage({Key? key}) : super(key: key);

  @override
  State<CreatePetPage> createState() => _CreatePetPageState();
}

class _CreatePetPageState extends State<CreatePetPage> {

  final _lifeTimeManager = getIt.get<LifeTimeManager>();
  final PetsMobx _petsMobx = PetsMobx();
  final CropMobx _cropMobx = CropMobx();
  late ConnectionMobx _connectionMobx;

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
                          : Image.file(_cropMobx.image!),
                        ),

                      ],
                    ),
                  ),
                ),

                const CardPetsWidget(title: "Dados do pet"),

                // nome
                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
                  child: TextField(
                    controller: _petsMobx.controllerName,
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
                    controller: _petsMobx.controllerWeight,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textInputAction: TextInputAction.next,
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
                    selectedItem: _petsMobx.sex,
                    onChanged: (value) {
                      _petsMobx.setSex(value.toString());
                    },
                    dropdownBuilder: (context, ticketsPerUser) {
                      return Container(
                        width: width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.blueSolitude,
                        ),
                        child: ListTile(
                          title: Text(
                            ( _petsMobx.sex.trim().isEmpty )
                            ? "Selecione o sexo do animal"
                            : _petsMobx.sex,
                          ),
                        ),
                      );
                    },
                    // controi a lista de tickets permitido para cada usuário
                    dropdownItemBuilder: (context, ticketsPerUser, isSelected) {
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
                          title: Text( ticketsPerUser.toString() ),
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
                      _petsMobx.setSpecie(value!.name);
                    },
                    dropdownBuilder: (context, ticketsPerUser) {
                      return Container(
                        width: width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.blueSolitude,
                        ),
                        child: ListTile(
                          title: Text(
                            ( _petsMobx.specie.trim().isEmpty )
                            ? "Selecione a especie do animal"
                            : _petsMobx.specie,
                          ),
                        ),
                      );
                    },
                    // controi a lista de tickets permitido para cada usuário
                    dropdownItemBuilder: (context, ticketsPerUser, isSelected) {
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
                          title: Text( ticketsPerUser.toString() ),
                        ),
                      );
                    },
                  ),
                ),

                //raca
                Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 4 ),
                  child: TextField(
                    controller: _petsMobx.controllerBreed,
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
                    controller: _petsMobx.controllerBirth,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textInputAction: TextInputAction.next,
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

                const CardPetsWidget(title: "Vacinas"),

                const CardPetsWidget(title: "Higiene"),

                Container(
                  padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      _petsMobx.validateFields( _cropMobx.image, context );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).cardColor,
                      padding: const EdgeInsets.symmetric( vertical: 16, horizontal: 36 ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Cadastrar",
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
