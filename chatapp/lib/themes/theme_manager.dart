import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(255, 16, 2, 33);
final ThemeData themeDataLight = ThemeData(
  colorSchemeSeed: primaryColor,
  brightness: Brightness.light,
  useMaterial3: true,
).copyWith(
  cardTheme: const CardTheme(color: Colors.purple),
  //primaryColor: primaryColor,
  chipTheme: const ChipThemeData(backgroundColor: Colors.purple),
);

final ThemeData themeDataDark = ThemeData(
  colorSchemeSeed: primaryColor,
  brightness: Brightness.dark,
  useMaterial3: true,
).copyWith(
  cardTheme: const CardTheme(color: primaryColor),
  primaryColor: primaryColor,
  chipTheme: const ChipThemeData(backgroundColor: Colors.deepPurple),
);
