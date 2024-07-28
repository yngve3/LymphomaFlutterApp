// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_doctor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationsDoctorState {
  List<Patient> get patients => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationsDoctorStateCopyWith<NotificationsDoctorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsDoctorStateCopyWith<$Res> {
  factory $NotificationsDoctorStateCopyWith(NotificationsDoctorState value,
          $Res Function(NotificationsDoctorState) then) =
      _$NotificationsDoctorStateCopyWithImpl<$Res, NotificationsDoctorState>;
  @useResult
  $Res call({List<Patient> patients, LoadingState loadingState});
}

/// @nodoc
class _$NotificationsDoctorStateCopyWithImpl<$Res,
        $Val extends NotificationsDoctorState>
    implements $NotificationsDoctorStateCopyWith<$Res> {
  _$NotificationsDoctorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patients = null,
    Object? loadingState = null,
  }) {
    return _then(_value.copyWith(
      patients: null == patients
          ? _value.patients
          : patients // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationsDoctorStateImplCopyWith<$Res>
    implements $NotificationsDoctorStateCopyWith<$Res> {
  factory _$$NotificationsDoctorStateImplCopyWith(
          _$NotificationsDoctorStateImpl value,
          $Res Function(_$NotificationsDoctorStateImpl) then) =
      __$$NotificationsDoctorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Patient> patients, LoadingState loadingState});
}

/// @nodoc
class __$$NotificationsDoctorStateImplCopyWithImpl<$Res>
    extends _$NotificationsDoctorStateCopyWithImpl<$Res,
        _$NotificationsDoctorStateImpl>
    implements _$$NotificationsDoctorStateImplCopyWith<$Res> {
  __$$NotificationsDoctorStateImplCopyWithImpl(
      _$NotificationsDoctorStateImpl _value,
      $Res Function(_$NotificationsDoctorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patients = null,
    Object? loadingState = null,
  }) {
    return _then(_$NotificationsDoctorStateImpl(
      patients: null == patients
          ? _value._patients
          : patients // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ));
  }
}

/// @nodoc

class _$NotificationsDoctorStateImpl implements _NotificationsDoctorState {
  const _$NotificationsDoctorStateImpl(
      {final List<Patient> patients = const [],
      this.loadingState = LoadingState.ok})
      : _patients = patients;

  final List<Patient> _patients;
  @override
  @JsonKey()
  List<Patient> get patients {
    if (_patients is EqualUnmodifiableListView) return _patients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patients);
  }

  @override
  @JsonKey()
  final LoadingState loadingState;

  @override
  String toString() {
    return 'NotificationsDoctorState(patients: $patients, loadingState: $loadingState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsDoctorStateImpl &&
            const DeepCollectionEquality().equals(other._patients, _patients) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_patients), loadingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsDoctorStateImplCopyWith<_$NotificationsDoctorStateImpl>
      get copyWith => __$$NotificationsDoctorStateImplCopyWithImpl<
          _$NotificationsDoctorStateImpl>(this, _$identity);
}

abstract class _NotificationsDoctorState implements NotificationsDoctorState {
  const factory _NotificationsDoctorState(
      {final List<Patient> patients,
      final LoadingState loadingState}) = _$NotificationsDoctorStateImpl;

  @override
  List<Patient> get patients;
  @override
  LoadingState get loadingState;
  @override
  @JsonKey(ignore: true)
  _$$NotificationsDoctorStateImplCopyWith<_$NotificationsDoctorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
