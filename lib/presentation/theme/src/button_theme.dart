import 'package:flutter/material.dart';
import 'package:lymphoma/consts/dimens.dart';

FilledButtonThemeData filledButtonThemeData(TextTheme textTheme) => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      minimumSize: const Size.fromHeight(46),
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.bottomCenter,
      textStyle: textTheme.titleLarge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.buttonsBorderRadius)
      ),
    )
);

ElevatedButtonThemeData elevatedButtonThemeData(TextTheme textTheme) => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(46),
            padding: const EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.bottomCenter,
            textStyle: textTheme.titleLarge,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.buttonsBorderRadius)
            ),
      ),
);

IconButtonThemeData iconButtonThemeData(TextTheme textTheme) => IconButtonThemeData(
      style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius)
            )
      )
);