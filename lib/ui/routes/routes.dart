// imports nativos do flutter
import 'package:flutter/material.dart';

// import das telas
import 'package:meus_animais/ui/pages/hygiene/create_hygiene.dart';
import 'package:meus_animais/ui/pages/login/forgot_password.dart';
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
      case "/" :
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
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
      case "/vaccines" :
        return MaterialPageRoute(
          builder: (_) => CreateVaccines(petId: args.toString()),
        );
      case "/hygiene" :
        return MaterialPageRoute(
          builder: (_) => CreateHygiene(petId: args.toString()),
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
          appBar: AppBar(
            title: const Text(
              "Tela não encontrada!",
            ),
          ),
          body: const Center(
            child: Text(
              "Tela não encontrada!",
            ),
          ),
        );
      }
    );

  }
}