import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/doctors_interactor.dart';

import '../../../../../domain/models/loading_state.dart';
import 'doctor_profile_page_state.dart';

@injectable
class DoctorProfilePageCubit extends Cubit<DoctorProfilePageState> {
  DoctorProfilePageCubit(this._interactor) : super(const DoctorProfilePageState());

  final DoctorsInteractor _interactor;

  @postConstruct
  void loadDoctorInfo() async {
    emit(state.copyWith(loadingState: LoadingState.loading));
    final doctor = await _interactor.getDoctorInfo();
    emit(DoctorProfilePageState(
      fullName: doctor.fullName,
      type: doctor.type,
      room: doctor.room,
      phone: doctor.phone,
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
