// imports nativos do flutter
import 'package:flutter/material.dart';

// import das telas
import 'package:meus_animais/app/pages/auth/pages/forgot_password.dart';
import 'package:meus_animais/app/pages/pets/pages/vaccines/create.dart';
import 'package:meus_animais/app/pages/pets/pages/hygiene/create.dart';
import 'package:meus_animais/app/core/widgets/verify_connection.dart';
import 'package:meus_animais/app/pages/auth/pages/register.dart';
import 'package:meus_animais/app/pages/settings/setting.dart';
import 'package:meus_animais/app/pages/auth/pages/login.dart';
import 'package:meus_animais/app/core/style/app_images.dart';
import 'package:meus_animais/app/pages/splash/splash.dart';
import 'package:meus_animais/app/pages/terms/policy.dart';
import 'package:meus_animais/app/pages/terms/terms.dart';
import 'package:meus_animais/app/pages/pets/create.dart';
import 'package:meus_animais/app/pages/home.dart';

// import dos domain
import 'package:meus_animais/domain/entities/pet.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class Routes {

  static Route<dynamic>? generateRoutes(RouteSettings settings) {

    final args = settings.arguments;

    switch( settings.name ) {
      case "/splash" :
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      case "/login" :
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case "/register" :
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );
      case "/forgot-password" :
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordPage(),
        );
      case "/" :
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case "/pet-detail" :
        return MaterialPageRoute(
          builder: (_) => CreatePet(
            petEntity: args as PetEntity,
          ),
        );
      case "/vaccine" :
        final Map params = args as Map;
        return MaterialPageRoute(
          builder: (_) => CreateVaccinePage(
            petId: params["pet_id"],
            isUpdate: params["is_update"],
          ),
        );
      case "/hygiene" :
        final Map params = args as Map;
        return MaterialPageRoute(
          builder: (_) => CreateHygienePage(
            petId: params["pet_id"],
            isUpdate: params["is_update"],
          ),
        );
      case "/settings" :
        return MaterialPageRoute(
          builder: (_) => const SettingPage(),
        );
      case "/terms" :
        return MaterialPageRoute(
          builder: (_) => const TermsPage(),
        );
      case "/policy" :
        return MaterialPageRoute(
          builder: (_) => const PolicyPage(),
        );
      default:
        _errorRoute();
    }
    return null;

  }

  static Route<dynamic> _errorRoute() {

    return MaterialPageRoute(
      builder: (context) {

        final theme = Theme.of(context);

        return VerifyConnection(
          keyAppBar: "routes.app_bar",
          page: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.asset(
                  AppImages.logo1,
                  height: 100,
                  width: 160,
                ),

                Text(
                  FlutterI18n.translate(context, "routes.title"),
                  style: theme.textTheme.displayLarge!.apply(
                    letterSpacingDelta: 4,
                    fontWeightDelta: 2,
                    fontSizeDelta: 5,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only( top: 25 ),
                  child: Text(
                    FlutterI18n.translate(context, "routes.subtitle"),
                    style: theme.textTheme.displayMedium,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only( top: 50 ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.secondary,
                    ),
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false),
                    child: Text(
                      FlutterI18n.translate(context, "routes.back_home"),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.displayMedium!.apply(
                        color: theme.colorScheme.surfaceContainer,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );

  }
}