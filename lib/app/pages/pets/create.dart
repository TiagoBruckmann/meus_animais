// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'package:meus_animais/app/pages/pets/pages/vaccines/vaccines.dart';

import 'dart:io';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/core/widgets/verify_connection.dart';
import 'package:meus_animais/app/pages/pets/mobx/edit/edit_pet.dart';
import 'package:meus_animais/app/core/widgets/dropdown_error.dart';
import 'package:meus_animais/app/pages/pets/mobx/crop/crop.dart';
import 'package:meus_animais/app/core/style/app_images.dart';

// import dos domain
import 'package:meus_animais/domain/entities/life_time.dart';
import 'package:meus_animais/domain/entities/pet.dart';

// import dos pacotes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myne_find_dropdown/myne_find_dropdown.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class CreatePet extends StatefulWidget {
  final PetEntity? petEntity;
  const CreatePet({ super.key, this.petEntity });

  @override
  State<CreatePet> createState() => _CreatePetState();
}

class _CreatePetState extends State<CreatePet> {

  final _petMobx = EditPetMobx();
  final _cropMobx = CropMobx();
  
  @override
  void initState() {
    super.initState();
    _petMobx.validateIsEdit(widget.petEntity);
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
      keyAppBar: "pages.pets.create.appbar",
      page: SingleChildScrollView(
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
                      onTap: () => _cropMobx.settingCamera(_petMobx.typePage),
                      child: Image.asset(
                        AppImages.banner,
                      ),
                    ),

                    GestureDetector(
                      onTap: () => _cropMobx.settingCamera(_petMobx.typePage),
                      child: ( _cropMobx.image == null )
                        ? Image.asset(AppImages.banner)
                        : Image.file(File(_cropMobx.image!.path)),
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
              padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
              child: TextField(
                controller: _petMobx.controllerName,
                style: theme.textTheme.headlineMedium,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: FlutterI18n.translate(context, "pages.pets.edit.name"),
                ),
              ),
            ),

            // peso
            Padding(
              padding: const EdgeInsets.symmetric( vertical: 4, horizontal: 10 ),
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
            Padding(
              padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
              child: FindDropdown<String>(
                showSearchBox: false,
                items: [
                  FlutterI18n.translate(context, "pages.pets.create.male"),
                  FlutterI18n.translate(context, "pages.pets.create.female"),
                ],
                label: FlutterI18n.translate(context, "pages.pets.create.sex_empty"),
                selectedItem: _petMobx.sex,
                onChanged: ( String? value ) {
                  if ( value == null ) {
                    return;
                  }

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

            // especie
            Padding(
              padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
              child: FindDropdown<LifeTimeEntity>(
                items: _lifeTimeManager.list,
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
                onChanged: ( LifeTimeEntity? value ) {
                  if ( value == null ) {
                    return;
                  }

                  Session.appEvents.logSpecie(value.name);
                  _petMobx.setSpecie(value.name);
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

            //raca
            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 4 ),
              child: TextField(
                controller: _petMobx.controllerBreed,
                style: theme.textTheme.headlineMedium,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: FlutterI18n.translate(context, "pages.pets.edit.breed"),
                ),
              ),
            ),

            // nascimento/adocao
            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 12 ),
              child: TextField(
                controller: _petMobx.controllerBirth,
                style: theme.textTheme.headlineMedium,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: FlutterI18n.translate(context, "pages.pets.edit.birth"),
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
                          padding: const EdgeInsets.only( right: 10 ),
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
                          padding: const EdgeInsets.only( right: 10 ),
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
            for ( var item in _petMobx.listHygiene )
              Hygiene(
                modelHygiene: item,
              ),

            Container(
              padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
              width: width,
              child: ElevatedButton(
                onPressed: () => _petMobx.validateFields( _cropMobx.image ),
                child: Text(
                  FlutterI18n.translate(context, "btn_register"),
                  style: theme.textTheme.headlineMedium,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
