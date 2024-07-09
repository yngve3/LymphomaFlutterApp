import 'package:flutter/material.dart';

import '../../../consts/dimens.dart';

TabBarTheme tabBarThemeData(ColorScheme colors, TextTheme textTheme) => TabBarTheme(
  indicator: BoxDecoration(
    borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
    border: Border.all(color: colors.primary),
    color: colors.tertiary
  ),
  splashFactory: NoSplash.splashFactory,
  indicatorSize: TabBarIndicatorSize.tab,
  labelStyle: textTheme.bodyLarge,
  unselectedLabelStyle: textTheme.bodyLarge,
  labelColor: colors.primary,
  unselectedLabelColor: colors.onBackground,
  dividerHeight: 0
);