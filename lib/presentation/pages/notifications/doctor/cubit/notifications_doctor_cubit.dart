import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'notifications_doctor_state.dart';

@injectable
class NotificationsDoctorCubit extends Cubit<NotificationsDoctorState> {
  NotificationsDoctorCubit() : super(const NotificationsDoctorState());


}
