import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../consts/strings.dart';
import '../../domain/models/appointment.dart';

@injectable
class AppointmentsRepository {
  Future<List<Appointment>> getAppointmentsByDoctor(String doctorID) async {
    final results = await Supabase.instance.client.from(TableNames.appointments)
        .select(_getSelect())
        .eq(TableFieldNames.doctorID, doctorID);
    return results.map((result) => Appointment.fromJSON(result)).toList();
  }

  Future<List<Appointment>> getAppointmentsByPatient(String patientID) async {
    final results = await Supabase.instance.client.from(TableNames.appointments)
        .select(_getSelect())
        .eq(TableFieldNames.patientID, patientID);
    return results.map((result) => Appointment.fromJSON(result)).toList();
  }

  Future<Appointment> getComingAppointmentByPatient(String patientID) async {
    final result = await Supabase.instance.client.from(TableNames.appointments)
        .select(_getSelect())
        .eq(TableFieldNames.patientID, patientID)
        .gte(TableFieldNames.dateTime, DateTime.timestamp().toIso8601String());

    if (result.isEmpty) return Appointment.empty();
    return Appointment.fromJSON(result[result.length - 1]);
  }

  void createAppointment(DateTime dateTime, String patientID, String doctorID) async {
    await Supabase.instance.client.from(TableNames.appointments).insert({
      TableFieldNames.patientID: patientID,
      TableFieldNames.doctorID: doctorID,
      TableFieldNames.dateTime: dateTime.toUtc().toIso8601String()
    });
  }

  String _getSelect() {
    return '''
      ${TableFieldNames.id},
      ${TableFieldNames.dateTime},
      ${TableNames.doctors} ( * ),
      ${TableNames.patients} ( * )
    ''';
  }
}