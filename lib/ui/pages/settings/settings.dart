// pacotes nativos flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_pets/data/sources/local/injection/injection.dart';
import 'package:meus_pets/data/sources/local/mobx/register/register.dart';
import 'package:meus_pets/data/sources/remote/services/services.dart';
import 'package:meus_pets/data/sources/local/manager/get_user.dart';

// import das telas
import 'package:meus_pets/ui/pages/widgets/loading/loading_connection.dart';
import 'package:meus_pets/ui/pages/widgets/loading/loading_settings.dart';
import 'package:meus_pets/ui/pages/widgets/pop_up.dart';
import 'package:meus_pets/ui/styles/app_images.dart';

// import dos pacotes
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

// gerencia de estado
import 'package:meus_pets/data/sources/local/mobx/connection/connection.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final RegisterMobx _registerMobx = RegisterMobx();
  final _getUser = getIt.get<GetUserManager>();
  ConnectionMobx _connectionMobx;

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
            title: Text(
              FlutterI18n.translate(context, "widgets.settings.appbar"),
            ),
          ),

          body: ( _connectionMobx.connectionStatus.toString() == "ConnectivityResult.none" )
          ? LoadingConnection()
          : ( _getUser.modelUser == null )
          ? LoadingSettings()
          : Container(
            padding: EdgeInsets.all(16),
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
                      _getUser.modelUser.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      _getUser.modelUser.email,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Divider(
                    height: 30,
                    thickness: 1,
                    color: Colors.black,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // geral
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric( horizontal: 16 ),
                        child: Text(
                          FlutterI18n.translate(context, "widgets.settings.main"),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    height: 30,
                    thickness: 1,
                    color: Colors.black,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // dark_theme
                  SwitchListTile(
                    value: _registerMobx.darkTheme,
                    onChanged: ( value ) {
                      _registerMobx.setDarkTheme();
                    },
                    title: Text(
                      FlutterI18n.translate(context, "widgets.settings.dark_mode"),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    activeColor: Theme.of(context).secondaryHeaderColor,
                  ),

                  Divider(
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
                          Services().rateApp();
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 16, 0),
                          child: Text(
                            FlutterI18n.translate(context, "widgets.settings.rate"),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
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
                        padding: EdgeInsets.fromLTRB(30, 0, 16, 0),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (builder) => PopUpWidget(
                                mainContext: context,
                                type: "Logout",
                                title: FlutterI18n.translate(context, "widgets.settings.logout.title"),
                                text: FlutterI18n.translate(context, "widgets.settings.logout.text"),
                              ),
                            );
                          },
                          child: Text(
                            FlutterI18n.translate(context, "widgets.settings.logout.title"),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    height: 30,
                    thickness: 1,
                    color: Colors.black,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // FAQ
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric( horizontal: 16 ),
                        child: Text(
                          FlutterI18n.translate(context, "widgets.settings.faq"),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),

                  /*
                  Divider(
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
                      children: [
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

                  Divider(
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
                        padding: EdgeInsets.fromLTRB(30, 0, 16, 0),
                        child: GestureDetector(
                          onTap: () {
                            // RoutesApp().goToFrequently( context );
                          },
                          child: Text(
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

                   */
                  Divider(
                    height: 30,
                    thickness: 1,
                    color: Colors.black,
                    indent: 25,
                    endIndent: 16,
                  ),

                  // excluir conta
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 16, 0),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (builder) => PopUpWidget(
                                mainContext: context,
                                type: "Destroy",
                                title: FlutterI18n.translate(context, "widgets.settings.destroy.title"),
                                text: FlutterI18n.translate(context, "widgets.settings.destroy.text"),
                              ),
                            );
                          },
                          child: Text(
                            FlutterI18n.translate(context, "widgets.settings.destroy.destroy"),
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
