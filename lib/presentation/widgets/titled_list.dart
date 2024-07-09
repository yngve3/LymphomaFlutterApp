import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';

class TitledList extends StatelessWidget {
  const TitledList({
    super.key,
    required this.title,
    required this.list
  });

  final String title;
  final List<Widget> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: context.textTheme.headlineMedium),
        const SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
