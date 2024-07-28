import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../consts/strings.dart';
import '../../domain/models/field/field.dart';
import '../../domain/models/patient/patient.dart';
import '../../domain/models/verification_status.dart';

@injectable
class PatientsRepository {
  Future<VerificationStatus> verificationStatus(String patientID) async {
    final res = await Supabase.instance.client
        .from(TableNames.patients)
        .select(TableFieldNames.verificationStatus)
        .eq(TableFieldNames.id, patientID);
    return VerificationStatus.fromJson(res[0]);
  }

  Future<List<Patient>> getAllPatients() async {
    final results = await Supabase.instance.client.from(TableNames.patients)
        .select(_getSelect())
        .eq(TableFieldNames.verificationStatus, VerificationStatus.accepted.tableName);
    return results.map((result) => Patient.fromJson(result)).toList();
  }

  Future<List<Patient>> getWaitingPatients() async {
    final results = await Supabase.instance.client.from(TableNames.patients)
        .select(_getSelect()).eq(TableFieldNames.verificationStatus, VerificationStatus.waiting.tableName);
    return results.map((result) => Patient.fromJson(result)).toList();
  }

  Future<Patient> getPatient(String id) async {
    final result = await Supabase.instance.client
        .from(TableNames.patients).select(_getSelect()).eq(TableFieldNames.id, id);
    if (result.isEmpty) return Patient.empty();
    return Patient.fromJson(result[0]);
  }

  String _getSelect() {
    return ''' *, jt_patients_doctors ( doctors ( * ) ) ''';
  }

  void updateVerified(VerificationStatus status, String id) async {
    await Supabase.instance.client.from(TableNames.patients).update({
      TableFieldNames.verificationStatus: status.tableName
    }).eq(TableFieldNames.id, id);
  }

  void upsert({
    required String id,
    required List<Field> fields
  }) async {
    final data = {};
    data.addAll({TableFieldNames.id: id});
    data.addEntries(
        fields.where((field) => field.tableName != "")
            .map((field) => MapEntry(field.tableName, field.text))
    );

    await Supabase.instance.client.from(TableNames.patients).upsert(data);
  }
}
