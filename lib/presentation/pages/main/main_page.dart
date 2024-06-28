import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/widgets/screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollableScreen(
        child: Center(
          child: Text(
            "MAIN PAGE",
            style: context.textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}
