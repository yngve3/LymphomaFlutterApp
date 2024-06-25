import 'package:flutter/material.dart';
import 'package:lymphoma/consts/dimens.dart';

CardTheme cardThemeData() => CardTheme(
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius)
  ),
);