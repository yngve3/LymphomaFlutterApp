import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/di/dependencies.dart';
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
      create: (context) => getIt.get<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listenWhen: (previousState, state) {
          return state.isButtonLogInEnabled;
        },
        listener: (context, state) {
          if (state.loginError != LogicStrings.init && state.loginError != LogicStrings.ok) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.loginError, textAlign: TextAlign.center))
            );
          } else if (state.loginError == LogicStrings.ok) {
            context.go(Routes.main.path);
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<LoginCubit>(context);
          return Scaffold(
              backgroundColor: context.colors.background,
              appBar: AppAppBar(
                title: AppStrings.logon,
                appBar: AppBar(),
              ),
              body: ScrollableScreen(
                  child: Column(
                    children: [
                      InputField(
                        hint: AppStrings.enterEmail,
                        label: AppStrings.email,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                        onChanged: (value) => cubit.onFieldChanged(FieldNames.email, value),
                        field: state.textFields[FieldNames.email],
                      ),
                      const SizedBox(height: 16),
                      InputField(
                        hint: AppStrings.enterPassword,
                        label: AppStrings.password,
                        isPassword: true,
                        onChanged: (value) => cubit.onFieldChanged(FieldNames.password, value),
                        field: state.textFields[FieldNames.password],
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
