import 'package:client/themes/elevated_button_theme.dart';
import 'package:client/themes/text_theme.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 34, 40, 49),
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 34, 40, 49),
    secondary: Color.fromARGB(255, 238, 238, 238),
    brightness: Brightness.light,
    onSecondary: Color.fromARGB(255, 118, 171, 174),
    onPrimary: Color.fromARGB(255, 49, 54, 63),
  ),
  primaryColor: const Color.fromARGB(255, 34, 40, 49),
  textTheme: textTheme,
  elevatedButtonTheme: elevatedButtonTheme
);
