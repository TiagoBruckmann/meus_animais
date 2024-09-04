// pacotes nativos flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/pages/pets/pages/widgets/picture_selection.dart';
import 'package:meus_animais/app/pages/pets/pages/vaccines/vaccines.dart';
import 'package:meus_animais/app/pages/pets/pages/camera/crop_page.dart';
import 'package:meus_animais/app/pages/pets/pages/hygiene/hygiene.dart';
import 'package:meus_animais/app/core/widgets/verify_connection.dart';
import 'package:meus_animais/app/pages/pets/mobx/edit/edit_pet.dart';
import 'package:meus_animais/app/core/widgets/loading_overlay.dart';
import 'package:meus_animais/app/core/widgets/dropdown_error.dart';
import 'package:meus_animais/app/pages/pets/mobx/crop/crop.dart';
import 'package:meus_animais/app/core/style/app_images.dart';

// import dos domain
import 'package:meus_animais/domain/source/local/mobx/pet/pet.dart';
import 'package:meus_animais/domain/entities/pet.dart';

// import dos pacotes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myne_find_dropdown/myne_find_dropdown.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CreatePet extends StatefulWidget {
  final PetEntity? petEntity;
  const CreatePet({ super.key, this.petEntity });

  @override
  State<CreatePet> createState() => _CreatePetState();
}

class _CreatePetState extends State<CreatePet> {

  late PetMobx _pets;
  final _petMobx = EditPetMobx();
  final _cropMobx = CropMobx();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pets = Provider.of<PetMobx>(context);
    if ( _petMobx.petDetail == null ) {
      _petMobx.validateIsEdit(widget.petEntity, _pets.listSpecies);
    }
  }

  @override
  void dispose() {
    _petMobx.clear();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return VerifyConnection(
      keyAppBar: ( widget.petEntity != null )
      ? widget.petEntity!.name
      : "pages.pets.create.app_bar",
      page: Observer(
        builder: (context) {

          if ( _cropMobx.isCropImage ) {
            return CropPage(
              mobx: _cropMobx,
            );
          }

          return LoadingOverlay(
            isLoading: _petMobx.isLoading,
            exitApp: !_petMobx.isUpdate,
            child: SingleChildScrollView(
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
                            onTap: () => showPictureSelection( _cropMobx ),
                            child: Image.asset(
                              AppImages.banner,
                            ),
                          ),

                          GestureDetector(
                            onTap: () => showPictureSelection( _cropMobx ),
                            child: ( _cropMobx.croppedData == null && widget.petEntity == null )
                              ? Image.asset(AppImages.banner)
                              : ( _cropMobx.croppedData == null && widget.petEntity != null )
                              ? Image.network(widget.petEntity!.picture)
                              : Image.memory(_cropMobx.croppedData!),
                          ),

                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    width: width,
                    child: Card(
                      color: theme.colorScheme.primary,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric( vertical: 15 ),
                        child: Text(
                          FlutterI18n.translate(context, "pages.pets.edit.detail"),
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ),

                  // nome
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                    child: TextField(
                      controller: _petMobx.controllerName,
                      style: theme.textTheme.headlineMedium,
                      enabled: !_petMobx.isUpdate,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.pets.edit.name"),
                      ),
                    ),
                  ),

                  // peso
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                    child: TextField(
                      controller: _petMobx.controllerWeight,
                      style: theme.textTheme.headlineMedium,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.pets.edit.weight"),
                      ),
                    ),
                  ),

                  // sexo
                  if ( !_petMobx.isUpdate )
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                      child: FindDropdown<String>(
                        showSearchBox: false,
                        items: [
                          FlutterI18n.translate(context, "pages.pets.create.male"),
                          FlutterI18n.translate(context, "pages.pets.create.female"),
                        ],
                        label: FlutterI18n.translate(context, "pages.pets.create.sex_empty"),
                        selectedItem: _petMobx.sex,
                        onChanged: ( String? value ) {
                          if ( value == null ) return;

                          Session.appEvents.logSex(value);
                          _petMobx.setSex(value);
                        },
                        dropdownBuilder: (context, sex) {
                          return Container(
                            width: width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: theme.colorScheme.primary,
                              ),
                              borderRadius: BorderRadius.circular(5),
                              color: theme.colorScheme.tertiary,
                            ),
                            child: ListTile(
                              title: Text(
                                ( _petMobx.sex.trim().isEmpty )
                                    ? FlutterI18n.translate(context, "pages.pets.create.sex_empty")
                                    : _petMobx.sex,
                                style: theme.textTheme.headlineMedium,
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
                                color: theme.colorScheme.primary,
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

                  if ( _petMobx.isUpdate )
                    Padding(
                      padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 8 ),
                      child: TextField(
                        controller: _petMobx.controllerSex,
                        style: theme.textTheme.headlineMedium,
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: FlutterI18n.translate(context, "pages.pets.edit.specie"),
                        ),
                      ),
                    ),

                  // especie
                  if ( !_petMobx.isUpdate )
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                      child: FindDropdown<String>(
                        items: [
                          for ( final item in _petMobx.listSpecies )
                            item.name
                        ],
                        showSearchBox: false,
                        label: FlutterI18n.translate(context, "pages.pets.create.specie_empty"),
                        errorBuilder: ( context, item ) {
                          return const DropdownErrorWidget(
                            text: "pages.pets.create.specie_error",
                          );
                        },
                        emptyBuilder: ( item ) {
                          return const DropdownErrorWidget(
                            text: "pages.pets.create.specie_error",
                          );
                        },
                        onChanged: ( String? value ) {
                          if ( value == null ) {
                            return;
                          }

                          Session.appEvents.logSpecie(value);
                          _petMobx.setSpecie(value);
                        },
                        dropdownBuilder: (context, specie) {
                          return Container(
                            width: width,
                            decoration: BoxDecoration(
                              border: Border.all(color: theme.colorScheme.primary),
                              borderRadius: BorderRadius.circular(5),
                              color: theme.colorScheme.tertiary,
                            ),
                            child: ListTile(
                              title: Text(
                                ( _petMobx.specie.trim().isEmpty )
                                    ? FlutterI18n.translate(context, "pages.pets.create.specie_empty")
                                    : _petMobx.specie,
                                style: theme.textTheme.headlineMedium,
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
                                color: theme.colorScheme.primary,
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

                  if ( _petMobx.isUpdate )
                    Padding(
                      padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 8 ),
                      child: TextField(
                        controller: _petMobx.controllerSpecie,
                        style: theme.textTheme.headlineMedium,
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: FlutterI18n.translate(context, "pages.pets.edit.specie"),
                        ),
                      ),
                    ),

                  // raca
                  Padding(
                    padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 8 ),
                    child: TextField(
                      controller: _petMobx.controllerBreed,
                      style: theme.textTheme.headlineMedium,
                      enabled: !_petMobx.isUpdate,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.pets.edit.breed"),
                      ),
                    ),
                  ),

                  // nascimento/adocao
                  Padding(
                    padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 8 ),
                    child: TextField(
                      controller: ( widget.petEntity != null )
                      ? TextEditingController(text: widget.petEntity!.birth)
                      : _petMobx.controllerBirth,
                      style: theme.textTheme.headlineMedium,
                      enabled: !_petMobx.isUpdate,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.pets.edit.birth"),
                      ),
                    ),
                  ),

                  if ( _petMobx.isUpdate )
                    Padding(
                      padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 8 ),
                      child: TextField(
                        controller: TextEditingController(text: _petMobx.lifeTime),
                        style: theme.textTheme.headlineMedium,
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: FlutterI18n.translate(context, "pages.pets.edit.life_time"),
                        ),
                      ),
                    ),

                  // morte
                  if ( _petMobx.isUpdate )
                    Padding(
                      padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 8 ),
                      child: TextField(
                        controller: _petMobx.controllerDeath,
                        style: theme.textTheme.headlineMedium,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        enabled: _petMobx.controllerDeath.text.trim().isEmpty,
                        decoration: InputDecoration(
                          labelText: FlutterI18n.translate(context, "pages.pets.edit.death"),
                        ),
                      ),
                    ),

                  // card das vacinas
                  SizedBox(
                    width: width,
                    child: Card(
                      color: theme.colorScheme.primary,
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
                              style: theme.textTheme.displayMedium,
                            ),

                            GestureDetector(
                              onTap: () => _petMobx.goToVaccines(),
                              child: Padding(
                                padding: const EdgeInsets.only( right: 15 ),
                                child: FaIcon(
                                  FontAwesomeIcons.circlePlus,
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                  // vacinas
                  for ( final item in _petMobx.listVaccines )
                    VaccinesPage(
                      vaccine: item,
                    ),

                  SizedBox(
                    width: width,
                    child: Card(
                      color: theme.colorScheme.primary,
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
                              style: theme.textTheme.displayMedium,
                            ),

                            GestureDetector(
                              onTap: () => _petMobx.goToHygiene(),
                              child: Padding(
                                padding: const EdgeInsets.only( right: 15 ),
                                child: FaIcon(
                                  FontAwesomeIcons.circlePlus,
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                  // higienes
                  for ( final item in _petMobx.listHygiene )
                    HygienePage(
                      hygiene: item,
                    ),

                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
                    width: width,
                    child: ElevatedButton(
                      onPressed: () => _petMobx.validateFields( _cropMobx.croppedData, _pets ),
                      child: Text(
                        FlutterI18n.translate(context, _petMobx.isUpdate ? "btn_update" : "btn_register"),
                        style: theme.textTheme.headlineMedium?.apply(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );

        }
      ),
    );
  }
}
