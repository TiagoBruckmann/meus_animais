// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_pets.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/loading/loading_connection.dart';
import 'package:meus_animais/ui/pages/widgets/loading/refresh_widget.dart';
import 'package:meus_animais/ui/pages/widgets/loading/loading_pets.dart';
import 'package:meus_animais/ui/styles/app_images.dart';

// import dos pacotes
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';

class PetsPage extends StatefulWidget {
  const PetsPage({Key? key}) : super(key: key);

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {

  late ConnectionMobx _connectionMobx;
  final _getPets = getIt.get<GetPetsManager>();

  @override
  void initState() {
    super.initState();
    Services().sendScreen("Pets");
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
          appBar: AppBar(
            title: const Text("Pets"),
          ),

          body: ( _connectionMobx.connectionStatus.toString() == "ConnectivityResult.none" )
          ? const LoadingConnection()
          : RefreshIndicator(
            onRefresh: () {
              return _getPets.refresh();
            },
            child: FutureBuilder<List<ModelPets>>(
              future: _getPets.getPets(),
              builder: ( context, snapshot ) {

                if ( snapshot.connectionState == ConnectionState.waiting ) {
                  return const LoadingPetsWidget();
                } else if ( snapshot.hasError ) {

                  return RefreshIndicator(
                    onRefresh: () {
                      return _getPets.refresh();
                    },
                    child: const RefreshWidget( message: "Nenhum pet encontrado no momento!", ),
                  );
                } else if ( _getPets.listPets.isEmpty ) {

                  return RefreshIndicator(
                    onRefresh: () {
                      return _getPets.refresh();
                    },
                    child: const RefreshWidget( message: "Nenhum pet encontrado no momento!", ),
                  );
                }

                return ListView.builder(
                  itemCount: _getPets.listPets.length,
                  itemBuilder: ( context, index ) {

                    ModelPets modelPets = _getPets.listPets[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric( horizontal: 5, vertical: 8 ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/detail_pet",
                            arguments: modelPets
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
                                      AppImages.loading,
                                    ),

                                    // ao carregar a imagem, sobrepor com o loading com a imagem do pet
                                    Image.network(
                                      modelPets.picture,
                                    ),

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
                                            style: const TextStyle(
                                              color: Colors.white,
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
