// import dos pacotes nativos do flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

// import dos estilos
import 'package:meus_animais/ui/styles/app_colors.dart';

// import das telas
import 'package:meus_animais/ui/routes/routes.dart';

// import dos pacotes
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

// gerenciadores de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';
import 'data/sources/local/injection/injection.dart';

final ThemeData lightTheme = ThemeData(
  backgroundColor: AppColors.white,
  primaryColor: AppColors.amber,
  secondaryHeaderColor: AppColors.barossa,
  focusColor: AppColors.white,
  unselectedWidgetColor: AppColors.balticSea,
  cardColor: AppColors.blueSolitude,
  fontFamily: 'Ubuntu',

  // altera a cor do texto da status bar
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.amber,
    iconTheme: IconThemeData(
      color: AppColors.barossa,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.amber,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  backgroundColor: AppColors.white,
  primaryColor: AppColors.barossa,
  secondaryHeaderColor: AppColors.whiteSmoke,
  focusColor: AppColors.cinnabar,
  unselectedWidgetColor: AppColors.balticSea,
  cardColor: AppColors.blueSolitude,
  fontFamily: 'Ubuntu',

  // altera a cor do texto da status bar
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.barossa,
    iconTheme: IconThemeData(
      color: AppColors.whiteSmoke,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.barossa,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
);

const Iterable<Locale> supportedLocale = [
  Locale("en", "US"),
  Locale("pt", "BR"),
  Locale("pt", "PT"),
];

final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegate = [
  const MaterialLocalisationsDelegate(),
  const CupertinoLocalisationsDelegate(),
  FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
      useCountryCode: false,
      basePath: "assets/languages",
      fallbackFile: ( Platform.localeName == "pt_BR" )
      ? "pt_BR"
      : "en_US",
    ),
  ),
];

class MaterialLocalisationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const MaterialLocalisationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return true;
  }
  @override
  Future<MaterialLocalizations> load(Locale locale) {
    return DefaultMaterialLocalizations.load(locale);
  }
  @override
  bool shouldReload(MaterialLocalisationsDelegate old) {
    return false;
  }
}

class CupertinoLocalisationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const CupertinoLocalisationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return true;
  }
  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return DefaultCupertinoLocalizations.load(locale);
  }
  @override
  bool shouldReload(CupertinoLocalisationsDelegate old) {
    return false;
  }
}

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  FirebasePerformance.instance;
  configureDependencies();

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => ConnectionMobx(),
        ),
      ],
      child: MaterialApp(
        title: "Meus animais",
        theme: lightTheme,
        darkTheme: darkTheme,
        initialRoute: "/splash",
        onGenerateRoute: Routes.generateRoutes,
        debugShowCheckedModeBanner: false,
        supportedLocales: supportedLocale,
        localizationsDelegates: localizationsDelegate,
      ),
    ),
  );

}