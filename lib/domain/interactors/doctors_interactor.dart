import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/data/repositories/doctors_repository.dart';
import 'package:lymphoma/data/repositories/patients_repository.dart';
import 'package:lymphoma/data/repositories/user_repository.dart';

import '../models/doctor/doctor.dart';
import '../models/patient/patient.dart';

@injectable
class DoctorsInteractor {
  final UserRepository _userRepository;
  final DoctorsRepository _doctorsRepository;
  final PatientsRepository _patientsRepository;

  const DoctorsInteractor(this._doctorsRepository, this._userRepository, this._patientsRepository);

  Future<String?> onImageChanged(PlatformFile image) async {
    if (image.path == null || _userRepository.id == null) return null;
    return _doctorsRepository.uploadImage(File(image.path!), _userRepository.id!);
  }

  Future<Doctor> getDoctorInfo() async {
    if (_userRepository.id == null) return Doctor.empty();
    return _doctorsRepository.getDoctor(_userRepository.id!);
  }

  Future<List<Patient>> get waitingPatients => _patientsRepository.getWaitingPatients();
}