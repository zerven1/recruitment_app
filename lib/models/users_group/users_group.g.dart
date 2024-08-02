// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersGroupImpl _$$UsersGroupImplFromJson(Map<String, dynamic> json) =>
    _$UsersGroupImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UsersGroupImplToJson(_$UsersGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'users': instance.users,
    };
