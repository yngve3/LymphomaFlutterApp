import 'package:flutter/material.dart';
import 'package:lymphoma/presentation/theme/color_scheme.dart';
import 'package:lymphoma/presentation/theme/src/button_theme.dart';
import 'package:lymphoma/presentation/theme/src/text_theme.dart';

abstract class AppTheme {

  static get light => _createTheme(AppColorScheme.light);

  static _createTheme(ColorScheme colorScheme) {
    final textTheme = textThemeData(colorScheme);
    final filledButtonTheme = filledButtonThemeData(textTheme);
    final elevatedButtonTheme = elevatedButtonThemeData(textTheme);
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      filledButtonTheme: filledButtonTheme,
      elevatedButtonTheme: elevatedButtonTheme
    );
  }
}