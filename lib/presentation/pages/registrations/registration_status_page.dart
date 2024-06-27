import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';

import '../../../consts/strings.dart';
import '../../widgets/status_page.dart';

class RegistrationStatusPage extends StatelessWidget {
  const RegistrationStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: const StatusPage(
        title: AppStrings.requestStatusTitle,
        subtitle: AppStrings.requestStatusSubtitle
      ),
    );
  }
}
