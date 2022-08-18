// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'dart:io';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/loading/loading_connection.dart';
import 'package:meus_animais/ui/pages/widgets/loading/refresh_widget.dart';
import 'package:meus_animais/ui/pages/widgets/loading/loading_pets.dart';
import 'package:meus_animais/ui/styles/app_images.dart';

// import dos pacotes
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';
import 'package:meus_animais/data/sources/local/manager/show_notification.dart';
import 'package:meus_animais/data/sources/local/mobx/pets/pets.dart';

class PetsPage extends StatefulWidget {
  const PetsPage({Key? key}) : super(key: key);

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {

  final _showNotification = getIt.get<ShowNotificationManager>();
  final PetsMobx _petsMobx = PetsMobx();
  late ConnectionMobx _connectionMobx;

  @override
  void initState() {
    super.initState();
    Services().sendScreen("Pets");
    Services().facebookEvent("Pets");
    Services().verifyVersion(context);
    _showNotification.context = context;
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

        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Text(
              FlutterI18n.translate(context, "pages.pets.pets.appbar"),
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),

          body: ( _connectionMobx.connectionStatus.toString() == "ConnectivityResult.none" )
          ? const LoadingConnection()
          : RefreshIndicator(
            onRefresh: () {
              setState(() {
                _petsMobx.refresh();
              });
              return _petsMobx.getPets( context );
            },
            child: FutureBuilder<List<ModelPets>>(
              future: _petsMobx.getPets( context ),
              builder: ( context, snapshot ) {

                if ( snapshot.connectionState == ConnectionState.waiting ) {
                  return const LoadingPetsWidget();
                } else if ( snapshot.hasError ) {

                  return RefreshIndicator(
                    onRefresh: () {
                      setState(() {
                        _petsMobx.refresh();
                      });
                      return _petsMobx.getPets( context );
                    },
                    child: RefreshWidget(
                      message: FlutterI18n.translate(context, "pages.pets.pets.empty"),
                    ),
                  );
                } else if ( _petsMobx.listPets.isEmpty ) {
                  return RefreshIndicator(
                    onRefresh: () {
                      setState(() {
                        _petsMobx.refresh();
                      });
                      return _petsMobx.getPets( context );
                    },
                    child: RefreshWidget(
                      message: FlutterI18n.translate(context, "pages.pets.pets.empty"),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: _petsMobx.listPets.length,
                  itemBuilder: ( context, index ) {

                    ModelPets modelPets = _petsMobx.listPets[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric( horizontal: 5, vertical: 8 ),
                      child: GestureDetector(
                        onTap: () {
                          Map<String, dynamic> params = {
                            "model_pets": modelPets,
                          };
                          Navigator.pushNamed(
                            context,
                            "/detail_pet",
                            arguments: params,
                          );
                        },
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

                                    ( modelPets.picture.contains("file://") )
                                    ? Image.file(File(modelPets.picture))
                                    : Image.network(modelPets.picture),

                                    Positioned(
                                      bottom: 0,
                                      child: Card(
                                        color: Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric( horizontal: 16, vertical: 7 ),
                                          width: MediaQuery.of(context).size.width - 25,
                                          child: Text(
                                            modelPets.name,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Theme.of(context).secondaryHeaderColor,
                                              fontWeight: FontWeight.bold,
                                            ),
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
                );

              },
            ),
          ),
        );

      },
    );
  }
}
