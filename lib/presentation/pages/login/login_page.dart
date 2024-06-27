import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/pages/login/cubit/login_cubit.dart';

import '../../../consts/strings.dart';
import '../../routing/routes.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/input_field.dart';
import '../../widgets/screen.dart';
import 'cubit/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<LoginCubit>(context);
          return Scaffold(
              backgroundColor: context.colors.background,
              appBar: AppAppBar(
                title: AppStrings.logon,
                appBar: AppBar(),
              ),
              body: Screen(
                  child: Column(
                    children: [
                      InputField(
                        hint: AppStrings.enterEmail,
                        label: AppStrings.email,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                        onChanged: (value) => cubit.onEmailChanged(value),
                      ),
                      const SizedBox(height: 16),
                      InputField(
                        hint: AppStrings.enterPassword,
                        label: AppStrings.password,
                        isPassword: true,
                        onChanged: (value) => cubit.onPasswordChanged(value),
                      ),
                      const SizedBox(height: 40),
                      FilledButton(
                        onPressed: state.isButtonLogInEnabled ? cubit.login : null,
                        child: const Text(AppStrings.login),
                      ),
                      TextButton(
                        onPressed: () => context.go(Routes.recovery.path),
                        child: const Text(AppStrings.forgotPassword),
                      )
                    ],
                  )
              )
          );
        },
      ),
    );
  }
}
