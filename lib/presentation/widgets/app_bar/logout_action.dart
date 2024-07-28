import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/data/repositories/auth_repository.dart';

import '../../routing/routes.dart';
import '../app_icon_button.dart';

class LogoutAction extends StatelessWidget {
  const LogoutAction({super.key});

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: const Icon(Icons.logout),
      onPressed: () {
        AuthRepository().logout();
        context.go(Routes.start.path);
      },
    );
  }
}
