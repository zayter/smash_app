import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  primary: const Color.fromRGBO(219, 48, 105, 1),
  secondary: const Color.fromRGBO(34, 34, 34, 1),
  tertiary: const Color.fromRGBO(255, 255, 255, 80),
  primaryContainer: const Color.fromRGBO(151, 151, 151, 1),
  secondaryContainer: const Color.fromRGBO(251, 251, 251, 1),
  tertiaryContainer: const Color.fromRGBO(100, 195, 40, 1),
  seedColor: const Color.fromRGBO(219, 48, 105, 1),
);

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      fontFamily: 'HelveticaNeue',
    ).copyWith(
      useMaterial3: true,
      canvasColor: kColorScheme.background,
      colorScheme: kColorScheme,
      scaffoldBackgroundColor: kColorScheme.background,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.background,
        foregroundColor: kColorScheme.secondary,
      ),
      dividerColor: kColorScheme.primaryContainer,
      drawerTheme: DrawerThemeData(
        surfaceTintColor: kColorScheme.background,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(125, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.background,
          surfaceTintColor: kColorScheme.background,
        ),
      ),
      cardTheme: const CardTheme().copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: Color.fromRGBO(234, 234, 234, 1),
          ),
        ),
        color: kColorScheme.secondaryContainer,
        shadowColor: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(color: Colors.black),
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? kColorScheme.tertiaryContainer
              : const Color.fromRGBO(164, 170, 179, 1),
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: kColorScheme.tertiaryContainer,
        inactiveTrackColor: const Color.fromRGBO(182, 182, 182, 1),
        valueIndicatorColor: kColorScheme.tertiaryContainer,
        thumbColor: kColorScheme.background,
      ),
      textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            color: kColorScheme.secondary,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          titleMedium: TextStyle(
            color: kColorScheme.secondary,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.w700,
            color: kColorScheme.secondary,
            fontSize: 17,
          ),
          bodyMedium: TextStyle(
            color: kColorScheme.secondary,
            fontSize: 15,
          ),
          bodySmall: TextStyle(
            color: kColorScheme.secondary,
            fontSize: 10,
          )),
    );
  }
}
