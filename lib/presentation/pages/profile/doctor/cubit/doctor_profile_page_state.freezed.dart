// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_profile_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DoctorProfilePageState {
  List<Field> get textFields => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  LoadingState get photoUpdateState => throw _privateConstructorUsedError;
  String? get imageURL => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DoctorProfilePageStateCopyWith<DoctorProfilePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorProfilePageStateCopyWith<$Res> {
  factory $DoctorProfilePageStateCopyWith(DoctorProfilePageState value,
          $Res Function(DoctorProfilePageState) then) =
      _$DoctorProfilePageStateCopyWithImpl<$Res, DoctorProfilePageState>;
  @useResult
  $Res call(
      {List<Field> textFields,
      LoadingState loadingState,
      LoadingState photoUpdateState,
      String? imageURL});
}

/// @nodoc
class _$DoctorProfilePageStateCopyWithImpl<$Res,
        $Val extends DoctorProfilePageState>
    implements $DoctorProfilePageStateCopyWith<$Res> {
  _$DoctorProfilePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textFields = null,
    Object? loadingState = null,
    Object? photoUpdateState = null,
    Object? imageURL = freezed,
  }) {
    return _then(_value.copyWith(
      textFields: null == textFields
          ? _value.textFields
          : textFields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      photoUpdateState: null == photoUpdateState
          ? _value.photoUpdateState
          : photoUpdateState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      imageURL: freezed == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorProfilePageStateImplCopyWith<$Res>
    implements $DoctorProfilePageStateCopyWith<$Res> {
  factory _$$DoctorProfilePageStateImplCopyWith(
          _$DoctorProfilePageStateImpl value,
          $Res Function(_$DoctorProfilePageStateImpl) then) =
      __$$DoctorProfilePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Field> textFields,
      LoadingState loadingState,
      LoadingState photoUpdateState,
      String? imageURL});
}

/// @nodoc
class __$$DoctorProfilePageStateImplCopyWithImpl<$Res>
    extends _$DoctorProfilePageStateCopyWithImpl<$Res,
        _$DoctorProfilePageStateImpl>
    implements _$$DoctorProfilePageStateImplCopyWith<$Res> {
  __$$DoctorProfilePageStateImplCopyWithImpl(
      _$DoctorProfilePageStateImpl _value,
      $Res Function(_$DoctorProfilePageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textFields = null,
    Object? loadingState = null,
    Object? photoUpdateState = null,
    Object? imageURL = freezed,
  }) {
    return _then(_$DoctorProfilePageStateImpl(
      textFields: null == textFields
          ? _value._textFields
          : textFields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      photoUpdateState: null == photoUpdateState
          ? _value.photoUpdateState
          : photoUpdateState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      imageURL: freezed == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DoctorProfilePageStateImpl implements _DoctorProfilePageState {
  const _$DoctorProfilePageStateImpl(
      {final List<Field> textFields = const [],
      this.loadingState = LoadingState.ok,
      this.photoUpdateState = LoadingState.ok,
      this.imageURL})
      : _textFields = textFields;

  final List<Field> _textFields;
  @override
  @JsonKey()
  List<Field> get textFields {
    if (_textFields is EqualUnmodifiableListView) return _textFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_textFields);
  }

  @override
  @JsonKey()
  final LoadingState loadingState;
  @override
  @JsonKey()
  final LoadingState photoUpdateState;
  @override
  final String? imageURL;

  @override
  String toString() {
    return 'DoctorProfilePageState(textFields: $textFields, loadingState: $loadingState, photoUpdateState: $photoUpdateState, imageURL: $imageURL)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorProfilePageStateImpl &&
            const DeepCollectionEquality()
                .equals(other._textFields, _textFields) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.photoUpdateState, photoUpdateState) ||
                other.photoUpdateState == photoUpdateState) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_textFields),
      loadingState,
      photoUpdateState,
      imageURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorProfilePageStateImplCopyWith<_$DoctorProfilePageStateImpl>
      get copyWith => __$$DoctorProfilePageStateImplCopyWithImpl<
          _$DoctorProfilePageStateImpl>(this, _$identity);
}

abstract class _DoctorProfilePageState implements DoctorProfilePageState {
  const factory _DoctorProfilePageState(
      {final List<Field> textFields,
      final LoadingState loadingState,
      final LoadingState photoUpdateState,
      final String? imageURL}) = _$DoctorProfilePageStateImpl;

  @override
  List<Field> get textFields;
  @override
  LoadingState get loadingState;
  @override
  LoadingState get photoUpdateState;
  @override
  String? get imageURL;
  @override
  @JsonKey(ignore: true)
  _$$DoctorProfilePageStateImplCopyWith<_$DoctorProfilePageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
