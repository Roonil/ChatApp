import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

//Color primaryColor = Colors.red.shade900.withAlpha(80);
//Color primaryColor = Colors.purple.shade900.withAlpha(100);
//const Color primaryColor = Color.fromARGB(255, 16, 2, 33);
Color primaryColor = Color.fromARGB(255, 4, 0, 28); //Nice Purple
//Color primaryColor = Colors.black;

//Color secondaryColor = Color.fromARGB(255, 53, 235, 255);

//Color secondaryColor = Color.fromARGB(255, 186, 46, 246);
//Color secondaryColor = Colors.white;
//const Color primaryColor = Color.fromARGB(255, 33, 2, 2); //Blood Red
Color secondaryColor = Colors.deepOrangeAccent;
Color? onSecondary = ThemeData(
  colorSchemeSeed: secondaryColor,
  brightness: secondaryColor.isLight ? Brightness.light : Brightness.dark,
  useMaterial3: true,
).textTheme.subtitle1?.color;

final ThemeData themeDataLight = ThemeData(
  colorSchemeSeed: primaryColor,
  brightness: Brightness.light,
  useMaterial3: true,
).copyWith(
  cardTheme: CardTheme(color: primaryColor),
  chipTheme: ChipThemeData(backgroundColor: secondaryColor),
);

final ThemeData themeDataDark = ThemeData(
  colorSchemeSeed: primaryColor,
  brightness: Brightness.dark,
  useMaterial3: true,
);

final ThemeData theme = themeDataLight.copyWith(
    colorScheme: themeDataLight.colorScheme.copyWith(secondary: secondaryColor),
    cardTheme: CardTheme(color: primaryColor),
    chipTheme: ChipThemeData(
        backgroundColor: secondaryColor,
        labelStyle: TextStyle(color: themeDataLight.colorScheme.onSecondary)));

final ThemeData darkTheme = themeDataDark.copyWith(
  scaffoldBackgroundColor: primaryColor,
  cardTheme: CardTheme(color: primaryColor),
  primaryColor: primaryColor,
  colorScheme: themeDataDark.colorScheme.copyWith(
    secondary: secondaryColor,
    onSecondary: onSecondary,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: secondaryColor,
    // labelStyle: TextStyle(
    //     color: ThemeData(
    //   colorSchemeSeed: secondaryColor,
    //   brightness: Brightness.dark,
    //   useMaterial3: true,
    // ).textTheme.subtitle1?.color)
    labelStyle: TextStyle(color: onSecondary),
  ),
);
