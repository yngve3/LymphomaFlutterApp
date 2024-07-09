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
  $Res call({List<Patient> allPatients, List<Patient> favoritePatients});
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
  $Res call({List<Patient> allPatients, List<Patient> favoritePatients});
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
    ));
  }
}

/// @nodoc

class _$MainDoctorPageStateImpl implements _MainDoctorPageState {
  const _$MainDoctorPageStateImpl(
      {final List<Patient> allPatients = const [],
      final List<Patient> favoritePatients = const []})
      : _allPatients = allPatients,
        _favoritePatients = favoritePatients;

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

  @override
  String toString() {
    return 'MainDoctorPageState(allPatients: $allPatients, favoritePatients: $favoritePatients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainDoctorPageStateImpl &&
            const DeepCollectionEquality()
                .equals(other._allPatients, _allPatients) &&
            const DeepCollectionEquality()
                .equals(other._favoritePatients, _favoritePatients));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allPatients),
      const DeepCollectionEquality().hash(_favoritePatients));

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
      final List<Patient> favoritePatients}) = _$MainDoctorPageStateImpl;

  @override
  List<Patient> get allPatients;
  @override
  List<Patient> get favoritePatients;
  @override
  @JsonKey(ignore: true)
  _$$MainDoctorPageStateImplCopyWith<_$MainDoctorPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
