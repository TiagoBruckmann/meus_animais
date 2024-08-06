// pacotes nativos do flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/pages/auth/widgets/copyright.dart';
import 'package:meus_animais/app/pages/auth/mobx/auth.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _mobx = AuthMobx();

  @override
  void initState() {
    super.initState();
    Session.appEvents.sendScreen("login");
  }

  @override
  void dispose() {
    _mobx.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric( horizontal: 16, vertical: 10 ),
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

              Padding(
                padding: const EdgeInsets.only(bottom: 8),
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
              Observer(
                builder: (context) {

                  return TextField(
                    controller: _mobx.controllerPasswd,
                    obscureText: _mobx.passwdVisible,
                    keyboardType: TextInputType.text,
                    style: theme.textTheme.headlineMedium,
                    decoration: InputDecoration(
                      labelText: FlutterI18n.translate(context, "pages.login.password"),
                      suffixIcon: TextButton(
                        onPressed: () => _mobx.changeVisible(),
                        child: Icon(
                          ( !_mobx.passwdVisible )
                            ? Icons.visibility_off
                            : Icons.visibility,
                          color: theme.colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  );

                }
              ),

              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 10),
                child: ElevatedButton(
                  onPressed: () => _mobx.validateFields( AuthTypeEnum.login.value ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Icon(
                        Icons.login,
                        color: theme.colorScheme.secondary,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          FlutterI18n.translate(context, "btn_login"),
                          style: theme.textTheme.headlineMedium?.apply(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  GestureDetector(
                    onTap: () => _mobx.goToRegister(),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                      child: Text(
                        FlutterI18n.translate(context, "btn_register"),
                        style: theme.textTheme.displaySmall?.apply(
                          color: theme.colorScheme.onSecondary,
                          fontWeightDelta: 2,
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () => _mobx.goToForgot(),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                      child: Text(
                        FlutterI18n.translate(context, "pages.login.login.forgot"),
                        style: theme.textTheme.displaySmall?.apply(
                          color: theme.colorScheme.onSecondary,
                          fontWeightDelta: 2,
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              Observer(
                builder: (context) {

                  if ( _mobx.message.trim().isEmpty ) {
                    return const Padding(padding: EdgeInsets.zero);
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Text(
                        _mobx.message,
                        style: theme.textTheme.headlineMedium?.apply(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                  );

                }
              ),

              const CopyrightWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
