import 'package:flutter/material.dart';

import '../../../consts/dimens.dart';

InputDecorationTheme inputDecorationThemeData(ColorScheme colors, TextTheme textTheme) => InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.never,
  filled: true,
  fillColor: colors.surface,
  isDense: true,
  border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius)
  ),
  hintStyle: textTheme.bodyMedium?.copyWith(color: colors.onBackground),
  contentPadding: const EdgeInsets.all(20),
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colors.error),
      borderRadius: BorderRadius.circular(AppDimens.inputFieldBorderRadius)
  ),
  errorStyle: textTheme.bodyMedium?.copyWith(color: colors.error),
  labelStyle: textTheme.bodySmall,
);