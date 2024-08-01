import 'package:injectable/injectable.dart';
import 'package:lymphoma/data/repositories/appointments_repository.dart';
import 'package:lymphoma/data/repositories/user_repository.dart';
import 'package:lymphoma/ext/list_ext.dart';

import '../../consts/strings.dart';
import '../../presentation/pages/new_appointment/cubit/new_appointment_state.dart';
import '../models/appointment.dart';
import '../models/field/field.dart';

@injectable
class AppointmentsInteractor {
  const AppointmentsInteractor(this._appointmentsRepository, this._userRepository);

  final AppointmentsRepository _appointmentsRepository;
  final UserRepository _userRepository;

  void createAppointment(List<Field> fields, String patientID) {
    final dateTime = _getDateTimeFromFields(fields);
    _appointmentsRepository.createAppointment(dateTime: dateTime, patientID: patientID, doctorID: _userRepository.id ?? "");
  }

  Future<Appointment> getComingAppointment({String? patientID}) async {
    return await _appointmentsRepository.getComingAppointmentByPatient(patientID ?? _userRepository.id ?? "");
  }

  void createDispAppointment(List<DispAppointmentState> dispAppointments, String patientID) {
    for (final dispAppointment in dispAppointments) {
      final dateTime = _getDateTimeFromFields(dispAppointment.dispAppointmentsFields);
      _appointmentsRepository.createAppointment(
        dateTime: dateTime,
        patientID: patientID,
        doctorID: _userRepository.id ?? "",
        type: dispAppointment.type,
        room: dispAppointment.dispAppointmentsFields.findByLabel(FieldLabels.room).text,
        isDispensary: true
      );
    }
  }

  DateTime _getDateTimeFromFields(List<Field> fields) {
    final date = (fields.findByLabel(FieldLabels.appointmentDate) as DateField).date;
    final time = (fields.findByLabel(FieldLabels.appointmentTime) as DateField).date;
    return date.copyWith(hour: time.hour, minute: time.minute);
  }

  Future<List<Appointment>> getAllAppointments(String patientID) => _appointmentsRepository.getAppointmentsByPatient(patientID);
}