import 'package:flutter/material.dart';

ThemeData themeWithColor(Color seedColor, Brightness brightness) {
  return ThemeData(
      colorSchemeSeed: seedColor, brightness: brightness, useMaterial3: true);
}
