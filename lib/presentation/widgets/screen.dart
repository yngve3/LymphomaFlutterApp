import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lymphoma/consts/dimens.dart';
import 'package:lymphoma/ext/context_ext.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.child,
    this.padding,
    this.systemColor
  });

  final Widget child;
  final EdgeInsets? padding;
  final Color? systemColor;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: systemColor ?? context.colors.background,
        systemNavigationBarColor: systemColor ?? context.colors.background,
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

class ScrollableScreen extends StatelessWidget {
  const ScrollableScreen({
    super.key,
    required this.child
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Expanded(
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }
}
