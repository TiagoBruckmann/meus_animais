// import dos pacotes nativos do flutter
import 'package:flutter/material.dart';
import 'dart:async';

// import dos estilos
import 'package:meus_animais/ui/styles/app_colors.dart';

// import das telas
import 'package:meus_animais/ui/routes/routes.dart';

// import dos pacotes
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

// gerenciadores de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';
import 'data/sources/local/injection/injection.dart';

final ThemeData themeDefault = ThemeData(
  primaryColor: AppColors.barossa,
  secondaryHeaderColor: AppColors.cinnabar,
  cardColor: AppColors.turbo,
  fontFamily: 'Ubuntu',

  // altera a cor do texto da status bar
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.barossa,
  ),
);

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  FirebasePerformance.instance;
  configureDependencies();

  // função para alterar a cor da barra de status
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.barossa,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => ConnectionMobx(),
        ),
      ],
      child: MaterialApp(
        title: "Meus animais",
        theme: themeDefault,
        initialRoute: "/splash",
        onGenerateRoute: Routes.generateRoutes,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );

}