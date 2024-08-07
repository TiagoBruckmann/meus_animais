// pacotes nativos do flutter
import 'package:flutter/material.dart';
import 'package:meus_animais/app/core/widgets/loading_overlay.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/pages/auth/widgets/copyright.dart';
import 'package:meus_animais/app/pages/auth/mobx/auth.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _mobx = AuthMobx();

  @override
  void initState() {
    super.initState();
    Session.appEvents.sendScreen("register");
  }

  @override
  void dispose() {
    _mobx.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Observer(
      builder: (context) {

        return LoadingOverlay(
          isLoading: _mobx.isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                FlutterI18n.translate(context, "btn_register"),
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 16 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Center(
                        child: Text(
                          FlutterI18n.translate(context, "pages.login.title"),
                          style: theme.textTheme.headlineLarge?.apply(
                            fontWeightDelta: 3,
                          ),
                        ),
                      ),
                    ),

                    // name
                    TextField(
                      controller: _mobx.controllerName,
                      keyboardType: TextInputType.text,
                      style: theme.textTheme.headlineMedium,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.login.register.name"),
                      ),
                    ),

                    // email
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical: 8 ),
                      child: TextField(
                        controller: _mobx.controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        style: theme.textTheme.headlineMedium,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: FlutterI18n.translate(context, "pages.login.email"),
                        ),
                      ),
                    ),

                    // senha
                    TextField(
                      controller: _mobx.controllerPasswd,
                      obscureText: !_mobx.passwdVisible,
                      keyboardType: TextInputType.text,
                      style: theme.textTheme.headlineMedium,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.login.password"),
                        suffixIcon: TextButton(
                          onPressed: () => _mobx.changeVisible(),
                          child: Icon(
                            ( _mobx.passwdVisible )
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: theme.colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 10),
                      child: ElevatedButton(
                        onPressed: () => _mobx.validateFields( AuthTypeEnum.register.value ),
                        child: Text(
                          FlutterI18n.translate(context, "btn_register"),
                          style: theme.textTheme.headlineMedium?.apply(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          _mobx.message,
                          style: theme.textTheme.headlineMedium?.apply(
                            color: theme.colorScheme.error,
                          ),
                        ),
                      ),
                    ),

                    const CopyrightWidget(),

                  ],
                ),
              ),
            ),
          ),
        );

      }
    );
  }
}
