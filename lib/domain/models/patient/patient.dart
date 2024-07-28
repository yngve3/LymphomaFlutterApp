import 'package:lymphoma/consts/strings.dart';
import 'package:lymphoma/ext/date_time_ext.dart';

import '../doctor/doctor.dart';

class Patient {
  const Patient({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.familyPhone,
    required this.birthdate,
    this.diagnosis,
    required this.createdAt,
    this.treatment,
    this.hystDiagnosis,
    required this.doctor
  });

  int get age => birthdate.toAge();

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json[TableFieldNames.id],
      fullName: json[TableFieldNames.fullName],
      phone: json[TableFieldNames.phone],
      familyPhone: json[TableFieldNames.familyPhone],
      birthdate: DateTime.parse(json[TableFieldNames.birthdate]),
      diagnosis: json[TableFieldNames.diagnosis],
      treatment: json[TableFieldNames.treatment],
      hystDiagnosis: json[TableFieldNames.hystDiagnosis],
      doctor: Doctor.fromJson(json[TableNames.jtPatientsDoctors]?[TableNames.doctors] ?? {}),
      createdAt: DateTime.parse(json[TableFieldNames.createdAt]).toLocal()
    );
  }

  factory Patient.empty() {
    return Patient(
      id: AppStrings.empty,
      fullName: AppStrings.empty,
      phone: AppStrings.empty,
      familyPhone: AppStrings.empty,
      birthdate: DateTime.now(),
      diagnosis: AppStrings.empty,
      createdAt: DateTime.now(),
      doctor: Doctor.empty()
    );
  }


  @override
  bool operator ==(Object other) {
    if (other is! Patient) return false;
    return id == other.id;
  }

  final String id;
  final String fullName;
  final String phone;
  final String familyPhone;
  final DateTime birthdate;
  final String? diagnosis;
  final String? hystDiagnosis;
  final String? treatment;
  final DateTime createdAt;
  final Doctor doctor;
}
