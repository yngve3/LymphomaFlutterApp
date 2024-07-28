// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  bool get isButtonLogInEnabled => throw _privateConstructorUsedError;
  bool get isButtonRecoveryEnabled => throw _privateConstructorUsedError;
  String get loginError => throw _privateConstructorUsedError;
  List<Field> get textFields => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {bool isButtonLogInEnabled,
      bool isButtonRecoveryEnabled,
      String loginError,
      List<Field> textFields});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isButtonLogInEnabled = null,
    Object? isButtonRecoveryEnabled = null,
    Object? loginError = null,
    Object? textFields = null,
  }) {
    return _then(_value.copyWith(
      isButtonLogInEnabled: null == isButtonLogInEnabled
          ? _value.isButtonLogInEnabled
          : isButtonLogInEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonRecoveryEnabled: null == isButtonRecoveryEnabled
          ? _value.isButtonRecoveryEnabled
          : isButtonRecoveryEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      loginError: null == loginError
          ? _value.loginError
          : loginError // ignore: cast_nullable_to_non_nullable
              as String,
      textFields: null == textFields
          ? _value.textFields
          : textFields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isButtonLogInEnabled,
      bool isButtonRecoveryEnabled,
      String loginError,
      List<Field> textFields});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isButtonLogInEnabled = null,
    Object? isButtonRecoveryEnabled = null,
    Object? loginError = null,
    Object? textFields = null,
  }) {
    return _then(_$LoginStateImpl(
      isButtonLogInEnabled: null == isButtonLogInEnabled
          ? _value.isButtonLogInEnabled
          : isButtonLogInEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonRecoveryEnabled: null == isButtonRecoveryEnabled
          ? _value.isButtonRecoveryEnabled
          : isButtonRecoveryEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      loginError: null == loginError
          ? _value.loginError
          : loginError // ignore: cast_nullable_to_non_nullable
              as String,
      textFields: null == textFields
          ? _value._textFields
          : textFields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  const _$LoginStateImpl(
      {this.isButtonLogInEnabled = false,
      this.isButtonRecoveryEnabled = false,
      this.loginError = LogicStrings.init,
      final List<Field> textFields = const []})
      : _textFields = textFields;

  @override
  @JsonKey()
  final bool isButtonLogInEnabled;
  @override
  @JsonKey()
  final bool isButtonRecoveryEnabled;
  @override
  @JsonKey()
  final String loginError;
  final List<Field> _textFields;
  @override
  @JsonKey()
  List<Field> get textFields {
    if (_textFields is EqualUnmodifiableListView) return _textFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_textFields);
  }

  @override
  String toString() {
    return 'LoginState(isButtonLogInEnabled: $isButtonLogInEnabled, isButtonRecoveryEnabled: $isButtonRecoveryEnabled, loginError: $loginError, textFields: $textFields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.isButtonLogInEnabled, isButtonLogInEnabled) ||
                other.isButtonLogInEnabled == isButtonLogInEnabled) &&
            (identical(
                    other.isButtonRecoveryEnabled, isButtonRecoveryEnabled) ||
                other.isButtonRecoveryEnabled == isButtonRecoveryEnabled) &&
            (identical(other.loginError, loginError) ||
                other.loginError == loginError) &&
            const DeepCollectionEquality()
                .equals(other._textFields, _textFields));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isButtonLogInEnabled,
      isButtonRecoveryEnabled,
      loginError,
      const DeepCollectionEquality().hash(_textFields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {final bool isButtonLogInEnabled,
      final bool isButtonRecoveryEnabled,
      final String loginError,
      final List<Field> textFields}) = _$LoginStateImpl;

  @override
  bool get isButtonLogInEnabled;
  @override
  bool get isButtonRecoveryEnabled;
  @override
  String get loginError;
  @override
  List<Field> get textFields;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
