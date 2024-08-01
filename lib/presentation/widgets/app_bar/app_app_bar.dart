import 'package:flutter/material.dart';
import 'package:lymphoma/consts/dimens.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/widgets/shimmer.dart';

import '../../../domain/models/loading_state.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  AppAppBar({
    super.key,
    this.title = "",
    List<Widget>? actions,
    this.leading,
    this.titleLoadingState = LoadingState.ok
  }) : actions = actions ?? [];

  final List<Widget> actions;
  final String title;
  final Widget? leading;
  final LoadingState titleLoadingState;

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
        title: switch(titleLoadingState) {
          LoadingState.ok => Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          LoadingState.loading => AppShimmer(
            child: Container(color: Colors.yellow, height: 30, width: 200),
          ),
          LoadingState.error => Text(
            "Имя не определено",
            style: Theme.of(context).textTheme.headlineMedium,
          )
        },
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
