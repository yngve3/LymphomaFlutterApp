import 'package:injectable/injectable.dart';
import 'package:lymphoma/data/repositories/appointments_repository.dart';
import 'package:lymphoma/data/repositories/doctors_repository.dart';
import 'package:lymphoma/data/repositories/patients_repository.dart';
import 'package:lymphoma/data/repositories/user_repository.dart';
import 'package:lymphoma/domain/models/verification_status.dart';

import '../models/appointment.dart';
import '../models/doctor/doctor.dart';
import '../models/field/field.dart';
import '../models/patient/patient.dart';

@injectable
class PatientsInteractor {
  const PatientsInteractor(
      this._patientsRepository,
      this._userRepository,
      this._appointmentsRepository,
      this._doctorsRepository
  );

  final PatientsRepository _patientsRepository;
  final DoctorsRepository _doctorsRepository;
  final UserRepository _userRepository;
  final AppointmentsRepository _appointmentsRepository;

  Future<VerificationStatus> get verificationStatus => _patientsRepository.verificationStatus(_userRepository.id ?? "");

  Future<List<Patient>> get allPatients => _patientsRepository.getAllPatients();

  Future<Patient> getPatient({String? id}) => _patientsRepository.getPatient(id ?? _userRepository.id ?? "");

  void updateVerified(VerificationStatus status, String id) => _patientsRepository.updateVerified(status, id);

  Future<Appointment> getComingAppointment({String? patientID}) async {
    return await _appointmentsRepository.getComingAppointmentByPatient(patientID ?? _userRepository.id ?? "");
  }

  void update(List<Field> fields, String id) {
    _patientsRepository.upsert(
      id: id,
      fields: fields
    );

    _doctorsRepository.addPatient(id, _userRepository.id ?? "");
  }

  Future<Doctor> get currentDoctor => _doctorsRepository.getDoctor(_userRepository.id ?? "");
  Future<Patient> get currentPatient => _patientsRepository.getPatient(_userRepository.id ?? "");
}