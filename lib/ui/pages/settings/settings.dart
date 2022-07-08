// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';
import 'package:meus_animais/data/sources/local/manager/logout.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/loading/loading_connection.dart';

// import dos pacotes
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meus_animais/ui/styles/app_images.dart';
import 'package:provider/provider.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final getUser = getIt.get<GetUserManager>();
  late ConnectionMobx _connectionMobx;

  @override
  void initState() {
    super.initState();
    Services().sendScreen("settings");
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
            title: const Text("Perfil"),
          ),

          body: ( _connectionMobx.connectionStatus.toString() == "ConnectivityResult.none" )
          ? const LoadingConnection()
          : Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                    radius: 35,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Theme.of(context).primaryColor,
                        backgroundImage: AssetImage(
                          AppImages.defaultUser,
                        )
                      ),
                    ),
                    title: Text(
                      getUser.modelUser!.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      getUser.modelUser!.email,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const Divider(
                    height: 30,
                    thickness: 1,
                    color: Colors.black,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // geral
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric( horizontal: 16 ),
                        child: Text(
                          "GERAL",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(
                    height: 30,
                    thickness: 1,
                    color: Colors.black,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // Sugestões
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // _goToRateApp();
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 16, 0),
                          child: Text(
                            "Deixe sua opnião sobre o app",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 30,
                    thickness: 1,
                    color: Colors.black,
                    indent: 25,
                    endIndent: 16,
                  ),

                  // desconectar
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                        child: GestureDetector(
                          onTap: () {
                            final logout = getIt.get<LogoutManager>();
                            logout.context = context;
                            logout.disconnect();
                          },
                          child: const Text(
                            "Desconectar",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(
                    height: 30,
                    thickness: 1,
                    color: Colors.black,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // FAQ
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric( horizontal: 16 ),
                        child: Text(
                          "FAQ",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(
                    height: 30,
                    thickness: 1,
                    color: Colors.black,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // Estou com duvidas
                  GestureDetector(
                    onTap: () {
                      // _questions();
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 16, 0),
                          child: Text(
                            "Estou com duvidas",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Divider(
                    height: 30,
                    thickness: 1,
                    color: Colors.black,
                    indent: 25,
                    endIndent: 16,
                  ),

                  // perguntas frequentes
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                        child: GestureDetector(
                          onTap: () {
                            // RoutesApp().goToFrequently( context );
                          },
                          child: const Text(
                            "Perguntas frequentes",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(
                    height: 30,
                    thickness: 1,
                    color: Colors.black,
                    indent: 25,
                    endIndent: 16,
                  ),

                  // como deletar a conta
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                        child: GestureDetector(
                          onTap: () {
                            // _destroy();
                          },
                          child: const Text(
                            "Excluir minha conta",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        );

      },
    );
  }
}
