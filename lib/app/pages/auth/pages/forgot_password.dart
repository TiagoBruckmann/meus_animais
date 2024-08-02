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

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _mobx = AuthMobx();

  @override
  void initState() {
    super.initState();
    Session.appEvents.sendScreen("forgot_password");
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: Text(
                    FlutterI18n.translate(context, "pages.login.forgot.forgot"),
                    style: const TextStyle(
                      fontSize: 25,
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
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: FlutterI18n.translate(context, "pages.login.email"),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 10),
                child: ElevatedButton(
                  onPressed: () => _mobx.validateFields( AuthTypeEnum.forgot.value ),
                  child: Text(
                    FlutterI18n.translate(context, ( !_mobx.isEmailVerified ) ? "pages.login.forgot.btn_email" : "pages.login.forgot.btn_unreceived"),
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
              ),

              Observer(
                builder: (context) {

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
