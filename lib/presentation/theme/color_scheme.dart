import 'package:flutter/material.dart';

import 'colors.dart';

class AppColorScheme {
  static get light => const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary300,
    onPrimary: AppColors.neutral100,
    secondary: AppColors.primary200,
    onSecondary: AppColors.neutral100,
    tertiary: AppColors.primary100,
    onTertiary: AppColors.neutral100,
    error: AppColors.system100,
    onError: AppColors.neutral100,
    background: AppColors.neutral300,
    onBackground: AppColors.neutral600,
    surface: AppColors.neutral100,
    onSurface: AppColors.neutral900,
  );
}