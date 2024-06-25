import 'package:flutter/material.dart';
import 'package:lymphoma/gen/fonts.gen.dart';

TextTheme textThemeData(ColorScheme colorScheme) => const TextTheme(
  headlineLarge: TextStyle(
    fontFamily: FontFamily.manrope,
    fontWeight: FontWeight.bold,
    fontSize: 40,
  ),
  headlineMedium: TextStyle(
    fontFamily: FontFamily.manrope,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  ),
  headlineSmall: TextStyle(
    fontFamily: FontFamily.manrope,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),

  titleLarge: TextStyle(
    fontFamily: FontFamily.manrope,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  ),
  titleMedium: TextStyle(
    fontFamily: FontFamily.manrope,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  ),

  bodyLarge: TextStyle(
    fontFamily: FontFamily.manrope,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  ),
  bodyMedium: TextStyle(
    fontFamily: FontFamily.manrope,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  ),
  bodySmall: TextStyle(
    fontFamily: FontFamily.manrope,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  ),
);