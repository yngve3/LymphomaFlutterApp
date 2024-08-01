import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/data/repositories/auth_repository.dart';
import 'package:lymphoma/ext/context_ext.dart';

import '../../../consts/dimens.dart';
import '../../../gen/assets.gen.dart';
import '../../routing/routes.dart';
import '../app_icon_button.dart';

class LogoutAction extends StatelessWidget {
  const LogoutAction({super.key});

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Assets.icons.icLogout.svg(),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Выйти из профиля?", style: context.textTheme.headlineMedium, textAlign: TextAlign.center),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("При выходе из профиля вы вернетесь на экран регистрации", textAlign: TextAlign.center,),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () => context.pop(),
                          style: FilledButton.styleFrom(
                            backgroundColor: context.colors.background,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppDimens.buttonsBorderRadius)
                            ),
                            textStyle: context.textTheme.bodyLarge,
                            foregroundColor: context.colors.onSurface,
                          ),
                          child: const Text("Остаться"),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            AuthRepository().logout();
                            context.go(Routes.start.path);
                          },
                          child: const Text("Выйти"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius)
            ),
            insetPadding: const EdgeInsets.all(24),
            backgroundColor: context.colors.surface,
            actionsOverflowAlignment: OverflowBarAlignment.center,
          ),
        );
      },
    );
  }
}
