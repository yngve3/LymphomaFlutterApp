import 'package:file_picker/file_picker.dart';

import '../domain/models/field/field.dart';
import '../domain/models/patient/patient.dart';

typedef StringCallback = Function(String);
typedef DateTimeCallback = Function(DateTime?);
typedef PlatformFileCallback = Function(PlatformFile);
typedef FieldCallback = Function(Field, dynamic);
typedef PatientCallback = Function(Patient);