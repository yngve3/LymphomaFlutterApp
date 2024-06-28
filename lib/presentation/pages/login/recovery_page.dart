import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/consts/dimens.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/pages/login/cubit/login_cubit.dart';
import 'package:lymphoma/presentation/widgets/app_app_bar.dart';
import 'package:lymphoma/presentation/widgets/icon_with_card.dart';

import '../../../consts/strings.dart';
import '../../routing/routes.dart';
import '../../widgets/input_field.dart';
import '../../widgets/screen.dart';
import 'cubit/login_state.dart';

class RecoveryPage extends StatelessWidget {
  const RecoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<LoginCubit>(context);
          return Scaffold(
            appBar: AppAppBar(
              appBar: AppBar(),
              title: AppStrings.recovery,
            ),
            body: Screen(
              child: Column(
                children: [
                  const Text(AppStrings.recoveryHint),
                  const SizedBox(height: 28),
                  InputField(
                    hint: AppStrings.enterEmail,
                    label: AppStrings.email,
                    requestFocus: true,
                    textInputType: TextInputType.emailAddress,
                    onChanged: (value) => cubit.onFieldChanged(FieldNames.email, value),
                    field: state.textFields[FieldNames.email],
                  ),
                  const SizedBox(height: 40),
                  FilledButton(
                      onPressed: state.isButtonRecoveryEnabled ? () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog.fullscreen(
                                backgroundColor: context.colors.background,
                                child: Screen(
                                    padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const IconWithCardVariant(),
                                          const SizedBox(height: 28),
                                          Text(AppStrings.checkYourEmail, style: context.textTheme.headlineMedium),
                                          const SizedBox(height: 12),
                                          Text(
                                            "${AppStrings.ifAccountExistBegin} \"${state.textFields[FieldNames.email]?.text}\"\n ${AppStrings.ifAccountExistEnd}",
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 44),
                                          FilledButton(
                                            onPressed: () => context.go(Routes.start.path),
                                            child: const Text(AppStrings.toStartPage),
                                          ),
                                          const SizedBox(height: 24),
                                          TextButton(
                                            onPressed: () => context.pop(),
                                            child: Text.rich(
                                              textAlign: TextAlign.center,
                                              TextSpan(
                                                text: AppStrings.didntGeEmail,
                                                style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onBackground),
                                                children: [
                                                  TextSpan(
                                                    text: " ${AppStrings.rewriteEmail}",
                                                    style: context.textTheme.bodyMedium?.copyWith(
                                                      color: context.colors.primary,
                                                      decoration: TextDecoration.underline,
                                                      decorationColor: context.colors.primary
                                                    ),
                                                  )
                                                ]
                                              )
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                )
                            )
                        );
                      } : null,
                      child: Text(
                          AppStrings.recoverPassword,
                          style: context.textTheme.bodyLarge?.copyWith(
                              color: context.colors.onPrimary
                          )
                      )
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
