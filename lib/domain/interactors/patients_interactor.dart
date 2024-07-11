import 'package:injectable/injectable.dart';
import 'package:lymphoma/data/repositories/patients_repository.dart';
import 'package:lymphoma/data/repositories/user_repository.dart';

import '../models/patient/patient.dart';

@injectable
class PatientsInteractor {
  const PatientsInteractor(this._patientsRepository, this._userRepository);

  final PatientsRepository _patientsRepository;
  final UserRepository _userRepository;

  Future<bool> get currentPatientIsVerified => _patientsRepository.patientIsVerified(_userRepository.id ?? "");

  Future<List<Patient>> get allPatients => _patientsRepository.getAllPatients();

  Future<Patient> getPatient(String id) => _patientsRepository.getPatient(id);

  void updateVerified(bool isVerified, String id) => _patientsRepository.updateVerified(isVerified, id);
}