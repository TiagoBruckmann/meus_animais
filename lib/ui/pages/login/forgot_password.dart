// pacotes nativos do flutter
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

// import dos data
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos pacotes
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/loading/loading_connection.dart';
import 'package:meus_animais/ui/pages/widgets/copyright.dart';
import 'package:meus_animais/ui/styles/app_colors.dart';

// import dos gerenciadores de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';
import 'package:meus_animais/data/sources/local/mobx/forgot/forgot.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  late ConnectionMobx _connectionMobx;
  final ForgotMobx _forgotMobx = ForgotMobx();
  // final loginManager = getIt.get<LoginManager>();

  @override
  void initState() {
    super.initState();
    Services().sendScreen("forgot_password");
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _connectionMobx = Provider.of<ConnectionMobx>(context);
    await _connectionMobx.verifyConnection();
    _connectionMobx.connectivity.onConnectivityChanged.listen(_connectionMobx.updateConnectionStatus);
  }

  @override
  void dispose() {
    super.dispose();
    _forgotMobx.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: ( builder ) {

        return Scaffold(
          appBar: AppBar(
            title: Text(
              FlutterI18n.translate(context, "pages.login.forgot.appbar"),
            ),
          ),
          body: ( _connectionMobx.connectionStatus.toString() == "ConnectivityResult.none" )
          ? const LoadingConnection()
          : Container(
            decoration: const BoxDecoration(color: AppColors.white),
            padding: const EdgeInsets.all(16),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /*
                    Image.asset(
                      AppImages.logo2,
                      width: 100,
                      height: 100,
                    ),
                    */
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
                        controller: _forgotMobx.controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16),
                          labelText: FlutterI18n.translate(context, "pages.login.email"),
                          labelStyle: const TextStyle(
                            color: AppColors.barossa,
                          ),
                          filled: true,
                          fillColor: AppColors.blueSolitude,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          _forgotMobx.validateEmail( context );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric( vertical: 16, horizontal: 36 ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          ( _forgotMobx.emailVerified == false )
                          ? FlutterI18n.translate(context, "pages.login.forgot.btn_email")
                          : FlutterI18n.translate(context, "pages.login.forgot.btn_unreceived"),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          _forgotMobx.message,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
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
      },
    );
  }
}
