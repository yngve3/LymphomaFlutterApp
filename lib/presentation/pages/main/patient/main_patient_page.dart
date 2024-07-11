import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/presentation/widgets/app_bar/app_app_bar.dart';

import '../../../../data/repositories/auth_repository.dart';
import '../../../../di/dependencies.dart';
import '../../../routing/routes.dart';
import 'cubit/main_patient_page_cubit.dart';
import 'cubit/main_patient_page_state.dart';

class MainPatientPage extends StatelessWidget {
  const MainPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<MainPatientPageCubit>(),
      child: BlocBuilder<MainPatientPageCubit, MainPatientPageState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppAppBar(
                title: "Пациент",
              ),
              body: Column(
                children: [
                  FilledButton(
                    onPressed: () {
                      AuthRepository().logout();
                      context.go(Routes.start.path);
                    },
                    child: const Text("Выйти"),
                  ),
                ],
              )
          );
        },
      ),
    );
  }
}
