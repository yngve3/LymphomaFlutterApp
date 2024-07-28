// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConfirmRequestState {
  String get id => throw _privateConstructorUsedError;
  DateTime? get birthdate => throw _privateConstructorUsedError;
  List<Field> get fields => throw _privateConstructorUsedError;
  bool get isButtonAcceptEnabled => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfirmRequestStateCopyWith<ConfirmRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmRequestStateCopyWith<$Res> {
  factory $ConfirmRequestStateCopyWith(
          ConfirmRequestState value, $Res Function(ConfirmRequestState) then) =
      _$ConfirmRequestStateCopyWithImpl<$Res, ConfirmRequestState>;
  @useResult
  $Res call(
      {String id,
      DateTime? birthdate,
      List<Field> fields,
      bool isButtonAcceptEnabled,
      LoadingState loadingState});
}

/// @nodoc
class _$ConfirmRequestStateCopyWithImpl<$Res, $Val extends ConfirmRequestState>
    implements $ConfirmRequestStateCopyWith<$Res> {
  _$ConfirmRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? birthdate = freezed,
    Object? fields = null,
    Object? isButtonAcceptEnabled = null,
    Object? loadingState = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: freezed == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
      isButtonAcceptEnabled: null == isButtonAcceptEnabled
          ? _value.isButtonAcceptEnabled
          : isButtonAcceptEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfirmRequestStateImplCopyWith<$Res>
    implements $ConfirmRequestStateCopyWith<$Res> {
  factory _$$ConfirmRequestStateImplCopyWith(_$ConfirmRequestStateImpl value,
          $Res Function(_$ConfirmRequestStateImpl) then) =
      __$$ConfirmRequestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime? birthdate,
      List<Field> fields,
      bool isButtonAcceptEnabled,
      LoadingState loadingState});
}

/// @nodoc
class __$$ConfirmRequestStateImplCopyWithImpl<$Res>
    extends _$ConfirmRequestStateCopyWithImpl<$Res, _$ConfirmRequestStateImpl>
    implements _$$ConfirmRequestStateImplCopyWith<$Res> {
  __$$ConfirmRequestStateImplCopyWithImpl(_$ConfirmRequestStateImpl _value,
      $Res Function(_$ConfirmRequestStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? birthdate = freezed,
    Object? fields = null,
    Object? isButtonAcceptEnabled = null,
    Object? loadingState = null,
  }) {
    return _then(_$ConfirmRequestStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: freezed == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
      isButtonAcceptEnabled: null == isButtonAcceptEnabled
          ? _value.isButtonAcceptEnabled
          : isButtonAcceptEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ));
  }
}

/// @nodoc

class _$ConfirmRequestStateImpl implements _ConfirmRequestState {
  const _$ConfirmRequestStateImpl(
      {this.id = "",
      this.birthdate,
      final List<Field> fields = const [],
      this.isButtonAcceptEnabled = false,
      this.loadingState = LoadingState.ok})
      : _fields = fields;

  @override
  @JsonKey()
  final String id;
  @override
  final DateTime? birthdate;
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
  final bool isButtonAcceptEnabled;
  @override
  @JsonKey()
  final LoadingState loadingState;

  @override
  String toString() {
    return 'ConfirmRequestState(id: $id, birthdate: $birthdate, fields: $fields, isButtonAcceptEnabled: $isButtonAcceptEnabled, loadingState: $loadingState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmRequestStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            (identical(other.isButtonAcceptEnabled, isButtonAcceptEnabled) ||
                other.isButtonAcceptEnabled == isButtonAcceptEnabled) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      birthdate,
      const DeepCollectionEquality().hash(_fields),
      isButtonAcceptEnabled,
      loadingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmRequestStateImplCopyWith<_$ConfirmRequestStateImpl> get copyWith =>
      __$$ConfirmRequestStateImplCopyWithImpl<_$ConfirmRequestStateImpl>(
          this, _$identity);
}

abstract class _ConfirmRequestState implements ConfirmRequestState {
  const factory _ConfirmRequestState(
      {final String id,
      final DateTime? birthdate,
      final List<Field> fields,
      final bool isButtonAcceptEnabled,
      final LoadingState loadingState}) = _$ConfirmRequestStateImpl;

  @override
  String get id;
  @override
  DateTime? get birthdate;
  @override
  List<Field> get fields;
  @override
  bool get isButtonAcceptEnabled;
  @override
  LoadingState get loadingState;
  @override
  @JsonKey(ignore: true)
  _$$ConfirmRequestStateImplCopyWith<_$ConfirmRequestStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
