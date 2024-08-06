// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

// import das telas
import 'package:meus_animais/app/pages/splash/mobx/splash.dart';
import 'package:meus_animais/app/core/style/app_colors.dart';
import 'package:meus_animais/app/core/style/app_images.dart';
import 'package:meus_animais/domain/source/local/mobx/user/user.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    final SplashMobx splashMobx = SplashMobx();
    final userMobx = Provider.of<UserMobx>(context);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    Timer(
      const Duration(seconds: 3),
      () => splashMobx.verifyConnection( userMobx ),
    );

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
