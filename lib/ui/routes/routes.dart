// imports nativos do flutter
import 'package:flutter/material.dart';

// import das telas
import 'package:meus_animais/ui/pages/login/register.dart';
import 'package:meus_animais/ui/pages/login/login.dart';
import 'package:meus_animais/ui/pages/home.dart';

class Routes {

  static Route<dynamic>? generateRoutes(RouteSettings settings) {

    final args = settings.arguments;

    switch( settings.name ) {
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
            builder: (_) => const RegisterPage()
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