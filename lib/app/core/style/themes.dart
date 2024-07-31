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
  // Theme - Light
  // .****************
  static const DividerThemeData _dividerThemeDataLight = DividerThemeData(
    color: AppColors.bossanova,
    indent: 16,
    endIndent: 16,
    thickness: 2,
  );

  /*
  static const TextStyle _headlineLargeTextLight = TextStyle(
    fontWeight: FontWeight.bold,
    color: _textPrimaryLight,
    fontSize: 18,
  );

  static const TextStyle _displayLargeTextLight = TextStyle(
    fontWeight: FontWeight.w600,
    color: _textPrimaryLight,
    fontSize: 20,
  );
  */

  static const TextStyle _displayMediumTextLight = TextStyle(
    fontWeight: FontWeight.w500,
    color: _primaryColorLight,
    fontSize: 16,
  );

  /*
  static const TextStyle _displaySmallTextLight = TextStyle(
    color: _tertiaryColorLight,
    fontSize: 17,
  );
  */

  static const TextStyle _bodyMediumTextLight = TextStyle(
    color: _secondaryColorLight,
    fontWeight: FontWeight.bold,
  );

  /*
  static const TextStyle _labelMediumTextLight = TextStyle(
    color: _tertiaryColorLight,
    fontSize: 15,
  );

  static const TextStyle _labelSmallTextLight = TextStyle(
    color: _tertiaryColorLight,
    fontSize: 12,
  );
   */

  static const TextTheme _textThemeLight = TextTheme(
    /*
    headlineLarge: _headlineLargeTextLight,
    displayLarge: _displayLargeTextLight,
     */
    displayMedium: _displayMediumTextLight,
    /*
    displaySmall: _displaySmallTextLight,
    */
    bodyMedium: _bodyMediumTextLight,
    /*
    labelMedium: _labelMediumTextLight,
    labelSmall: _labelSmallTextLight,
     */
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _primaryColorLight,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: _primaryColorLight,
      ),
      iconTheme: IconThemeData(
        color: _secondaryColorLight,
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      labelTextStyle: WidgetStateProperty.resolveWith((states) => _displayMediumTextLight),
      color: _primaryColorLight,
      elevation: 8,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: _primaryColorLight,
      surfaceTintColor: _secondaryColorLight,
    ),
    textTheme: _textThemeLight,
    colorScheme: const ColorScheme.light(
      primary: _primaryColorLight,
      secondary: _secondaryColorLight,
      onSecondary: _onSecondaryColor,
      tertiary: _tertiaryColorLight,
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
      contentPadding: const EdgeInsets.all(8),
      labelStyle: _bodyMediumTextLight,
      filled: true,
      fillColor: Colors.transparent,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: _onSecondaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: _onSecondaryColor,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      border:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _backgroundColor,
        padding: const EdgeInsets.all(12),
        side: const BorderSide(
          color: _secondaryColorLight,
          width: 3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _secondaryColorLight,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 30 ),
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
    thickness: 2,
  );

  /*
  static const TextStyle _headlineLargeTextDark = TextStyle(
    fontWeight: FontWeight.bold,
    color: _textPrimaryDark,
    fontSize: 18,
  );

  static const TextStyle _displayLargeTextDark = TextStyle(
    fontWeight: FontWeight.w600,
    color: _textPrimaryDark,
    fontSize: 20,
  );
  */

  static const TextStyle _displayMediumTextDark = TextStyle(
    fontWeight: FontWeight.w500,
    color: _primaryColorDark,
    fontSize: 16,
  );

  /*
  static const TextStyle _displaySmallTextDark = TextStyle(
    color: _tertiaryColorDark,
    fontSize: 17,
  );
  */

  static const TextStyle _bodyMediumTextDark = TextStyle(
    color: _secondaryColorDark,
    fontWeight: FontWeight.bold,
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
    /*
    headlineLarge: _headlineLargeTextDark,
    displayLarge: _displayLargeTextDark,
    */
    displayMedium: _displayMediumTextDark,
    // displaySmall: _displaySmallTextDark,
    bodyMedium: _bodyMediumTextDark,
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
      labelTextStyle: WidgetStateProperty.resolveWith((states) => _displayMediumTextDark),
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
      contentPadding: const EdgeInsets.all(8),
      labelStyle: _bodyMediumTextDark,
      filled: true,
      fillColor: Colors.transparent,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: _onSecondaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: _onSecondaryColor,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      border:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _backgroundColor,
        padding: const EdgeInsets.all(12),
        side: const BorderSide(
          color: _secondaryColorDark,
          width: 3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
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