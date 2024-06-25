import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/ext/context_ext.dart';

import '../../../consts/strings.dart';
import '../../../gen/assets.gen.dart';
import '../../routing/routes.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: context.colors.primary,
        systemNavigationBarColor: context.colors.primary,
      ),
      child: Scaffold(
        backgroundColor: context.colors.primary,
        body: SafeArea(
          child: Column(
            children: [
              const ImageWithBlur(),
              const SizedBox(height: 21),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        AppStrings.appName,
                        style: context.textTheme.headlineLarge
                            ?.copyWith(color: context.colors.onPrimary),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppStrings.startPageAboutApp,
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: context.colors.onPrimary),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(AppStrings.register)
                    ),
                    TextButton(
                        onPressed: () => context.go(Routes.login.path),
                        child: Text.rich(
                            TextSpan(
                                text: "${AppStrings.alreadyHaveAccount} ",
                                style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onPrimary),
                                children: [
                                  TextSpan(
                                    text: AppStrings.login,
                                    style: context.textTheme.bodyMedium?.copyWith(
                                        color: context.colors.onPrimary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: context.colors.onPrimary
                                    ),
                                  )
                                ]
                            )
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageWithBlur extends StatelessWidget {
  const ImageWithBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Assets.images.imgSvg.svg(),
          Container(
            decoration: BoxDecoration(
                color: context.colors.primary,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [context.colors.primary.withOpacity(0), context.colors.primary],
                    stops: const [0, 1]
                )
            ),
          )
        ],
      ),
    );
  }
}

