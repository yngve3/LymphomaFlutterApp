import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lymphoma/consts/dimens.dart';
import 'package:lymphoma/ext/context_ext.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.child,
    this.padding
  });

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: context.colors.background,
        systemNavigationBarColor: context.colors.background,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.only(
          left: AppDimens.padding,
          right: AppDimens.padding,
          top: 35
        ),
        child: child,
      ),
    );
  }
}