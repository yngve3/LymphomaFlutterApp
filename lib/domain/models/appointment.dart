import 'package:lymphoma/domain/models/patient/patient.dart';

import '../../consts/strings.dart';
import 'doctor/doctor.dart';

class Appointment {
  final int id;
  final Doctor doctor;
  final Patient patient;
  final DateTime dateTime;

  bool get isEmpty => id == -1;

  const Appointment({
    required this.id,
    required this.doctor,
    required this.patient,
    required this.dateTime
  });

  factory Appointment.empty() {
    return Appointment(
      id: -1,
      doctor: Doctor.empty(),
      patient: Patient.empty(),
      dateTime: DateTime.now()
    );
  }

  factory Appointment.fromJSON(Map<String, dynamic> json) {
    return Appointment(
      id: json[TableFieldNames.id],
      doctor: Doctor.fromJson(json[TableNames.doctors]),
      patient: Patient.fromJson(json[TableNames.patients]),
      dateTime: DateTime.parse(json[TableFieldNames.dateTime])
    );
  }
}