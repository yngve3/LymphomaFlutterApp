import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';

import '../../../consts/strings.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/input_field.dart';
import '../../widgets/screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppAppBar(
        title: AppStrings.logon,
        appBar: AppBar(),
      ),
      body: Screen(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  InputField(
                    hint: AppStrings.enterEmail,
                    label: AppStrings.email,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 16),
                  InputField(
                    hint: AppStrings.enterPassword,
                    label: AppStrings.password,
                    isPassword: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            Column(
              children: [
                FilledButton(
                    onPressed: () {},
                    child: Text(AppStrings.login)
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(AppStrings.forgotPassword)
                )
              ],
            )
          ],
        )
      )
    );
  }
}
