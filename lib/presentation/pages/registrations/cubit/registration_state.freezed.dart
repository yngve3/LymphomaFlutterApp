// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistrationState {
  DateTime? get birthdate => throw _privateConstructorUsedError;
  bool get isContinueButtonEnabled => throw _privateConstructorUsedError;
  bool get isSendRequestButtonEnabled => throw _privateConstructorUsedError;
  Map<String, Field> get textFields => throw _privateConstructorUsedError;
  String get registerError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegistrationStateCopyWith<RegistrationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationStateCopyWith<$Res> {
  factory $RegistrationStateCopyWith(
          RegistrationState value, $Res Function(RegistrationState) then) =
      _$RegistrationStateCopyWithImpl<$Res, RegistrationState>;
  @useResult
  $Res call(
      {DateTime? birthdate,
      bool isContinueButtonEnabled,
      bool isSendRequestButtonEnabled,
      Map<String, Field> textFields,
      String registerError});
}

/// @nodoc
class _$RegistrationStateCopyWithImpl<$Res, $Val extends RegistrationState>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthdate = freezed,
    Object? isContinueButtonEnabled = null,
    Object? isSendRequestButtonEnabled = null,
    Object? textFields = null,
    Object? registerError = null,
  }) {
    return _then(_value.copyWith(
      birthdate: freezed == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isContinueButtonEnabled: null == isContinueButtonEnabled
          ? _value.isContinueButtonEnabled
          : isContinueButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendRequestButtonEnabled: null == isSendRequestButtonEnabled
          ? _value.isSendRequestButtonEnabled
          : isSendRequestButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      textFields: null == textFields
          ? _value.textFields
          : textFields // ignore: cast_nullable_to_non_nullable
              as Map<String, Field>,
      registerError: null == registerError
          ? _value.registerError
          : registerError // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationStateImplCopyWith<$Res>
    implements $RegistrationStateCopyWith<$Res> {
  factory _$$RegistrationStateImplCopyWith(_$RegistrationStateImpl value,
          $Res Function(_$RegistrationStateImpl) then) =
      __$$RegistrationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? birthdate,
      bool isContinueButtonEnabled,
      bool isSendRequestButtonEnabled,
      Map<String, Field> textFields,
      String registerError});
}

/// @nodoc
class __$$RegistrationStateImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$RegistrationStateImpl>
    implements _$$RegistrationStateImplCopyWith<$Res> {
  __$$RegistrationStateImplCopyWithImpl(_$RegistrationStateImpl _value,
      $Res Function(_$RegistrationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthdate = freezed,
    Object? isContinueButtonEnabled = null,
    Object? isSendRequestButtonEnabled = null,
    Object? textFields = null,
    Object? registerError = null,
  }) {
    return _then(_$RegistrationStateImpl(
      birthdate: freezed == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isContinueButtonEnabled: null == isContinueButtonEnabled
          ? _value.isContinueButtonEnabled
          : isContinueButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendRequestButtonEnabled: null == isSendRequestButtonEnabled
          ? _value.isSendRequestButtonEnabled
          : isSendRequestButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      textFields: null == textFields
          ? _value._textFields
          : textFields // ignore: cast_nullable_to_non_nullable
              as Map<String, Field>,
      registerError: null == registerError
          ? _value.registerError
          : registerError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegistrationStateImpl implements _RegistrationState {
  const _$RegistrationStateImpl(
      {this.birthdate,
      this.isContinueButtonEnabled = false,
      this.isSendRequestButtonEnabled = false,
      final Map<String, Field> textFields = const {},
      this.registerError = LogicStrings.init})
      : _textFields = textFields;

  @override
  final DateTime? birthdate;
  @override
  @JsonKey()
  final bool isContinueButtonEnabled;
  @override
  @JsonKey()
  final bool isSendRequestButtonEnabled;
  final Map<String, Field> _textFields;
  @override
  @JsonKey()
  Map<String, Field> get textFields {
    if (_textFields is EqualUnmodifiableMapView) return _textFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_textFields);
  }

  @override
  @JsonKey()
  final String registerError;

  @override
  String toString() {
    return 'RegistrationState(birthdate: $birthdate, isContinueButtonEnabled: $isContinueButtonEnabled, isSendRequestButtonEnabled: $isSendRequestButtonEnabled, textFields: $textFields, registerError: $registerError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationStateImpl &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(
                    other.isContinueButtonEnabled, isContinueButtonEnabled) ||
                other.isContinueButtonEnabled == isContinueButtonEnabled) &&
            (identical(other.isSendRequestButtonEnabled,
                    isSendRequestButtonEnabled) ||
                other.isSendRequestButtonEnabled ==
                    isSendRequestButtonEnabled) &&
            const DeepCollectionEquality()
                .equals(other._textFields, _textFields) &&
            (identical(other.registerError, registerError) ||
                other.registerError == registerError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      birthdate,
      isContinueButtonEnabled,
      isSendRequestButtonEnabled,
      const DeepCollectionEquality().hash(_textFields),
      registerError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationStateImplCopyWith<_$RegistrationStateImpl> get copyWith =>
      __$$RegistrationStateImplCopyWithImpl<_$RegistrationStateImpl>(
          this, _$identity);
}

abstract class _RegistrationState implements RegistrationState {
  const factory _RegistrationState(
      {final DateTime? birthdate,
      final bool isContinueButtonEnabled,
      final bool isSendRequestButtonEnabled,
      final Map<String, Field> textFields,
      final String registerError}) = _$RegistrationStateImpl;

  @override
  DateTime? get birthdate;
  @override
  bool get isContinueButtonEnabled;
  @override
  bool get isSendRequestButtonEnabled;
  @override
  Map<String, Field> get textFields;
  @override
  String get registerError;
  @override
  @JsonKey(ignore: true)
  _$$RegistrationStateImplCopyWith<_$RegistrationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
