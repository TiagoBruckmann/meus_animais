// imports nativos
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import das telas
import 'package:meus_animais/app/core/style/app_colors.dart';

class Themes {
  Themes._();

  // global colors
  static const Color _backgroundColor = AppColors.white;
  static const Color _onSecondaryColor = AppColors.balticSea;
  static const Color _errorColor = AppColors.cinnabar;
  static const Color _tertiaryColor = AppColors.blueSolitude;

  // Light colors
  static const Color _primaryColorLight = AppColors.amber;
  static const Color _secondaryColorLight = AppColors.barossa;

  // Dark colors
  static const Color _primaryColorDark = AppColors.barossa;
  static const Color _secondaryColorDark = AppColors.whiteSmoke;

  // .****************
  // Theme - Light
  // .****************
  static const DividerThemeData _dividerThemeDataLight = DividerThemeData(
    color: AppColors.bossanova,
    indent: 16,
    endIndent: 16,
    thickness: 2.5,
  );

  static const TextStyle _headlineLargeTextLight = TextStyle(
    fontWeight: FontWeight.w800,
    color: _secondaryColorLight,
    fontSize: 22,
  );

  static const TextStyle _headlineMediumTextLight = TextStyle(
    color: _secondaryColorLight,
    fontSize: 20,
  );

  static const TextStyle _displayLargeTextLight = TextStyle(
    color: _secondaryColorLight,
    fontSize: 18,
  );

  static const TextStyle _displayMediumTextLight = TextStyle(
    fontWeight: FontWeight.bold,
    color: _secondaryColorLight,
    fontSize: 17,
  );

  static const TextStyle _displaySmallTextLight = TextStyle(
    fontWeight: FontWeight.w500,
    color: _primaryColorLight,
    fontSize: 16,
  );

  static const TextStyle _bodyLargeTextLight = TextStyle(
    color: _secondaryColorLight,
    fontSize: 15,
  );

  static const TextStyle _bodyMediumTextLight = TextStyle(
    color: _secondaryColorLight,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _bodySmallTextLight = TextStyle(
    color: _onSecondaryColor,
  );

  static const TextTheme _textThemeLight = TextTheme(
    headlineLarge: _headlineLargeTextLight,
    headlineMedium: _headlineMediumTextLight,
    displayLarge: _displayLargeTextLight,
    displayMedium: _displayMediumTextLight,
    displaySmall: _displaySmallTextLight,
    bodyLarge: _bodyLargeTextLight,
    bodyMedium: _bodyMediumTextLight,
    bodySmall: _bodySmallTextLight,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _primaryColorLight,
      centerTitle: true,
      titleTextStyle: _bodyMediumTextLight,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: _primaryColorLight,
      ),
      iconTheme: IconThemeData(
        color: _secondaryColorLight,
      ),
    ),
    textTheme: _textThemeLight,
    colorScheme: const ColorScheme.light(
      primary: _primaryColorLight,
      secondary: _secondaryColorLight,
      onSecondary: _onSecondaryColor,
      tertiary: _tertiaryColor,
      error: _errorColor,
    ),
    cardTheme: CardTheme(
      color: _primaryColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 10 ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: _primaryColorLight,
      size: 18,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: _primaryColorLight,
      titleTextStyle: TextStyle(
        color: _secondaryColorLight,
        fontSize: 20,
      ),
      contentTextStyle: TextStyle(
        color: _secondaryColorLight,
      ),
    ),
    dividerTheme: _dividerThemeDataLight,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      labelStyle: _bodySmallTextLight,
      filled: true,
      fillColor: _tertiaryColor,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: _primaryColorLight,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: _primaryColorLight,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      border:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColorLight,
        padding: const EdgeInsets.symmetric( vertical: 16, horizontal: 36 ),
        side: const BorderSide(
          color: _secondaryColorLight,
          width: 3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );

  // .****************
  // Theme - Dark
  // .****************
  static const DividerThemeData _dividerThemeDataDark = DividerThemeData(
    color: AppColors.bossanova,
    indent: 16,
    endIndent: 16,
    thickness: 2.5,
  );

  static const TextStyle _headlineLargeTextDark = TextStyle(
    fontWeight: FontWeight.w800,
    color: _secondaryColorDark,
    fontSize: 22,
  );

  static const TextStyle _headlineMediumTextDark = TextStyle(
    color: _secondaryColorDark,
    fontSize: 20,
  );

  static const TextStyle _displayLargeTextDark = TextStyle(
    color: _secondaryColorDark,
    fontSize: 18,
  );

  static const TextStyle _displayMediumTextDark = TextStyle(
    fontWeight: FontWeight.bold,
    color: _secondaryColorDark,
    fontSize: 17,
  );

  static const TextStyle _displaySmallTextDark = TextStyle(
    fontWeight: FontWeight.w500,
    color: _primaryColorDark,
    fontSize: 16,
  );

  static const TextStyle _bodyLargeTextDark = TextStyle(
    color: _secondaryColorDark,
    fontSize: 15,
  );

  static const TextStyle _bodyMediumTextDark = TextStyle(
    color: _secondaryColorDark,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _bodySmallTextDark = TextStyle(
    color: _onSecondaryColor,
  );

  static const TextTheme _textThemeDark = TextTheme(
    headlineLarge: _headlineLargeTextDark,
    headlineMedium: _headlineMediumTextDark,
    displayLarge: _displayLargeTextDark,
    displayMedium: _displayMediumTextDark,
    displaySmall: _displaySmallTextDark,
    bodyLarge: _bodyLargeTextDark,
    bodyMedium: _bodyMediumTextDark,
    bodySmall: _bodySmallTextDark,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _primaryColorDark,
      centerTitle: true,
      titleTextStyle: _bodyMediumTextDark,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: _primaryColorDark,
      ),
      iconTheme: IconThemeData(
        color: _secondaryColorDark,
      ),
    ),
    textTheme: _textThemeDark,
    colorScheme: const ColorScheme.dark(
      primary: _primaryColorDark,
      secondary: _secondaryColorDark,
      onSecondary: _onSecondaryColor,
      tertiary: _tertiaryColor,
      error: _errorColor,
    ),
    cardTheme: CardTheme(
      color: _primaryColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 10 ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: _primaryColorDark,
      size: 18,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: _primaryColorDark,
      titleTextStyle: TextStyle(
        color: _secondaryColorDark,
        fontSize: 20,
      ),
      contentTextStyle: TextStyle(
        color: _secondaryColorDark,
      ),
    ),
    dividerTheme: _dividerThemeDataDark,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      labelStyle: _bodySmallTextDark,
      filled: true,
      fillColor: _tertiaryColor,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: _primaryColorDark,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: _primaryColorDark,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      border:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColorDark,
        padding: const EdgeInsets.symmetric( vertical: 16, horizontal: 36 ),
        side: const BorderSide(
          color: _secondaryColorDark,
          width: 3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}