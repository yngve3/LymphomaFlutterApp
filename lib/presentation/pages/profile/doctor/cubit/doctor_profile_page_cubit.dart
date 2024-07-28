import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/doctors_interactor.dart';
import 'package:lymphoma/domain/models/field/field.dart';

import '../../../../../consts/strings.dart';
import '../../../../../domain/models/loading_state.dart';
import 'doctor_profile_page_state.dart';

@injectable
class DoctorProfilePageCubit extends Cubit<DoctorProfilePageState> {
  DoctorProfilePageCubit(this._interactor) : super(const DoctorProfilePageState(
    textFields: [
      Field(
        label: FieldLabels.fullName,
      ),
      Field(
        label: FieldLabels.typeDoctor,
      ),
      Field(
        label: FieldLabels.room,
      ),
      Field(
        label: FieldLabels.phoneDoctor,
      ),
    ]
  ));

  final DoctorsInteractor _interactor;

  @postConstruct
  void loadDoctorInfo() async {
    emit(state.copyWith(loadingState: LoadingState.loading));
    final doctor = await _interactor.getDoctorInfo();
    emit(DoctorProfilePageState(
      textFields: [
        Field(
          label: FieldLabels.fullName,
          text: doctor.fullName,
        ),
        Field(
          label: FieldLabels.typeDoctor,
          text: doctor.type,
        ),
        Field(
          label: FieldLabels.room,
          text: doctor.room,
        ),
        Field(
          label: FieldLabels.phoneDoctor,
          text: doctor.phone,
        ),
      ],
      imageURL: doctor.imageURL,
      loadingState: LoadingState.ok
    ));
  }

  void onImageChanged(PlatformFile image) async {
    emit(state.copyWith(photoUpdateState: LoadingState.loading));
    final imageURL = await _interactor.onImageChanged(image);
    emit(state.copyWith(photoUpdateState: LoadingState.ok, imageURL: imageURL));
  }
}
