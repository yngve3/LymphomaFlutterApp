import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../consts/strings.dart';
import '../../domain/models/appointment.dart';
import '../../presentation/pages/new_appointment/cubit/new_appointment_state.dart';

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

  void createAppointment({
    required DateTime dateTime,
    required String patientID,
    required String doctorID,
    DoctorType? type,
    String? room,
    bool isDispensary = false
  }) async {
    await Supabase.instance.client.from(TableNames.appointments).insert({
      TableFieldNames.patientID: patientID,
      TableFieldNames.doctorID: doctorID,
      TableFieldNames.dateTime: dateTime.toUtc().toIso8601String(),
      TableFieldNames.isDispensary: isDispensary,
      TableFieldNames.dispensaryDoctorRoom: room,
      TableFieldNames.dispensaryDoctorType: DoctorType.getDoctorTypeName(type),
    });
  }

  String _getSelect() {
    return '''
      ${TableFieldNames.id},
      ${TableFieldNames.dateTime},
      ${TableNames.doctors} ( * ),
      ${TableNames.patients} ( *, ${TableNames.jtPatientsDoctors} ( ${TableNames.doctors} ( * ) ) )
    ''';
  }
}