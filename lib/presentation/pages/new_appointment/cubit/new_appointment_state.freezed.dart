// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_appointment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewAppointmentState {
  List<DispAppointmentState> get dispAppointmentStates =>
      throw _privateConstructorUsedError;
  List<Field> get appointmentsFields => throw _privateConstructorUsedError;
  bool get isDispAppointmentsSaveButtonEnabled =>
      throw _privateConstructorUsedError;
  bool get isAppointmentsSaveButtonEnabled =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewAppointmentStateCopyWith<NewAppointmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewAppointmentStateCopyWith<$Res> {
  factory $NewAppointmentStateCopyWith(
          NewAppointmentState value, $Res Function(NewAppointmentState) then) =
      _$NewAppointmentStateCopyWithImpl<$Res, NewAppointmentState>;
  @useResult
  $Res call(
      {List<DispAppointmentState> dispAppointmentStates,
      List<Field> appointmentsFields,
      bool isDispAppointmentsSaveButtonEnabled,
      bool isAppointmentsSaveButtonEnabled});
}

/// @nodoc
class _$NewAppointmentStateCopyWithImpl<$Res, $Val extends NewAppointmentState>
    implements $NewAppointmentStateCopyWith<$Res> {
  _$NewAppointmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dispAppointmentStates = null,
    Object? appointmentsFields = null,
    Object? isDispAppointmentsSaveButtonEnabled = null,
    Object? isAppointmentsSaveButtonEnabled = null,
  }) {
    return _then(_value.copyWith(
      dispAppointmentStates: null == dispAppointmentStates
          ? _value.dispAppointmentStates
          : dispAppointmentStates // ignore: cast_nullable_to_non_nullable
              as List<DispAppointmentState>,
      appointmentsFields: null == appointmentsFields
          ? _value.appointmentsFields
          : appointmentsFields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
      isDispAppointmentsSaveButtonEnabled: null ==
              isDispAppointmentsSaveButtonEnabled
          ? _value.isDispAppointmentsSaveButtonEnabled
          : isDispAppointmentsSaveButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isAppointmentsSaveButtonEnabled: null == isAppointmentsSaveButtonEnabled
          ? _value.isAppointmentsSaveButtonEnabled
          : isAppointmentsSaveButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewAppointmentStateImplCopyWith<$Res>
    implements $NewAppointmentStateCopyWith<$Res> {
  factory _$$NewAppointmentStateImplCopyWith(_$NewAppointmentStateImpl value,
          $Res Function(_$NewAppointmentStateImpl) then) =
      __$$NewAppointmentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DispAppointmentState> dispAppointmentStates,
      List<Field> appointmentsFields,
      bool isDispAppointmentsSaveButtonEnabled,
      bool isAppointmentsSaveButtonEnabled});
}

/// @nodoc
class __$$NewAppointmentStateImplCopyWithImpl<$Res>
    extends _$NewAppointmentStateCopyWithImpl<$Res, _$NewAppointmentStateImpl>
    implements _$$NewAppointmentStateImplCopyWith<$Res> {
  __$$NewAppointmentStateImplCopyWithImpl(_$NewAppointmentStateImpl _value,
      $Res Function(_$NewAppointmentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dispAppointmentStates = null,
    Object? appointmentsFields = null,
    Object? isDispAppointmentsSaveButtonEnabled = null,
    Object? isAppointmentsSaveButtonEnabled = null,
  }) {
    return _then(_$NewAppointmentStateImpl(
      dispAppointmentStates: null == dispAppointmentStates
          ? _value._dispAppointmentStates
          : dispAppointmentStates // ignore: cast_nullable_to_non_nullable
              as List<DispAppointmentState>,
      appointmentsFields: null == appointmentsFields
          ? _value._appointmentsFields
          : appointmentsFields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
      isDispAppointmentsSaveButtonEnabled: null ==
              isDispAppointmentsSaveButtonEnabled
          ? _value.isDispAppointmentsSaveButtonEnabled
          : isDispAppointmentsSaveButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isAppointmentsSaveButtonEnabled: null == isAppointmentsSaveButtonEnabled
          ? _value.isAppointmentsSaveButtonEnabled
          : isAppointmentsSaveButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NewAppointmentStateImpl implements _NewAppointmentState {
  const _$NewAppointmentStateImpl(
      {final List<DispAppointmentState> dispAppointmentStates = const [],
      final List<Field> appointmentsFields = const [],
      this.isDispAppointmentsSaveButtonEnabled = false,
      this.isAppointmentsSaveButtonEnabled = false})
      : _dispAppointmentStates = dispAppointmentStates,
        _appointmentsFields = appointmentsFields;

  final List<DispAppointmentState> _dispAppointmentStates;
  @override
  @JsonKey()
  List<DispAppointmentState> get dispAppointmentStates {
    if (_dispAppointmentStates is EqualUnmodifiableListView)
      return _dispAppointmentStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dispAppointmentStates);
  }

  final List<Field> _appointmentsFields;
  @override
  @JsonKey()
  List<Field> get appointmentsFields {
    if (_appointmentsFields is EqualUnmodifiableListView)
      return _appointmentsFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointmentsFields);
  }

  @override
  @JsonKey()
  final bool isDispAppointmentsSaveButtonEnabled;
  @override
  @JsonKey()
  final bool isAppointmentsSaveButtonEnabled;

  @override
  String toString() {
    return 'NewAppointmentState(dispAppointmentStates: $dispAppointmentStates, appointmentsFields: $appointmentsFields, isDispAppointmentsSaveButtonEnabled: $isDispAppointmentsSaveButtonEnabled, isAppointmentsSaveButtonEnabled: $isAppointmentsSaveButtonEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewAppointmentStateImpl &&
            const DeepCollectionEquality()
                .equals(other._dispAppointmentStates, _dispAppointmentStates) &&
            const DeepCollectionEquality()
                .equals(other._appointmentsFields, _appointmentsFields) &&
            (identical(other.isDispAppointmentsSaveButtonEnabled,
                    isDispAppointmentsSaveButtonEnabled) ||
                other.isDispAppointmentsSaveButtonEnabled ==
                    isDispAppointmentsSaveButtonEnabled) &&
            (identical(other.isAppointmentsSaveButtonEnabled,
                    isAppointmentsSaveButtonEnabled) ||
                other.isAppointmentsSaveButtonEnabled ==
                    isAppointmentsSaveButtonEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dispAppointmentStates),
      const DeepCollectionEquality().hash(_appointmentsFields),
      isDispAppointmentsSaveButtonEnabled,
      isAppointmentsSaveButtonEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewAppointmentStateImplCopyWith<_$NewAppointmentStateImpl> get copyWith =>
      __$$NewAppointmentStateImplCopyWithImpl<_$NewAppointmentStateImpl>(
          this, _$identity);
}

abstract class _NewAppointmentState implements NewAppointmentState {
  const factory _NewAppointmentState(
      {final List<DispAppointmentState> dispAppointmentStates,
      final List<Field> appointmentsFields,
      final bool isDispAppointmentsSaveButtonEnabled,
      final bool isAppointmentsSaveButtonEnabled}) = _$NewAppointmentStateImpl;

  @override
  List<DispAppointmentState> get dispAppointmentStates;
  @override
  List<Field> get appointmentsFields;
  @override
  bool get isDispAppointmentsSaveButtonEnabled;
  @override
  bool get isAppointmentsSaveButtonEnabled;
  @override
  @JsonKey(ignore: true)
  _$$NewAppointmentStateImplCopyWith<_$NewAppointmentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
