// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'target.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Target _$TargetFromJson(Map<String, dynamic> json) {
  return _Target.fromJson(json);
}

/// @nodoc
mixin _$Target {
  String get title => throw _privateConstructorUsedError;
  String get bundleName => throw _privateConstructorUsedError;
  String get flavor => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  List<String> get args => throw _privateConstructorUsedError;
  FirebaseConfig? get firebaseConfig => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TargetCopyWith<Target> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TargetCopyWith<$Res> {
  factory $TargetCopyWith(Target value, $Res Function(Target) then) =
      _$TargetCopyWithImpl<$Res, Target>;
  @useResult
  $Res call(
      {String title,
      String bundleName,
      String flavor,
      String icon,
      List<String> args,
      FirebaseConfig? firebaseConfig});

  $FirebaseConfigCopyWith<$Res>? get firebaseConfig;
}

/// @nodoc
class _$TargetCopyWithImpl<$Res, $Val extends Target>
    implements $TargetCopyWith<$Res> {
  _$TargetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? bundleName = null,
    Object? flavor = null,
    Object? icon = null,
    Object? args = null,
    Object? firebaseConfig = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      flavor: null == flavor
          ? _value.flavor
          : flavor // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      args: null == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as List<String>,
      firebaseConfig: freezed == firebaseConfig
          ? _value.firebaseConfig
          : firebaseConfig // ignore: cast_nullable_to_non_nullable
              as FirebaseConfig?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FirebaseConfigCopyWith<$Res>? get firebaseConfig {
    if (_value.firebaseConfig == null) {
      return null;
    }

    return $FirebaseConfigCopyWith<$Res>(_value.firebaseConfig!, (value) {
      return _then(_value.copyWith(firebaseConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TargetCopyWith<$Res> implements $TargetCopyWith<$Res> {
  factory _$$_TargetCopyWith(_$_Target value, $Res Function(_$_Target) then) =
      __$$_TargetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String bundleName,
      String flavor,
      String icon,
      List<String> args,
      FirebaseConfig? firebaseConfig});

  @override
  $FirebaseConfigCopyWith<$Res>? get firebaseConfig;
}

/// @nodoc
class __$$_TargetCopyWithImpl<$Res>
    extends _$TargetCopyWithImpl<$Res, _$_Target>
    implements _$$_TargetCopyWith<$Res> {
  __$$_TargetCopyWithImpl(_$_Target _value, $Res Function(_$_Target) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? bundleName = null,
    Object? flavor = null,
    Object? icon = null,
    Object? args = null,
    Object? firebaseConfig = freezed,
  }) {
    return _then(_$_Target(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      flavor: null == flavor
          ? _value.flavor
          : flavor // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      args: null == args
          ? _value._args
          : args // ignore: cast_nullable_to_non_nullable
              as List<String>,
      firebaseConfig: freezed == firebaseConfig
          ? _value.firebaseConfig
          : firebaseConfig // ignore: cast_nullable_to_non_nullable
              as FirebaseConfig?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Target implements _Target {
  const _$_Target(
      {required this.title,
      required this.bundleName,
      required this.flavor,
      required this.icon,
      required final List<String> args,
      required this.firebaseConfig})
      : _args = args;

  factory _$_Target.fromJson(Map<String, dynamic> json) =>
      _$$_TargetFromJson(json);

  @override
  final String title;
  @override
  final String bundleName;
  @override
  final String flavor;
  @override
  final String icon;
  final List<String> _args;
  @override
  List<String> get args {
    if (_args is EqualUnmodifiableListView) return _args;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_args);
  }

  @override
  final FirebaseConfig? firebaseConfig;

  @override
  String toString() {
    return 'Target(title: $title, bundleName: $bundleName, flavor: $flavor, icon: $icon, args: $args, firebaseConfig: $firebaseConfig)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Target &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.bundleName, bundleName) ||
                other.bundleName == bundleName) &&
            (identical(other.flavor, flavor) || other.flavor == flavor) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality().equals(other._args, _args) &&
            (identical(other.firebaseConfig, firebaseConfig) ||
                other.firebaseConfig == firebaseConfig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, bundleName, flavor, icon,
      const DeepCollectionEquality().hash(_args), firebaseConfig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TargetCopyWith<_$_Target> get copyWith =>
      __$$_TargetCopyWithImpl<_$_Target>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TargetToJson(
      this,
    );
  }
}

abstract class _Target implements Target {
  const factory _Target(
      {required final String title,
      required final String bundleName,
      required final String flavor,
      required final String icon,
      required final List<String> args,
      required final FirebaseConfig? firebaseConfig}) = _$_Target;

  factory _Target.fromJson(Map<String, dynamic> json) = _$_Target.fromJson;

  @override
  String get title;
  @override
  String get bundleName;
  @override
  String get flavor;
  @override
  String get icon;
  @override
  List<String> get args;
  @override
  FirebaseConfig? get firebaseConfig;
  @override
  @JsonKey(ignore: true)
  _$$_TargetCopyWith<_$_Target> get copyWith =>
      throw _privateConstructorUsedError;
}
