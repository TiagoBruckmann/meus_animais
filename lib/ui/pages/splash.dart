// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

// import dos sources
import 'package:meus_pets/data/sources/remote/services/services.dart';

// import das telas
import 'package:meus_pets/ui/styles/app_images.dart';

// import dos pacotes
import 'package:provider/provider.dart';

// gerencia de estado
import 'package:meus_pets/data/sources/local/mobx/connection/connection.dart';
import 'package:meus_pets/data/sources/local/injection/injection.dart';
import 'package:meus_pets/data/sources/local/manager/splash.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final splashManager = getIt.get<SplashManager>();
  ConnectionMobx _connectionMobx;

  @override
  void initState() {
    super.initState();
    Services().sendScreen("Splash");
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _connectionMobx = Provider.of<ConnectionMobx>(context);
    await _connectionMobx.verifyConnection();
    _connectionMobx.connectivity.onConnectivityChanged.listen(_connectionMobx.updateConnectionStatus);

    Timer(Duration(seconds: 3), () {
       splashManager.mobx = _connectionMobx;
       splashManager.context = context;
       splashManager.setData();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(16),
        child: Center(
          child: Image.asset(
            AppImages.loading,
            width: 200,
          ),
        ),
      ),
    );
  }
}
