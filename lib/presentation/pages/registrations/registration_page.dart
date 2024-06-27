import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/pages/registrations/cubit/registration_cubit.dart';
import 'package:lymphoma/presentation/widgets/app_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../consts/strings.dart';
import '../../routing/routes.dart';
import '../../widgets/enter_date_field.dart';
import '../../widgets/input_field.dart';
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
      create: (context) => RegistrationCubit(),
      child: Scaffold(
        appBar: AppAppBar(
            appBar: AppBar(),
            title: AppStrings.registration,
            onBackArrowTapped: currentPage == 0 ? null : _previousPage
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
                RegistrationSecondPage(
                  onSendRequestButtonTapped: () {
                    // context.read<RegistrationCubit>().sendRequest();
                    context.go(Routes.registrationStatus.path);
                  }
                )
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
                    dotWidth: 8
                ),
              ),
            )
          ],
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
              InputField(
                label: AppStrings.email,
                hint: AppStrings.enterEmail,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                onChanged: cubit.onEmailChanged,
                text: state.email,
              ),
              const SizedBox(height: 16),
              InputField(
                label: AppStrings.password,
                hint: AppStrings.enterPassword,
                textInputAction: TextInputAction.next,
                isPassword: true,
                onChanged: cubit.onPasswordChanged,
                text: state.password,
              ),
              const SizedBox(height: 16),
              InputField(
                label: AppStrings.repeatPassword,
                hint: AppStrings.repeatPassword,
                isPassword: true,
                onChanged: cubit.onRepeatedPasswordChanged,
                text: state.repeatedPassword
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputField(
                label: AppStrings.fullName,
                hint: AppStrings.enterFullName,
                textInputAction: TextInputAction.next,
                text: state.fullName,
                onChanged: cubit.onFullNameChanged,
              ),
              const SizedBox(height: 16),
              EnterDateField(
                dateTime: state.birthdate,
                onDateChosen: context.read<RegistrationCubit>().onBirthdateChanged,
              ),
              const SizedBox(height: 16),
              InputField(
                label: AppStrings.phoneNumber,
                hint: AppStrings.enterPhoneNumber,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.phone,
                text: state.phoneNumber,
                onChanged: cubit.onPhoneNumberChanged,
              ),
              const SizedBox(height: 16),
              InputField(
                label: AppStrings.familyPhoneNumber,
                hint: AppStrings.enterFamilyPhoneNumber,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.phone,
                text: state.familyPhoneNumber,
                onChanged: cubit.onFamilyPhoneNumberChanged,
              ),
              const SizedBox(height: 40),
              FilledButton(
                onPressed: state.isSendRequestButtonEnabled ? onSendRequestButtonTapped : null,
                child: const Text(AppStrings.sendRequest),
              )
            ],
          ),
        );
      },
    );
  }
}



