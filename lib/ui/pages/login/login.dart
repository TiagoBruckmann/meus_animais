// pacotes nativos do flutter
import 'package:flutter/material.dart';

// import dos data
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/login.dart';

// import dos pacotes
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/loading/loading_connection.dart';
import 'package:meus_animais/ui/pages/widgets/copyright.dart';
import 'package:meus_animais/ui/styles/app_colors.dart';

// import dos gerenciadores de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';
import 'package:meus_animais/data/sources/local/mobx/login/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late ConnectionMobx _connectionMobx;
  final LoginMobx _loginMobx = LoginMobx();
  final loginManager = getIt.get<LoginManager>();

  @override
  void initState() {
    super.initState();
    Services().sendScreen("login");
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
    _loginMobx.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: ( builder ) {

        return Scaffold(
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
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: Center(
                        child: Text(
                          "Autenticação",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextField(
                        controller: _loginMobx.controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16),
                          labelText: "E-mail",
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

                    // senha
                    TextField(
                      controller: _loginMobx.controllerPasswd,
                      obscureText: ( _loginMobx.passwdVisible == false )
                      ? true
                      : false,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB( 16, 16, 0, 16),
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        filled: true,
                        fillColor: AppColors.blueSolitude,
                        suffixIcon: TextButton(
                          onPressed: () {
                            _loginMobx.changeVisible();
                          },
                          child: Icon(
                            ( _loginMobx.passwdVisible == false )
                            ? Icons.visibility_off
                            : Icons.visibility,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          _loginMobx.validateFields( context );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric( vertical: 16, horizontal: 36 ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.login,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                            ),
                            Text(
                              "Entrar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/register",
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
                            child: Text(
                              "Cadastrar",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {

                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
                            child: Text(
                              "Esqueceu\nsua senha?",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          _loginMobx.message,
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