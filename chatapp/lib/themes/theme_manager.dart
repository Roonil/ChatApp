import 'package:flutter/material.dart';

//Color primaryColor = Colors.red.shade900.withAlpha(80);
//Color primaryColor = Colors.purple.shade900.withAlpha(100);
//const Color primaryColor = Color.fromARGB(255, 16, 2, 33);
Color primaryColor = Color.fromARGB(255, 8, 1, 23);
Color secondaryColor = Color.fromARGB(255, 249, 63, 224);
//const Color primaryColor = Color.fromARGB(255, 33, 2, 2); //Blood Red
//Color secondaryColor = Colors.purple.shade900.withAlpha(100);
final ThemeData themeDataLight = ThemeData(
  colorSchemeSeed: primaryColor,
  brightness: Brightness.light,
  // colorScheme: ColorScheme.fromSeed(
  //         seedColor: primaryColor, brightness: Brightness.light)
  //     .copyWith(secondary: secondaryColor),
  useMaterial3: true,
).copyWith(
//  colorScheme: themeDataLight.colorScheme.copyWith(secondary: secondaryColor),
  cardTheme: CardTheme(color: primaryColor),
  //primaryColor: primaryColor,
  chipTheme: ChipThemeData(backgroundColor: secondaryColor),
);

final ThemeData themeDataDark = ThemeData(
  colorSchemeSeed: primaryColor,
  brightness: Brightness.dark,
  // colorScheme:
  //     ColorScheme.fromSeed(seedColor: primaryColor, brightness: Brightness.dark)
  //         .copyWith(secondary: secondaryColor, background: Colors.black),

  useMaterial3: true,
);

final ThemeData theme = themeDataLight.copyWith(
    colorScheme: themeDataLight.colorScheme.copyWith(secondary: secondaryColor),
    cardTheme: CardTheme(color: primaryColor),
    //primaryColor: primaryColor,
    chipTheme: ChipThemeData(
        backgroundColor: secondaryColor,
        labelStyle: TextStyle(color: themeDataLight.colorScheme.onSecondary)));

final ThemeData darkTheme = themeDataDark.copyWith(
  cardTheme: CardTheme(color: primaryColor),
  primaryColor: primaryColor,
  colorScheme: themeDataDark.colorScheme.copyWith(secondary: secondaryColor),
  chipTheme: ChipThemeData(
      backgroundColor: secondaryColor,
      labelStyle: TextStyle(color: themeDataDark.colorScheme.onSecondary)),
);
