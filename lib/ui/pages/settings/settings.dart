// pacotes nativos flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/data/sources/local/manager/destroy.dart';
import 'package:meus_animais/data/sources/local/manager/logout.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/loading/loading_connection.dart';
import 'package:meus_animais/ui/pages/widgets/loading/loading_settings.dart';
import 'package:meus_animais/ui/pages/widgets/pop_up.dart';
import 'package:meus_animais/ui/styles/app_images.dart';

// import dos pacotes
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final _getUser = getIt.get<GetUserManager>();
  late ConnectionMobx _connectionMobx;

  _goToTerms() {
    Navigator.pushNamed(
      context,
      "/terms",
    );
  }

  _goToPolicy() {
    Navigator.pushNamed(
      context,
      "/policy",
    );
  }

  @override
  void initState() {
    super.initState();
    Services().sendScreen("settings");
    Services().facebookEvent("settings");

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
              FlutterI18n.translate(context, "widgets.settings.appbar"),
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),

          body: ( _connectionMobx.connectionStatus.toString() == "ConnectivityResult.none" )
          ? const LoadingConnection()
          : ( _getUser.modelUser == null )
          ? const LoadingSettings()
          : Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                    radius: 35,
                      backgroundColor: Theme.of(context).unselectedWidgetColor,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Theme.of(context).primaryColor,
                        backgroundImage: AssetImage(
                          AppImages.defaultUser,
                        )
                      ),
                    ),
                    title: Text(
                      _getUser.modelUser!.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      _getUser.modelUser!.email,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  Divider(
                    height: 30,
                    thickness: 1,
                    color: Theme.of(context).unselectedWidgetColor,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // geral
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric( horizontal: 16 ),
                        child: Text(
                          FlutterI18n.translate(context, "widgets.settings.main"),
                          style: const TextStyle(
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
                    color: Theme.of(context).unselectedWidgetColor,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // avaliar
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Services().rateApp();
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                          child: Text(
                            FlutterI18n.translate(context, "widgets.settings.rate"),
                            style: const TextStyle(
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
                    color: Theme.of(context).unselectedWidgetColor,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // desconectar
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (builder) => PopUpWidget(
                                title: FlutterI18n.translate(context, "widgets.settings.logout.title"),
                                text: FlutterI18n.translate(context, "widgets.settings.logout.text"),
                                function: () {
                                  final logout = getIt.get<LogoutManager>();
                                  logout.context = context;
                                  logout.disconnect();
                                },
                              ),
                            );
                          },
                          child: Text(
                            FlutterI18n.translate(context, "widgets.settings.logout.title"),
                            style: const TextStyle(
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
                    color: Theme.of(context).unselectedWidgetColor,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // FAQ
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric( horizontal: 16 ),
                        child: Text(
                          FlutterI18n.translate(context, "widgets.settings.faq"),
                          style: const TextStyle(
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
                    color: Theme.of(context).unselectedWidgetColor,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // solicitar informacoes
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (builder) {
                          return _getUser.infoAccountDialog( context );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                          child: Text(
                            FlutterI18n.translate(context, "widgets.settings.info_account.name"),
                            style: const TextStyle(
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
                    color: Theme.of(context).unselectedWidgetColor,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // Termos de uso
                  GestureDetector(
                    onTap: () {
                      _goToTerms();
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                          child: Text(
                            FlutterI18n.translate(context, "widgets.settings.terms.terms"),
                            style: const TextStyle(
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
                    color: Theme.of(context).unselectedWidgetColor,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // politica de privacidade
                  GestureDetector(
                    onTap: () {
                      _goToPolicy();
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                          child: Text(
                            FlutterI18n.translate(context, "widgets.settings.terms.policy"),
                            style: const TextStyle(
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
                    color: Theme.of(context).unselectedWidgetColor,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // excluir conta
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (builder) => PopUpWidget(
                                title: FlutterI18n.translate(context, "widgets.settings.destroy.title"),
                                text: FlutterI18n.translate(context, "widgets.settings.destroy.text"),
                                function: () {
                                  final destroy = getIt.get<DestroyManager>();
                                  destroy.context = context;
                                  destroy.destroy();
                                },
                              ),
                            );
                          },
                          child: Text(
                            FlutterI18n.translate(context, "widgets.settings.destroy.destroy"),
                            style: const TextStyle(
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
