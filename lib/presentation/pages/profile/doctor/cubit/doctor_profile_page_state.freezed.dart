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
  String get fullName => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get room => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
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
      {String fullName,
      String type,
      String room,
      String phone,
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
    Object? fullName = null,
    Object? type = null,
    Object? room = null,
    Object? phone = null,
    Object? loadingState = null,
    Object? photoUpdateState = null,
    Object? imageURL = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
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
      {String fullName,
      String type,
      String room,
      String phone,
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
    Object? fullName = null,
    Object? type = null,
    Object? room = null,
    Object? phone = null,
    Object? loadingState = null,
    Object? photoUpdateState = null,
    Object? imageURL = freezed,
  }) {
    return _then(_$DoctorProfilePageStateImpl(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
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
      {this.fullName = "",
      this.type = "",
      this.room = "",
      this.phone = "",
      this.loadingState = LoadingState.ok,
      this.photoUpdateState = LoadingState.ok,
      this.imageURL});

  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String room;
  @override
  @JsonKey()
  final String phone;
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
    return 'DoctorProfilePageState(fullName: $fullName, type: $type, room: $room, phone: $phone, loadingState: $loadingState, photoUpdateState: $photoUpdateState, imageURL: $imageURL)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorProfilePageStateImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.photoUpdateState, photoUpdateState) ||
                other.photoUpdateState == photoUpdateState) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fullName, type, room, phone,
      loadingState, photoUpdateState, imageURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorProfilePageStateImplCopyWith<_$DoctorProfilePageStateImpl>
      get copyWith => __$$DoctorProfilePageStateImplCopyWithImpl<
          _$DoctorProfilePageStateImpl>(this, _$identity);
}

abstract class _DoctorProfilePageState implements DoctorProfilePageState {
  const factory _DoctorProfilePageState(
      {final String fullName,
      final String type,
      final String room,
      final String phone,
      final LoadingState loadingState,
      final LoadingState photoUpdateState,
      final String? imageURL}) = _$DoctorProfilePageStateImpl;

  @override
  String get fullName;
  @override
  String get type;
  @override
  String get room;
  @override
  String get phone;
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
