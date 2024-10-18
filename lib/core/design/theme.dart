import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Color(0xFFFFFDD0),
    onPrimary: Color(0xEE000000),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF90CAF9),
    onPrimary: Color(0xFF888888),

  ),
);

/*
Color primaryColor = Theme.of(context).colorScheme.primary;
Color accentColor = Theme.of(context).colorScheme.tertiary;
 */
