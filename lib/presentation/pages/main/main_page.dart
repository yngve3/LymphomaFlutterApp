import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/data/repositories/auth_repository.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/widgets/screen.dart';

import '../../routing/routes.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollableScreen(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "MAIN PAGE",
                style: context.textTheme.headlineLarge,
              ),
              FilledButton(
                onPressed: () {
                  AuthRepository().logout();
                  context.go(Routes.start.path);
                },
                child: const Text("Выход"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
