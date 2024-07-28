import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/pages/registrations/cubit/registration_cubit.dart';
import 'package:lymphoma/presentation/widgets/app_bar/app_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../consts/strings.dart';
import '../../../di/dependencies.dart';
import '../../routing/routes.dart';
import '../../widgets/app_bar/back_arrow.dart';
import '../../widgets/field_list.dart';
import '../../widgets/screen.dart';
import 'cubit/registration_state.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  late PageController _pageViewController;
  var currentPage = 0;

  @override
  void initState() {
    _pageViewController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<RegistrationCubit>(),
      child: BlocListener<RegistrationCubit, RegistrationState>(
        listenWhen: (previousState, state) {
          return state.isSendRequestButtonEnabled;
        },
        listener: (context, state) {
          if (state.registerError != LogicStrings.init && state.registerError != LogicStrings.ok) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.registerError, textAlign: TextAlign.center))
            );
          } else if (state.registerError == LogicStrings.ok) {
            context.go(Routes.registrationStatus.path);
          }
        },
        child: Scaffold(
          appBar: AppAppBar(
              title: AppStrings.registration,
              leading: BackArrow(
                onPressed: currentPage == 0 ? null : _previousPage,
              ),
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageViewController,
                children: [
                  RegistrationFirstPage(
                    onContinueTapped: _nextPage,
                  ),
                  const RegistrationSecondPage()
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SmoothPageIndicator(
                  controller: _pageViewController,
                  count: 2,
                  effect: WormEffect(
                    dotColor: context.colors.primary.withOpacity(0.3),
                    activeDotColor: context.colors.primary,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  void _nextPage() {
    _pageViewController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    setState(() {
      currentPage++;
    });
  }

  void _previousPage() {
    _pageViewController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    setState(() {
      currentPage--;
    });
  }
}


class RegistrationFirstPage extends StatelessWidget {
  const RegistrationFirstPage({
    super.key,
    required this.onContinueTapped
  });

  final VoidCallback? onContinueTapped;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RegistrationCubit>(context);
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return ScrollableScreen(
          child: Column(
            children: [
              FieldList(
                fields: state.fields.take(3).toList(),
                onChanged: cubit.onFieldChanged,
              ),
              const SizedBox(height: 40),
              FilledButton(
                onPressed: state.isContinueButtonEnabled ? onContinueTapped : null,
                child: const Text(AppStrings.continueText),
              )
            ],
          ),
        );
      },
    );
  }
}

class RegistrationSecondPage extends StatelessWidget {
  const RegistrationSecondPage({
    super.key,
    this.onSendRequestButtonTapped
  });

  final VoidCallback? onSendRequestButtonTapped;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RegistrationCubit>(context);
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return ScrollableScreen(
          child: Column(
            children: [
              FieldList(
                fields: state.fields.skip(3).toList(),
                onChanged: cubit.onFieldChanged,
              ),
              const SizedBox(height: 40),
              FilledButton(
                onPressed: state.isSendRequestButtonEnabled ? () {
                  context.read<RegistrationCubit>().sendRequest();
                } : null,
                child: const Text(AppStrings.sendRequest),
              )
            ],
          )
        );
      },
    );
  }
}



