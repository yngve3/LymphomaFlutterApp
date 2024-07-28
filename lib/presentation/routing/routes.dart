abstract class Routes {
  static SimpleRoute start = const SimpleRoute("/start");
  static SimpleRoute login = const SimpleRoute("/start/login");
  static SimpleRoute recovery = const SimpleRoute("/start/login/recovery");
  static SimpleRoute registration = const SimpleRoute("/start/registration");
  static SimpleRoute registrationStatus = const SimpleRoute("/registrationStatus");

  static SimpleRoute doctorMain = const SimpleRoute("/doctor");
  static SimpleRoute patientInfo = const SimpleRoute("/doctor/patient");
  static SimpleRoute patientHistory = const SimpleRoute("/doctor/patient/history");
  static SimpleRoute patientProfileByDoctor = const SimpleRoute("/doctor/patient/profile");
  static SimpleRoute newAppointment = const SimpleRoute("/doctor/patient/new_appointment");
  static SimpleRoute newAppointmentStatus = const SimpleRoute("/doctor/patient/new_appointment/status");
  static SimpleRoute doctorProfile = const SimpleRoute("/doctor/profile");
  static SimpleRoute doctorNotifications = const SimpleRoute("/doctor/notifications");
  static SimpleRoute doctorNotificationsRequests = const SimpleRoute("/doctor/notifications/requests");
  static SimpleRoute doctorNotificationsRequest = const SimpleRoute("/doctor/notifications/requests/request");
  static SimpleRoute doctorNotificationsRequestStatus = const SimpleRoute("/doctor/notifications/requests/request/status");
  static SimpleRoute patientMain = const SimpleRoute("/patient");
  static SimpleRoute patientProfile = const SimpleRoute("/patient/profile");
}

abstract class Route {
  const Route(this._path);
  final String _path;

  String get lastPathComponent => _path.split("/").last;
}

class SimpleRoute extends Route {
  const SimpleRoute(super._path);

  String get path => _path;
}

class RouteWithParameters extends Route{
  RouteWithParameters(super._path);

  String path(Map<String, dynamic> params) {
    String path = _path;
    for (final paramKey in params.keys) {
      path = path.replaceAll(":$paramKey", params[paramKey].toString());
    }

    return path;
  }
}