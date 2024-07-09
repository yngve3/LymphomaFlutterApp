import 'package:flutter/material.dart';
import 'package:lymphoma/presentation/theme/color_scheme.dart';
import 'package:lymphoma/presentation/theme/src/button_theme.dart';
import 'package:lymphoma/presentation/theme/src/card_theme.dart';
import 'package:lymphoma/presentation/theme/src/decoration_theme.dart';
import 'package:lymphoma/presentation/theme/src/snack_bar_theme.dart';
import 'package:lymphoma/presentation/theme/src/tab_bar_theme.dart';
import 'package:lymphoma/presentation/theme/src/text_theme.dart';

abstract class AppTheme {

  static get light => _createTheme(AppColorScheme.light);

  static _createTheme(ColorScheme colorScheme) {
    final textTheme = textThemeData(colorScheme);
    final filledButtonTheme = filledButtonThemeData(textTheme);
    final elevatedButtonTheme = elevatedButtonThemeData(textTheme);
    final iconButtonTheme = iconButtonThemeData(textTheme);
    final cardTheme = cardThemeData();
    final inputDecorationTheme = inputDecorationThemeData(colorScheme, textTheme);
    final snackBarTheme = snackBarThemeData(colorScheme, textTheme);
    final tabBarTheme = tabBarThemeData(colorScheme, textTheme);
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      filledButtonTheme: filledButtonTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      cardTheme: cardTheme,
      iconButtonTheme: iconButtonTheme,
      inputDecorationTheme: inputDecorationTheme,
      snackBarTheme: snackBarTheme,
      tabBarTheme: tabBarTheme
    );
  }
}