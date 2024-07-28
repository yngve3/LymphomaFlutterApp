import 'package:intl/intl.dart';

import '../../../consts/strings.dart';

class Field {
  final String label;
  final String text;
  final bool isError;

  const Field({
    required this.label,
    this.text = "",
    this.isError = false
  });

  factory Field.empty() => const Field(label: AppStrings.empty);

  Field copyWith({
    String? label,
    dynamic text,
    bool? isError,
  }) {
    return Field(
      label: label ?? this.label,
      text: text ?? this.text,
      isError: isError ?? this.isError
    );
  }

  String get errorText => fields[label]?.errorText ?? "";
  String get hintText => fields[label]?.hintText ?? "";
  FieldType get type => fields[label]?.type ?? FieldType.unknown;
  String get tableName => fields[label]?.tableName ?? "";

  bool get isEmpty => text.isEmpty;
  bool get isNotEmpty => text.isNotEmpty;

  bool get isDateField => this is DateField;
}

class DateField extends Field {
  DateField({
    required this.date,
    required super.label,
    super.isError
  }) : super(text: date.toIso8601String());

  factory DateField.empty() => DateField(date: DateTime.now(), label: "");

  final DateTime date;

  @override
  DateField copyWith({
    String? label,
    dynamic text,
    bool? isError,
  }) {
    return DateField(
      label: label ?? this.label,
      date: text ?? this.text,
      isError: isError ?? this.isError,
    );
  }

  String get formattedDate => DateFormat("d.M.y", 'ru_RU').format(date);
  String get formattedTime => DateFormat("HH:mm", "ru_RU").format(date);
}

const fields = {
  FieldLabels.password: FieldInfo(
    errorText: FieldErrors.invalidFormat,
    hintText: FieldHints.enterPassword,
    type: FieldType.password
  ),
  FieldLabels.repeatPassword: FieldInfo(
    errorText: FieldErrors.passwordsNotEqual,
    hintText: FieldHints.repeatPassword,
    type: FieldType.password,
  ),
  FieldLabels.email: FieldInfo(
    errorText: FieldErrors.invalidFormat,
    hintText: FieldHints.enterEmail,
    type: FieldType.email,
  ),
  FieldLabels.fullName: FieldInfo(
    errorText: FieldErrors.invalidFormat,
    hintText: FieldHints.enterFullName,
    type: FieldType.fullName,
    tableName: TableFieldNames.fullName,
  ),
  FieldLabels.phoneNumber: FieldInfo(
    errorText: FieldErrors.invalidFormat,
    hintText: FieldHints.enterPhoneNumber,
    type: FieldType.phone,
    tableName: TableFieldNames.phone,
  ),
  FieldLabels.familyPhoneNumber: FieldInfo(
    errorText: FieldErrors.invalidFormat,
    hintText: FieldHints.enterFamilyPhoneNumber,
    type: FieldType.phone,
    tableName: TableFieldNames.familyPhone,
  ),
  FieldLabels.phoneDoctor: FieldInfo(
    errorText: FieldErrors.invalidFormat,
    hintText: FieldHints.enterPhoneDoctor,
    type: FieldType.phone,
  ),
  FieldLabels.typeDoctor: FieldInfo(
    errorText: FieldErrors.mustNotBeEmpty,
    hintText: FieldHints.enterTypeDoctor,
    type: FieldType.text,
    tableName: TableFieldNames.doctorType,
  ),
  FieldLabels.room: FieldInfo(
    errorText: FieldErrors.mustNotBeEmpty,
    hintText: FieldHints.enterRoom,
    type: FieldType.text,
    tableName: TableFieldNames.doctorRoom,
  ),
  FieldLabels.therapist: FieldInfo(
    errorText: FieldErrors.mustNotBeEmpty,
    hintText: FieldHints.enterTherapist,
    type: FieldType.text,
  ),
  FieldLabels.diagnosis: FieldInfo(
    errorText: FieldErrors.mustNotBeEmpty,
    hintText: FieldHints.enterDiagnosis,
    type: FieldType.text,
    tableName: TableFieldNames.diagnosis,
  ),
  FieldLabels.hystDiagnosis: FieldInfo(
    errorText: FieldErrors.mustNotBeEmpty,
    hintText: FieldHints.enterHystDiagnosis,
    type: FieldType.text,
    tableName: TableFieldNames.hystDiagnosis,
  ),
  FieldLabels.treatment: FieldInfo(
    errorText: FieldErrors.mustNotBeEmpty,
    hintText: FieldHints.enterTreatment,
    type: FieldType.text,
    tableName: TableFieldNames.treatment,
  ),
  FieldLabels.birthdate: FieldInfo(
    errorText: FieldErrors.mustNotBeEmpty,
    hintText: FieldHints.enterDate,
    type: FieldType.date,
    tableName: TableFieldNames.birthdate,
  ),
  FieldLabels.appointmentDate: FieldInfo(
    errorText: FieldErrors.mustNotBeEmpty,
    hintText: FieldHints.enterDate,
    type: FieldType.date,
  ),
  FieldLabels.appointmentTime: FieldInfo(
    errorText: FieldErrors.mustNotBeEmpty,
    hintText: FieldHints.enterTime,
    type: FieldType.time,
  ),
};

class FieldInfo {
  final String errorText;
  final String hintText;
  final FieldType type;
  final String tableName;

  const FieldInfo({
    required this.errorText,
    required this.hintText,
    required this.type,
    this.tableName = ""
  });
}

enum FieldType {
  phone,
  text,
  password,
  email,
  fullName,
  repeatedPassword,
  date,
  time,
  unknown
}
