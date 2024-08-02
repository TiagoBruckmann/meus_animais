// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'dart:io';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/pages/pets/pages/widgets/loading_pets.dart';
import 'package:meus_animais/app/core/widgets/verify_connection.dart';
import 'package:meus_animais/app/core/widgets/empty_page.dart';
import 'package:meus_animais/app/core/style/app_images.dart';

// import dos domain
import 'package:meus_animais/domain/source/local/mobx/user/user.dart';
import 'package:meus_animais/domain/source/local/mobx/pet/pet.dart';

// import dos pacotes
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PetsPage extends StatefulWidget {
  const PetsPage({super.key});

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {

  late PetMobx _petsMobx;
  late UserMobx _userMobx;

  @override
  void initState() {
    super.initState();
    Session.appEvents.sendScreen("pets");
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    _petsMobx = Provider.of<PetMobx>(context);
    _userMobx = Provider.of<UserMobx>(context);
    await _petsMobx.getPets();

    _userMobx.verifyVersion();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return VerifyConnection(
      keyAppBar: "pages.pets.pets.app_bar",
      page: Observer(
        builder: ( builder ) {

          if ( _petsMobx.isLoading ) {
            return const LoadingPetsWidget();
          }

          if ( _petsMobx.listPets.isEmpty ) {
            return EmptyPageWidget(
              message: _petsMobx.errorMessage ?? "pages.pets.pets.empty",
            );
          }

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
                      width: width,
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
                                      width: width - 25,
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
