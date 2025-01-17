// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsersGroup _$UsersGroupFromJson(Map<String, dynamic> json) {
  return _UsersGroup.fromJson(json);
}

/// @nodoc
mixin _$UsersGroup {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<User> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersGroupCopyWith<UsersGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersGroupCopyWith<$Res> {
  factory $UsersGroupCopyWith(
          UsersGroup value, $Res Function(UsersGroup) then) =
      _$UsersGroupCopyWithImpl<$Res, UsersGroup>;
  @useResult
  $Res call({int? id, String name, List<User> users});
}

/// @nodoc
class _$UsersGroupCopyWithImpl<$Res, $Val extends UsersGroup>
    implements $UsersGroupCopyWith<$Res> {
  _$UsersGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersGroupImplCopyWith<$Res>
    implements $UsersGroupCopyWith<$Res> {
  factory _$$UsersGroupImplCopyWith(
          _$UsersGroupImpl value, $Res Function(_$UsersGroupImpl) then) =
      __$$UsersGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String name, List<User> users});
}

/// @nodoc
class __$$UsersGroupImplCopyWithImpl<$Res>
    extends _$UsersGroupCopyWithImpl<$Res, _$UsersGroupImpl>
    implements _$$UsersGroupImplCopyWith<$Res> {
  __$$UsersGroupImplCopyWithImpl(
      _$UsersGroupImpl _value, $Res Function(_$UsersGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? users = null,
  }) {
    return _then(_$UsersGroupImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersGroupImpl implements _UsersGroup {
  const _$UsersGroupImpl(
      {this.id, required this.name, required final List<User> users})
      : _users = users;

  factory _$UsersGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersGroupImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  final List<User> _users;
  @override
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'UsersGroup(id: $id, name: $name, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersGroupImplCopyWith<_$UsersGroupImpl> get copyWith =>
      __$$UsersGroupImplCopyWithImpl<_$UsersGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersGroupImplToJson(
      this,
    );
  }
}

abstract class _UsersGroup implements UsersGroup {
  const factory _UsersGroup(
      {final int? id,
      required final String name,
      required final List<User> users}) = _$UsersGroupImpl;

  factory _UsersGroup.fromJson(Map<String, dynamic> json) =
      _$UsersGroupImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  List<User> get users;
  @override
  @JsonKey(ignore: true)
  _$$UsersGroupImplCopyWith<_$UsersGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
