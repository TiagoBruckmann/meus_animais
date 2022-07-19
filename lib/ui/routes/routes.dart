// imports nativos do flutter
import 'package:flutter/material.dart';

// import dos modelos
import 'package:meus_pets/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_pets/ui/pages/hygiene/create_hygiene.dart';
import 'package:meus_pets/ui/pages/login/forgot_password.dart';
import 'package:meus_pets/ui/pages/settings/settings.dart';
import 'package:meus_pets/ui/pages/vaccines/create.dart';
import 'package:meus_pets/ui/pages/login/register.dart';
import 'package:meus_pets/ui/pages/login/login.dart';
import 'package:meus_pets/ui/pages/pets/edit.dart';
import 'package:meus_pets/ui/pages/splash.dart';
import 'package:meus_pets/ui/pages/home.dart';

class Routes {

  static Route<dynamic> generateRoutes(RouteSettings settings) {

    final args = settings.arguments;

    switch( settings.name ) {
      case "/splash" :
        return MaterialPageRoute(
          builder: (_) => SplashPage(),
        );
      case "/login" :
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case "/register" :
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
        );
      case "/forgot_password" :
        return MaterialPageRoute(
          builder: (_) => ForgotPassword(),
        );
      case "/" :
        return MaterialPageRoute(
          builder: (_) => HomePage(),
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
          builder: (_) => SettingsPage(),
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
          appBar: AppBar(
            title: Text(
              "Tela não encontrada!",
            ),
          ),
          body: Center(
            child: Text(
              "Tela não encontrada!",
            ),
          ),
        );
      },
    );

  }
}