import 'package:injectable/injectable.dart';
import 'package:lymphoma/data/repositories/appointments_repository.dart';
import 'package:lymphoma/data/repositories/user_repository.dart';
import 'package:lymphoma/ext/list_ext.dart';

import '../../consts/strings.dart';
import '../models/appointment.dart';
import '../models/field/field.dart';

@injectable
class AppointmentsInteractor {
  const AppointmentsInteractor(this._appointmentsRepository, this._userRepository);

  final AppointmentsRepository _appointmentsRepository;
  final UserRepository _userRepository;

  void createAppointment(List<Field> fields, String patientID) {
    final date = (fields.findByLabel(FieldLabels.appointmentDate) as DateField).date;
    final time = (fields.findByLabel(FieldLabels.appointmentTime) as DateField).date;
    final dateTime = date.copyWith(hour: time.hour, minute: time.minute);
    _appointmentsRepository.createAppointment(dateTime, patientID, _userRepository.id ?? "");
  }

  Future<List<Appointment>> getAllAppointments(String patientID) => _appointmentsRepository.getAppointmentsByPatient(patientID);
}