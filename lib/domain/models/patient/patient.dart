import 'package:lymphoma/ext/date_time_ext.dart';

class Patient {
  const Patient({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.familyPhone,
    required this.birthdate,
    required this.diagnosis
  });

  int get age => birthdate.toAge();

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json["id"],
      fullName: json["full_name"],
      phone: json["phone"],
      familyPhone: json['phone_2'],
      birthdate: DateTime.parse(json['dob']),
      diagnosis: json['diagnosis']
    );
  }

  factory Patient.empty() {
    return Patient(id: "", fullName: "", phone: "", familyPhone: "", birthdate: DateTime.now(), diagnosis: "");
  }

  final String id;
  final String fullName;
  final String phone;
  final String familyPhone;
  final DateTime birthdate;
  final String diagnosis;
}
