import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';

import '../../consts/dimens.dart';

class AppTabBarView extends StatelessWidget {
  const AppTabBarView({
    super.key,
    required this.tabNames,
    required this.tabScreens
  });

  final List<String> tabNames;
  final List<Widget> tabScreens;

  @override
  Widget build(BuildContext context) {
    assert(tabNames.length == tabScreens.length);
    return DefaultTabController(
      length: tabNames.length,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
                color: context.colors.surface
              ),
              child: TabBar(
                tabs: tabNames.map((tabName) => Tab(text: tabName)).toList(),
              ),
            )
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              children: tabScreens,
            ),
          )
        ],
      ),
    );
  }
}
