// pacotes nativos flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/core/widgets/verify_connection.dart';
import 'package:meus_animais/app/pages/settings/widgets/pop_up.dart';
import 'package:meus_animais/app/core/widgets/loading_overlay.dart';
import 'package:meus_animais/app/core/style/app_images.dart';

// import dos domain
import 'package:meus_animais/domain/source/local/mobx/user/user.dart';
import 'package:meus_animais/domain/source/local/mobx/pet/pet.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  late UserMobx _userMobx;
  late PetMobx _petMobx;

  @override
  void initState() {
    super.initState();
    Session.appEvents.sendScreen("settings");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _userMobx = Provider.of<UserMobx>(context);
    _petMobx = Provider.of<PetMobx>(context);

  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return VerifyConnection(
      keyAppBar: "widgets.settings.app_bar",
      page: Observer(
        builder: (context) {

          return LoadingOverlay(
            isLoading: _userMobx.isLoading,
            child: PopScope(
              canPop: false,
              onPopInvokedWithResult: ( value, object ) async => await Session.sharedServices.exitApp(),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [

                    ListTile(
                      leading: CircleAvatar(
                        radius: 35,
                        backgroundColor: theme.colorScheme.onSecondary,
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: theme.colorScheme.primary,
                          backgroundImage: AssetImage(
                            AppImages.defaultUser,
                          ),
                        ),
                      ),
                      title: Text(
                        Session.user.name,
                        style: theme.textTheme.headlineMedium,
                      ),
                      subtitle: Text(
                        Session.user.email,
                        style: theme.textTheme.displayLarge?.apply(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),

                    Divider(
                      height: 30,
                      color: theme.colorScheme.onSecondary,
                    ),

                    // geral
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric( horizontal: 16 ),
                          child: Text(
                            FlutterI18n.translate(context, "widgets.settings.main"),
                            style: theme.textTheme.headlineLarge,
                          ),
                        ),
                      ],
                    ),

                    Divider(
                      height: 30,
                      color: theme.colorScheme.onSecondary,
                    ),

                    // avaliar
                    Row(
                      children: [

                        GestureDetector(
                          onTap: () => Session.sharedServices.rateApp(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                            child: Text(
                              FlutterI18n.translate(context, "widgets.settings.rate"),
                              style: theme.textTheme.displaySmall,
                            ),
                          ),
                        ),

                      ],
                    ),

                    Divider(
                      height: 30,
                      color: theme.colorScheme.onSecondary,
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
                                  title: "widgets.settings.logout.title",
                                  text: "widgets.settings.logout.text",
                                  function: () => _userMobx.logOut(() {
                                    _petMobx.clear();
                                  }),
                                ),
                              );

                            },
                            child: Text(
                              FlutterI18n.translate(context, "widgets.settings.logout.title"),
                              style: theme.textTheme.displaySmall,
                            ),
                          ),
                        ),

                      ],
                    ),

                    Divider(
                      height: 30,
                      color: theme.colorScheme.onSecondary,
                    ),

                    // FAQ
                    Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric( horizontal: 16 ),
                          child: Text(
                            FlutterI18n.translate(context, "widgets.settings.faq"),
                            style: theme.textTheme.headlineLarge,
                          ),
                        ),

                      ],
                    ),

                    Divider(
                      height: 30,
                      color: theme.colorScheme.onSecondary,
                    ),

                    // solicitar informacoes
                    GestureDetector(
                      onTap: () {

                        showDialog(
                          context: context,
                          builder: (builder) => PopUpWidget(
                            title: "widgets.settings.info_account.title",
                            text: "widgets.settings.info_account.description",
                            function: () {
                              Session.appEvents.sendScreen("settings_info_account_apply");
                              _userMobx.requestInfoData();
                            },
                          ),
                        );

                      },
                      child: Row(
                        children: [

                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                            child: Text(
                              FlutterI18n.translate(context, "widgets.settings.info_account.name"),
                              style: theme.textTheme.displaySmall,
                            ),
                          ),

                        ],
                      ),
                    ),

                    Divider(
                      height: 30,
                      color: theme.colorScheme.onSecondary,
                    ),

                    // Termos de uso
                    GestureDetector(
                      onTap: () => _userMobx.goToTerms(),
                      child: Row(
                        children: [

                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                            child: Text(
                              FlutterI18n.translate(context, "widgets.settings.terms.terms"),
                              style: theme.textTheme.displaySmall,
                            ),
                          ),

                        ],
                      ),
                    ),

                    Divider(
                      height: 30,
                      color: theme.colorScheme.onSecondary,
                    ),

                    // politica de privacidade
                    GestureDetector(
                      onTap: () => _userMobx.goToPolicy(),
                      child: Row(
                        children: [

                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                            child: Text(
                              FlutterI18n.translate(context, "widgets.settings.terms.policy"),
                              style: theme.textTheme.displaySmall,
                            ),
                          ),

                        ],
                      ),
                    ),

                    Divider(
                      height: 30,
                      color: theme.colorScheme.onSecondary,
                    ),

                    // excluir conta
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                          child: GestureDetector(
                            onTap: () {

                              Session.appEvents.sharedEvent("settings_delete_account");
                              showDialog(
                                context: context,
                                builder: (builder) => PopUpWidget(
                                  title: "widgets.settings.destroy.title",
                                  text: "widgets.settings.destroy.text",
                                  function: () => _userMobx.deleteAccount(),
                                ),
                              );

                            },
                            child: Text(
                              FlutterI18n.translate(context, "widgets.settings.destroy.destroy"),
                              style: theme.textTheme.displaySmall,
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

        }
      ),
    );
  }
}
