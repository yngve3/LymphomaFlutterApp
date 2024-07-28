import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lymphoma/consts/callbacks.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/pages/profile/doctor/cubit/doctor_profile_page_cubit.dart';
import 'package:lymphoma/presentation/widgets/app_bar/app_app_bar.dart';
import 'package:lymphoma/presentation/widgets/app_bar/back_arrow.dart';
import 'package:lymphoma/presentation/widgets/app_bar/logout_action.dart';
import 'package:lymphoma/presentation/widgets/empty_list_message.dart';
import 'package:lymphoma/presentation/widgets/field_list.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../consts/dimens.dart';
import '../../../../consts/strings.dart';
import '../../../../domain/models/loading_state.dart';
import '../../../../gen/assets.gen.dart';
import '../../../widgets/screen.dart';
import 'cubit/doctor_profile_page_state.dart';

class DoctorProfilePage extends StatelessWidget {
  const DoctorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: AppStrings.profile,
        leading: const BackArrow(),
        actions: const [
          LogoutAction()
        ],
      ),
      body: const DoctorProfilePageContent(),
    );
  }
}

class DoctorProfilePageContent extends StatelessWidget {
  const DoctorProfilePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorProfilePageCubit, DoctorProfilePageState>(
      builder: (context, state) {
        return switch(state.loadingState) {
          LoadingState.loading => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ScrollableScreen(
              topPadding: 28,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ImageProfile(imageURL: ""),
                  const SizedBox(height: 28),
                  FieldList(
                    fields: state.textFields,
                    onlyRead: true,
                  )
                ],
              ),
            )
          ),
          LoadingState.ok => ScrollableScreen(
            topPadding: 28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                state.photoUpdateState == LoadingState.ok ? ImageProfile(
                  imageURL: state.imageURL,
                  onImageChanged: (image) => context.read<DoctorProfilePageCubit>().onImageChanged(image),
                ) : Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: const ImageProfile(
                    imageURL: "",
                  ),
                ),
                const SizedBox(height: 28),
                FieldList(
                  fields: state.textFields,
                  onlyRead: true,
                )
              ],
            ),
          ),
          LoadingState.error => const EmptyListMessage(
            title: "Внимание, ошибка",
            subtitle: "Проверте подключение к интернету",
          )
        };
      },
    );
  }
}

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    super.key,
    required this.imageURL,
    this.onImageChanged
  });

  final String? imageURL;
  final PlatformFileCallback? onImageChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        imageURL == null || imageURL == "" ? Card(
          color: context.colors.tertiary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
            side: BorderSide(color: context.colors.primary)
          ),
          child: Padding(
            padding: const EdgeInsets.all(52),
            child: Assets.icons.icImage.svg(colorFilter: ColorFilter.mode(context.colors.primary, BlendMode.srcIn)),
          ),
        ) : Card(
          child: SizedBox.square(
            dimension: 126,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
              child: Image.network(imageURL!, fit: BoxFit.cover)
            ),
          )
        ),
        TextButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
            if (result != null) {
              PlatformFile image = result.files.first;
              onImageChanged?.call(image);
            }
          },
          child: Text(
            imageURL == null ? AppStrings.uploadImage : AppStrings.changeImage,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.primary,
              decoration: TextDecoration.underline,
              decorationColor: context.colors.primary,
            ),
          )
        ),
      ],
    );
  }
}

