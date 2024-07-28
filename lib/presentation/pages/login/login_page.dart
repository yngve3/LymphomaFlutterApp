import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/di/dependencies.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/pages/login/cubit/login_cubit.dart';
import 'package:lymphoma/presentation/widgets/app_bar/back_arrow.dart';

import '../../../consts/strings.dart';
import '../../routing/routes.dart';
import '../../widgets/app_bar/app_app_bar.dart';
import '../../widgets/field_list.dart';
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
            context.go(Routes.patientMain.path);
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<LoginCubit>(context);
          return Scaffold(
              backgroundColor: context.colors.background,
              appBar: AppAppBar(
                title: AppStrings.logon,
                leading: const BackArrow(),
              ),
              body: ScrollableScreen(
                  child: Column(
                    children: [
                      FieldList(
                        fields: state.textFields,
                        onChanged: cubit.onFieldChanged,
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
