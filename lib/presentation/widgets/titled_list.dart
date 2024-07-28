import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';

class TitledList extends StatelessWidget {
  const TitledList({
    super.key,
    required this.title,
    this.list = const [],
    this.trailing,
    this.child
  });

  final String title;
  final List<Widget> list;
  final Widget? child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: context.textTheme.headlineMedium),
            trailing ?? const SizedBox.shrink()
          ],
        ),
        const SizedBox(height: 12),
        child ?? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: list.map((element) =>
              Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: element
              )
          ).toList(),
        )
      ],
    );
  }
}
