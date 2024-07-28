// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PatientProfileState {
  List<Field> get fields => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  ScreenState get screenState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PatientProfileStateCopyWith<PatientProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientProfileStateCopyWith<$Res> {
  factory $PatientProfileStateCopyWith(
          PatientProfileState value, $Res Function(PatientProfileState) then) =
      _$PatientProfileStateCopyWithImpl<$Res, PatientProfileState>;
  @useResult
  $Res call(
      {List<Field> fields, LoadingState loadingState, ScreenState screenState});
}

/// @nodoc
class _$PatientProfileStateCopyWithImpl<$Res, $Val extends PatientProfileState>
    implements $PatientProfileStateCopyWith<$Res> {
  _$PatientProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fields = null,
    Object? loadingState = null,
    Object? screenState = null,
  }) {
    return _then(_value.copyWith(
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientProfileStateImplCopyWith<$Res>
    implements $PatientProfileStateCopyWith<$Res> {
  factory _$$PatientProfileStateImplCopyWith(_$PatientProfileStateImpl value,
          $Res Function(_$PatientProfileStateImpl) then) =
      __$$PatientProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Field> fields, LoadingState loadingState, ScreenState screenState});
}

/// @nodoc
class __$$PatientProfileStateImplCopyWithImpl<$Res>
    extends _$PatientProfileStateCopyWithImpl<$Res, _$PatientProfileStateImpl>
    implements _$$PatientProfileStateImplCopyWith<$Res> {
  __$$PatientProfileStateImplCopyWithImpl(_$PatientProfileStateImpl _value,
      $Res Function(_$PatientProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fields = null,
    Object? loadingState = null,
    Object? screenState = null,
  }) {
    return _then(_$PatientProfileStateImpl(
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
    ));
  }
}

/// @nodoc

class _$PatientProfileStateImpl implements _PatientProfileState {
  const _$PatientProfileStateImpl(
      {final List<Field> fields = const [],
      this.loadingState = LoadingState.ok,
      this.screenState = ScreenState.other})
      : _fields = fields;

  final List<Field> _fields;
  @override
  @JsonKey()
  List<Field> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  @JsonKey()
  final LoadingState loadingState;
  @override
  @JsonKey()
  final ScreenState screenState;

  @override
  String toString() {
    return 'PatientProfileState(fields: $fields, loadingState: $loadingState, screenState: $screenState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientProfileStateImpl &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.screenState, screenState) ||
                other.screenState == screenState));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_fields), loadingState, screenState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientProfileStateImplCopyWith<_$PatientProfileStateImpl> get copyWith =>
      __$$PatientProfileStateImplCopyWithImpl<_$PatientProfileStateImpl>(
          this, _$identity);
}

abstract class _PatientProfileState implements PatientProfileState {
  const factory _PatientProfileState(
      {final List<Field> fields,
      final LoadingState loadingState,
      final ScreenState screenState}) = _$PatientProfileStateImpl;

  @override
  List<Field> get fields;
  @override
  LoadingState get loadingState;
  @override
  ScreenState get screenState;
  @override
  @JsonKey(ignore: true)
  _$$PatientProfileStateImplCopyWith<_$PatientProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
