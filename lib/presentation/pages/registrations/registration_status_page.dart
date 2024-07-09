import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/data/repositories/auth_repository.dart';
import 'package:lymphoma/ext/context_ext.dart';

import '../../../consts/strings.dart';
import '../../routing/routes.dart';
import '../../widgets/status_page.dart';

class RegistrationStatusPage extends StatelessWidget {
  const RegistrationStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: StatusPage(
        title: AppStrings.requestStatusTitle,
        subtitle: AppStrings.requestStatusSubtitle,
        bottom: Column(
          children: [
            ElevatedButton(
              child: const Text(AppStrings.toStartPage),
              onPressed: () {
                AuthRepository().logout();
                context.go(Routes.start.path);
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text("Обновить"),
              onPressed: () {
                context.go(Routes.patientMain.path);
              },
            ),
          ],
        )
      ),
    );
  }
}
