import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lymphoma/consts/dimens.dart';
import 'package:lymphoma/ext/context_ext.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.child,
    this.padding,
    this.systemColor,
    this.topPadding = 35,
    this.bottomPadding = 30
  });

  final Widget child;
  final EdgeInsets? padding;
  final Color? systemColor;
  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: systemColor ?? context.colors.background,
        systemNavigationBarColor: systemColor ?? context.colors.background,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.only(
          left: AppDimens.padding,
          right: AppDimens.padding,
          top: topPadding,
          bottom: bottomPadding
        ),
        child: child,
      ),
    );
  }
}

class ScrollableScreen extends StatelessWidget {
  const ScrollableScreen({
    super.key,
    required this.child,
    this.topPadding = 0,
    this.bottomPadding = 0
  });

  final Widget child;
  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Screen(
      bottomPadding: bottomPadding,
      topPadding: topPadding,
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: child,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
