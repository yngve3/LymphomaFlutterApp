// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_patient_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainPatientPageState {
  Appointment get comingAppointment => throw _privateConstructorUsedError;
  Patient? get patient => throw _privateConstructorUsedError;
  LoadingState get comingAppointmentLoadingState =>
      throw _privateConstructorUsedError;
  LoadingState get patientLoadingState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainPatientPageStateCopyWith<MainPatientPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainPatientPageStateCopyWith<$Res> {
  factory $MainPatientPageStateCopyWith(MainPatientPageState value,
          $Res Function(MainPatientPageState) then) =
      _$MainPatientPageStateCopyWithImpl<$Res, MainPatientPageState>;
  @useResult
  $Res call(
      {Appointment comingAppointment,
      Patient? patient,
      LoadingState comingAppointmentLoadingState,
      LoadingState patientLoadingState});
}

/// @nodoc
class _$MainPatientPageStateCopyWithImpl<$Res,
        $Val extends MainPatientPageState>
    implements $MainPatientPageStateCopyWith<$Res> {
  _$MainPatientPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comingAppointment = null,
    Object? patient = freezed,
    Object? comingAppointmentLoadingState = null,
    Object? patientLoadingState = null,
  }) {
    return _then(_value.copyWith(
      comingAppointment: null == comingAppointment
          ? _value.comingAppointment
          : comingAppointment // ignore: cast_nullable_to_non_nullable
              as Appointment,
      patient: freezed == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Patient?,
      comingAppointmentLoadingState: null == comingAppointmentLoadingState
          ? _value.comingAppointmentLoadingState
          : comingAppointmentLoadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      patientLoadingState: null == patientLoadingState
          ? _value.patientLoadingState
          : patientLoadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainPatientPageStateImplCopyWith<$Res>
    implements $MainPatientPageStateCopyWith<$Res> {
  factory _$$MainPatientPageStateImplCopyWith(_$MainPatientPageStateImpl value,
          $Res Function(_$MainPatientPageStateImpl) then) =
      __$$MainPatientPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Appointment comingAppointment,
      Patient? patient,
      LoadingState comingAppointmentLoadingState,
      LoadingState patientLoadingState});
}

/// @nodoc
class __$$MainPatientPageStateImplCopyWithImpl<$Res>
    extends _$MainPatientPageStateCopyWithImpl<$Res, _$MainPatientPageStateImpl>
    implements _$$MainPatientPageStateImplCopyWith<$Res> {
  __$$MainPatientPageStateImplCopyWithImpl(_$MainPatientPageStateImpl _value,
      $Res Function(_$MainPatientPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comingAppointment = null,
    Object? patient = freezed,
    Object? comingAppointmentLoadingState = null,
    Object? patientLoadingState = null,
  }) {
    return _then(_$MainPatientPageStateImpl(
      comingAppointment: null == comingAppointment
          ? _value.comingAppointment
          : comingAppointment // ignore: cast_nullable_to_non_nullable
              as Appointment,
      patient: freezed == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Patient?,
      comingAppointmentLoadingState: null == comingAppointmentLoadingState
          ? _value.comingAppointmentLoadingState
          : comingAppointmentLoadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      patientLoadingState: null == patientLoadingState
          ? _value.patientLoadingState
          : patientLoadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ));
  }
}

/// @nodoc

class _$MainPatientPageStateImpl implements _MainPatientPageState {
  const _$MainPatientPageStateImpl(
      {required this.comingAppointment,
      this.patient,
      this.comingAppointmentLoadingState = LoadingState.ok,
      this.patientLoadingState = LoadingState.ok});

  @override
  final Appointment comingAppointment;
  @override
  final Patient? patient;
  @override
  @JsonKey()
  final LoadingState comingAppointmentLoadingState;
  @override
  @JsonKey()
  final LoadingState patientLoadingState;

  @override
  String toString() {
    return 'MainPatientPageState(comingAppointment: $comingAppointment, patient: $patient, comingAppointmentLoadingState: $comingAppointmentLoadingState, patientLoadingState: $patientLoadingState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainPatientPageStateImpl &&
            (identical(other.comingAppointment, comingAppointment) ||
                other.comingAppointment == comingAppointment) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.comingAppointmentLoadingState,
                    comingAppointmentLoadingState) ||
                other.comingAppointmentLoadingState ==
                    comingAppointmentLoadingState) &&
            (identical(other.patientLoadingState, patientLoadingState) ||
                other.patientLoadingState == patientLoadingState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comingAppointment, patient,
      comingAppointmentLoadingState, patientLoadingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainPatientPageStateImplCopyWith<_$MainPatientPageStateImpl>
      get copyWith =>
          __$$MainPatientPageStateImplCopyWithImpl<_$MainPatientPageStateImpl>(
              this, _$identity);
}

abstract class _MainPatientPageState implements MainPatientPageState {
  const factory _MainPatientPageState(
      {required final Appointment comingAppointment,
      final Patient? patient,
      final LoadingState comingAppointmentLoadingState,
      final LoadingState patientLoadingState}) = _$MainPatientPageStateImpl;

  @override
  Appointment get comingAppointment;
  @override
  Patient? get patient;
  @override
  LoadingState get comingAppointmentLoadingState;
  @override
  LoadingState get patientLoadingState;
  @override
  @JsonKey(ignore: true)
  _$$MainPatientPageStateImplCopyWith<_$MainPatientPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
