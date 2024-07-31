// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meus_animais/app/core/style/app_images.dart';
import 'package:meus_animais/app/core/widgets/verify_connection.dart';
import 'dart:io';

import 'package:meus_animais/domain/source/local/mobx/pet/pet.dart';
import 'package:meus_animais/session.dart';
import 'package:provider/provider.dart';

class PetsPage extends StatefulWidget {
  const PetsPage({super.key});

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {

  late PetMobx _petsMobx;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _petsMobx = Provider.of<PetMobx>(context);

    _petsMobx.getPets();
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return VerifyConnection(
      keyAppBar: "pages.pets.pets.appbar",
      page: Observer(
        builder: ( builder ) {

          return RefreshIndicator(
            onRefresh: () {
              Session.appEvents.sharedEvent("pets_refresh");
              _petsMobx.refresh();
              return _petsMobx.getPets();
            },
            child: ListView.builder(
              itemCount: _petsMobx.listPets.length,
              itemBuilder: ( builder, index ) {

                final pet = _petsMobx.listPets[index];

                return Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 5, vertical: 8 ),
                  child: GestureDetector(
                    onTap: () => _petsMobx.goToDetail( pet ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric( horizontal: 5 ),
                        child: ClipRect(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [

                                Image.asset(
                                  AppImages.banner,
                                ),

                                ( pet.picture.contains("file://") )
                                  ? Image.file(File(pet.picture))
                                  : Image.network(pet.picture),

                                Positioned(
                                  bottom: 0,
                                  child: Card(
                                    color: theme.colorScheme.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric( horizontal: 16, vertical: 7 ),
                                      width: MediaQuery.of(context).size.width - 25,
                                      child: Text(
                                        pet.name,
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );

              },
            ),
          );

        },
      ),
    );
  }
}
