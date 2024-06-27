import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/widgets/icon_with_card.dart';
import 'package:lymphoma/presentation/widgets/screen.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({
    super.key,
    required this.title,
    required this.subtitle,
    this.isOk = true,
    this.extra,
    this.buttonText,
    this.onButtonTapped
  });

  final bool isOk;
  final String title;
  final String subtitle;
  final Widget? extra;
  final String? buttonText;
  final VoidCallback? onButtonTapped;

  @override
  Widget build(BuildContext context) {
    return Screen(
      systemColor: context.colors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 121),
                IconWithCardVariant(isOk: isOk),
                const SizedBox(height: 24),
                Text(title, style: context.textTheme.headlineMedium?.copyWith(color: context.colors.onPrimary)),
                const SizedBox(height: 12),
                Text(subtitle, style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onPrimary)),
                const SizedBox(height: 60),
                extra ?? const SizedBox.shrink()
              ],
            ),
          ),
          buttonText != null ? ElevatedButton(
            onPressed: onButtonTapped,
            child: Text(buttonText ?? ""),
          ) : const SizedBox.shrink(),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
