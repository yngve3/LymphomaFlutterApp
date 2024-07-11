import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../consts/strings.dart';
import '../../domain/models/patient/patient.dart';

@injectable
class PatientsRepository {
  static const patientTableName = "patients";

  void createPatient({
    required String id,
    required String date,
    required String familyPhone
  }) async {
    await Supabase.instance.client.from(patientTableName).insert({
      "id": id,
      "dob": date,
      "phone_2": familyPhone
    });
  }

  Future<bool> patientIsVerified(String patientID) async {
    final res = await Supabase.instance.client
        .from(patientTableName)
        .select('is_verified')
        .eq('id', patientID);
    return res[0]["is_verified"];
  }

  Future<List<Patient>> getAllPatients() async {
    final results = await Supabase.instance.client.from(patientTableName).select().eq('is_verified', true);
    return results.map((result) => Patient.fromJson(result)).toList();
  }

  Future<Patient> getPatient(String id) async {
    final result = await Supabase.instance.client.from(patientTableName).select().eq(TableFieldNames.id, id);
    if (result.isEmpty) return Patient.empty();
    return Patient.fromJson(result[0]);
  }

  void updateVerified(bool isVerified, String id) async {
    print(id);
    print(isVerified);
    await Supabase.instance.client.from(patientTableName).update({
      TableFieldNames.patientIsVerified: isVerified
    }).eq(TableFieldNames.id, id);
  }
}
