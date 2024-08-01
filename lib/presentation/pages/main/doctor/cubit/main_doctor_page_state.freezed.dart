// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_doctor_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainDoctorPageState {
  List<Patient> get allPatients => throw _privateConstructorUsedError;
  List<Patient> get favoritePatients => throw _privateConstructorUsedError;
  List<Appointment> get appointments => throw _privateConstructorUsedError;
  LoadingState get appointmentsLoadingState =>
      throw _privateConstructorUsedError;
  LoadingState get patientsLoadingState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainDoctorPageStateCopyWith<MainDoctorPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainDoctorPageStateCopyWith<$Res> {
  factory $MainDoctorPageStateCopyWith(
          MainDoctorPageState value, $Res Function(MainDoctorPageState) then) =
      _$MainDoctorPageStateCopyWithImpl<$Res, MainDoctorPageState>;
  @useResult
  $Res call(
      {List<Patient> allPatients,
      List<Patient> favoritePatients,
      List<Appointment> appointments,
      LoadingState appointmentsLoadingState,
      LoadingState patientsLoadingState});
}

/// @nodoc
class _$MainDoctorPageStateCopyWithImpl<$Res, $Val extends MainDoctorPageState>
    implements $MainDoctorPageStateCopyWith<$Res> {
  _$MainDoctorPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allPatients = null,
    Object? favoritePatients = null,
    Object? appointments = null,
    Object? appointmentsLoadingState = null,
    Object? patientsLoadingState = null,
  }) {
    return _then(_value.copyWith(
      allPatients: null == allPatients
          ? _value.allPatients
          : allPatients // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
      favoritePatients: null == favoritePatients
          ? _value.favoritePatients
          : favoritePatients // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
      appointments: null == appointments
          ? _value.appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>,
      appointmentsLoadingState: null == appointmentsLoadingState
          ? _value.appointmentsLoadingState
          : appointmentsLoadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      patientsLoadingState: null == patientsLoadingState
          ? _value.patientsLoadingState
          : patientsLoadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainDoctorPageStateImplCopyWith<$Res>
    implements $MainDoctorPageStateCopyWith<$Res> {
  factory _$$MainDoctorPageStateImplCopyWith(_$MainDoctorPageStateImpl value,
          $Res Function(_$MainDoctorPageStateImpl) then) =
      __$$MainDoctorPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Patient> allPatients,
      List<Patient> favoritePatients,
      List<Appointment> appointments,
      LoadingState appointmentsLoadingState,
      LoadingState patientsLoadingState});
}

/// @nodoc
class __$$MainDoctorPageStateImplCopyWithImpl<$Res>
    extends _$MainDoctorPageStateCopyWithImpl<$Res, _$MainDoctorPageStateImpl>
    implements _$$MainDoctorPageStateImplCopyWith<$Res> {
  __$$MainDoctorPageStateImplCopyWithImpl(_$MainDoctorPageStateImpl _value,
      $Res Function(_$MainDoctorPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allPatients = null,
    Object? favoritePatients = null,
    Object? appointments = null,
    Object? appointmentsLoadingState = null,
    Object? patientsLoadingState = null,
  }) {
    return _then(_$MainDoctorPageStateImpl(
      allPatients: null == allPatients
          ? _value._allPatients
          : allPatients // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
      favoritePatients: null == favoritePatients
          ? _value._favoritePatients
          : favoritePatients // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
      appointments: null == appointments
          ? _value._appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>,
      appointmentsLoadingState: null == appointmentsLoadingState
          ? _value.appointmentsLoadingState
          : appointmentsLoadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      patientsLoadingState: null == patientsLoadingState
          ? _value.patientsLoadingState
          : patientsLoadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ));
  }
}

/// @nodoc

class _$MainDoctorPageStateImpl implements _MainDoctorPageState {
  const _$MainDoctorPageStateImpl(
      {final List<Patient> allPatients = const [],
      final List<Patient> favoritePatients = const [],
      final List<Appointment> appointments = const [],
      this.appointmentsLoadingState = LoadingState.ok,
      this.patientsLoadingState = LoadingState.ok})
      : _allPatients = allPatients,
        _favoritePatients = favoritePatients,
        _appointments = appointments;

  final List<Patient> _allPatients;
  @override
  @JsonKey()
  List<Patient> get allPatients {
    if (_allPatients is EqualUnmodifiableListView) return _allPatients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allPatients);
  }

  final List<Patient> _favoritePatients;
  @override
  @JsonKey()
  List<Patient> get favoritePatients {
    if (_favoritePatients is EqualUnmodifiableListView)
      return _favoritePatients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritePatients);
  }

  final List<Appointment> _appointments;
  @override
  @JsonKey()
  List<Appointment> get appointments {
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointments);
  }

  @override
  @JsonKey()
  final LoadingState appointmentsLoadingState;
  @override
  @JsonKey()
  final LoadingState patientsLoadingState;

  @override
  String toString() {
    return 'MainDoctorPageState(allPatients: $allPatients, favoritePatients: $favoritePatients, appointments: $appointments, appointmentsLoadingState: $appointmentsLoadingState, patientsLoadingState: $patientsLoadingState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainDoctorPageStateImpl &&
            const DeepCollectionEquality()
                .equals(other._allPatients, _allPatients) &&
            const DeepCollectionEquality()
                .equals(other._favoritePatients, _favoritePatients) &&
            const DeepCollectionEquality()
                .equals(other._appointments, _appointments) &&
            (identical(
                    other.appointmentsLoadingState, appointmentsLoadingState) ||
                other.appointmentsLoadingState == appointmentsLoadingState) &&
            (identical(other.patientsLoadingState, patientsLoadingState) ||
                other.patientsLoadingState == patientsLoadingState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allPatients),
      const DeepCollectionEquality().hash(_favoritePatients),
      const DeepCollectionEquality().hash(_appointments),
      appointmentsLoadingState,
      patientsLoadingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainDoctorPageStateImplCopyWith<_$MainDoctorPageStateImpl> get copyWith =>
      __$$MainDoctorPageStateImplCopyWithImpl<_$MainDoctorPageStateImpl>(
          this, _$identity);
}

abstract class _MainDoctorPageState implements MainDoctorPageState {
  const factory _MainDoctorPageState(
      {final List<Patient> allPatients,
      final List<Patient> favoritePatients,
      final List<Appointment> appointments,
      final LoadingState appointmentsLoadingState,
      final LoadingState patientsLoadingState}) = _$MainDoctorPageStateImpl;

  @override
  List<Patient> get allPatients;
  @override
  List<Patient> get favoritePatients;
  @override
  List<Appointment> get appointments;
  @override
  LoadingState get appointmentsLoadingState;
  @override
  LoadingState get patientsLoadingState;
  @override
  @JsonKey(ignore: true)
  _$$MainDoctorPageStateImplCopyWith<_$MainDoctorPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
