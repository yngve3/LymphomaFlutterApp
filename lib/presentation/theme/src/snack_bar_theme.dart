import 'package:flutter/material.dart';

import '../../../consts/dimens.dart';

SnackBarThemeData snackBarThemeData(ColorScheme colors, TextTheme textTheme) => SnackBarThemeData(
  backgroundColor: colors.primary,
  insetPadding: const EdgeInsets.all(20),
  contentTextStyle: textTheme.bodyLarge,
  behavior: SnackBarBehavior.floating,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius)
  )
);