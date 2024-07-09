import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor.freezed.dart';

@freezed
class Doctor with _$Doctor {
  const factory Doctor({
    @Default("") String id,
    @Default("") String fullName,
    @Default("") String phone,
    @Default("") String room,
    @Default("") String type,
    @Default("") imageURL
  }) = _Doctor;
}
