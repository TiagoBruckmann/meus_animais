// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/data/sources/local/manager/splash.dart';

// import das telas
import 'package:meus_animais/ui/styles/app_images.dart';
import 'package:meus_animais/ui/styles/app_colors.dart';

// import dos pacotes
import 'package:provider/provider.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final _splashManager = getIt.get<SplashManager>();
  late ConnectionMobx _connectionMobx;

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

    Timer(const Duration(seconds: 3), () {
      _splashManager.context = context;
      _splashManager.mobx = _connectionMobx;
      _splashManager.setData();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: Container(
        color: AppColors.amber,
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Image.asset(
            AppImages.logoSplash,
            width: 200,
          ),
        ),
      ),
    );
  }
}
