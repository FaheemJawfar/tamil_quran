import 'package:flutter/material.dart';

import 'app_config.dart';

class ColorConfig {
  static const Color primaryColor = Color(0xFF006B3C);
  static const Color backgroundColor = Color(0xFFF1F8F4);
  static const Color popupColor = Color(0xFFE8F5EE);
  static const Color buttonColor = Color(0xFF006B3C);

  // Semantic Colors
  static const Color scaffoldLight = Color(0xFFF1F8F4);
  static const Color scaffoldDark = Colors.black;
  static const Color cardLight = Colors.white;
  static const Color cardDark = Color(0xFF1E1E1E);

  static const Color textLight = Colors.black;
  static const Color textDark = Colors.white;
  static const Color textSecondaryLight = Colors.black54;
  static const Color textSecondaryDark = Colors.white70;

  static ButtonStyle darkModeButtonStyle = ButtonStyle(
    backgroundColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return Colors.black;
      }
      return Colors.transparent;
    }),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    overlayColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return Colors.white;
      }
      return Colors.transparent;
    }),
  );

  static ThemeData quranLightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF006B3C),
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF006B3C),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
    ),
    brightness: Brightness.light,
    fontFamily: AppConfig.appDefaultFont,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFFF1F8F4),
      indicatorColor: const Color(0xFFD1E6DA),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    ),
    useMaterial3: true,
  );

  static ThemeData quranDarkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF006B3C),
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black45,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
    ),
    brightness: Brightness.dark,
    fontFamily: AppConfig.appDefaultFont,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.black,
      indicatorColor: const Color(0xFF004D2C).withAlpha(128),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    ),
    useMaterial3: true,
  );
}
