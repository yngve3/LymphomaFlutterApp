import 'package:flutter/material.dart';
import 'package:lymphoma/consts/dimens.dart';
import 'package:lymphoma/ext/context_ext.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  AppAppBar({
    super.key,
    this.title = "",
    List<Widget>? actions,
    this.leading
  }) : actions = actions ?? [];

  final List<Widget> actions;
  final String title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.padding,
        right: AppDimens.padding,
        top: 5,
      ),
      child: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: context.colors.background,
        centerTitle: true,
        titleSpacing: 0,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: leading,
        actions: actions.map((action) =>
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: action
            )
        ).toList(),
        toolbarHeight: 44,
        leadingWidth: 44,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
