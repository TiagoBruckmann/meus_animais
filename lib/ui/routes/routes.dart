// imports nativos do flutter
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

// import dos modelos
import 'package:meus_animais/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_animais/ui/pages/hygiene/create_hygiene.dart';
import 'package:meus_animais/ui/pages/login/forgot_password.dart';
import 'package:meus_animais/ui/pages/pets/edit.dart';
import 'package:meus_animais/ui/pages/settings/settings.dart';
import 'package:meus_animais/ui/pages/vaccines/create.dart';
import 'package:meus_animais/ui/pages/login/register.dart';
import 'package:meus_animais/ui/pages/login/login.dart';
import 'package:meus_animais/ui/pages/splash.dart';
import 'package:meus_animais/ui/pages/home.dart';

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
      case "/forgot_password" :
        return MaterialPageRoute(
          builder: (_) => const ForgotPassword(),
        );
      case "/" :
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case "/detail_pet" :
        return MaterialPageRoute(
          builder: (_) => EditPets(modelPets: args as ModelPets),
        );
      case "/vaccines" :
        final Map params = args as Map;
        return MaterialPageRoute(
          builder: (_) => CreateVaccines(
            petId: params["pet_id"],
            update: params["update"],
          ),
        );
      case "/hygiene" :
        final Map params = args as Map;
        return MaterialPageRoute(
          builder: (_) => CreateHygiene(
            petId: params["pet_id"],
            update: params["update"],
          ),
        );
      case "/settings" :
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
        );
      default:
        _errorRoute();
    }
    return null;

  }

  static Route<dynamic> _errorRoute() {

    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          backgroundColor: Theme.of(_).backgroundColor,
          appBar: AppBar(
            title: Text(
              FlutterI18n.translate(_, "routes.appbar"),
              style: TextStyle(
                color: Theme.of(_).secondaryHeaderColor,
              ),
            ),
          ),
          body: Center(
            child: Text(
              FlutterI18n.translate(_, "routes.appbar"),
            ),
          ),
        );
      }
    );

  }
}