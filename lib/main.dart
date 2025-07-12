// imports nativos
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import dos app
import 'package:meus_animais/app/core/services/firebase_options.dart';
import 'package:meus_animais/app/core/services/languages.dart';
import 'package:meus_animais/app/core/routes/routes.dart';
import 'package:meus_animais/app/core/style/themes.dart';

// import dos domain
import 'package:meus_animais/domain/source/local/mobx/connection/connection.dart';
import 'package:meus_animais/domain/source/local/injection/injection.dart';
import 'package:meus_animais/domain/source/local/mobx/user/user.dart';
import 'package:meus_animais/domain/source/local/mobx/pet/pet.dart';

// import dos pacotes
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: "my_animals",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    return true;
  };

  await FirebasePerformance.instance.setPerformanceCollectionEnabled(true);
  // await FirebasePerformance.instance.setPerformanceCollectionEnabled(!kDebugMode);

  await Session.notifications.init();
  Session.notifications.receiveNotification();

  configureDependencies();

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => ConnectionMobx(),
        ),
        Provider(
          create: (context) => PetMobx(),
        ),
        Provider(
          create: (context) => UserMobx(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: Session.globalContext,
        title: "Meus Animais",
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        onGenerateRoute: Routes.generateRoutes,
        initialRoute: "/splash",
        supportedLocales: supportedLocale,
        localizationsDelegates: localizationsDelegate,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}