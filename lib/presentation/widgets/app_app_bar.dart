import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/consts/dimens.dart';
import 'package:lymphoma/ext/context_ext.dart';

import '../../gen/assets.gen.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  AppAppBar({
    super.key,
    required this.title,
    required this.appBar,
    List<Widget>? actions,
    this.showBackArrow = true
  }) : actions = actions ?? [];

  final List<Widget> actions;
  final String title;
  final AppBar appBar;
  final bool showBackArrow;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: context.colors.background,
      centerTitle: true,
      titleSpacing: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      leading: Transform.translate(
        offset: const Offset(AppDimens.padding, 0),
        child: showBackArrow ? InkWell(
          onTap: () => context.pop(),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(13.73),
              child: Assets.icons.icArrowLeft.svg(),
            ),
          ),
        ) : null,
      ),
      automaticallyImplyLeading: showBackArrow,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
