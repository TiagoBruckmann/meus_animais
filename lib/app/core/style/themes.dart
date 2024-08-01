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

  // Light colors
  static const Color _primaryColorLight = AppColors.amber;
  static const Color _secondaryColorLight = AppColors.barossa;
  static const Color _tertiaryColorLight = AppColors.blueSolitude;

  // Dark colors
  static const Color _primaryColorDark = AppColors.barossa;
  static const Color _secondaryColorDark = AppColors.whiteSmoke;
  static const Color _tertiaryColorDark = AppColors.blueSolitude;

  // .****************
  // Theme - Dark
  // .****************
  static const DividerThemeData _dividerThemeDataDark = DividerThemeData(
    color: AppColors.bossanova,
    indent: 16,
    endIndent: 16,
    thickness: 2,
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

  /*
  static const TextStyle _labelMediumTextDark = TextStyle(
    color: _tertiaryColorDark,
    fontSize: 15,
  );

  static const TextStyle _labelSmallTextDark = TextStyle(
    color: _tertiaryColorDark,
    fontSize: 12,
  );
  */

  static const TextTheme _textThemeDark = TextTheme(
    headlineMedium: _headlineMediumTextDark,
    // headlineLarge: _headlineLargeTextDark,
    displayLarge: _displayLargeTextDark,
    displayMedium: _displayMediumTextDark,
    displaySmall: _displaySmallTextDark,
    bodyLarge: _bodyLargeTextDark,
    bodyMedium: _bodyMediumTextDark,
    bodySmall: _bodySmallTextDark
    /*
    labelMedium: _labelMediumTextDark,
    labelSmall: _labelSmallTextDark,
     */
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _primaryColorDark,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: _primaryColorDark,
      ),
      iconTheme: IconThemeData(
        color: _secondaryColorDark,
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      labelTextStyle: WidgetStateProperty.resolveWith((states) => _displaySmallTextDark),
      color: _primaryColorDark,
      elevation: 8,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: _primaryColorDark,
      surfaceTintColor: _secondaryColorDark,
    ),
    textTheme: _textThemeDark,
    colorScheme: const ColorScheme.dark(
      primary: _primaryColorDark,
      secondary: _secondaryColorDark,
      onSecondary: _onSecondaryColor,
      tertiary: _tertiaryColorDark,
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
      fillColor: _tertiaryColorDark,
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
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _secondaryColorDark,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 30 ),
      ),
    ),
  );
}