// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  roomNumber: json['roomNumber'] as String?,
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': _$UserRoleEnumMap[instance.role]!,
      'roomNumber': instance.roomNumber,
    };

const _$UserRoleEnumMap = {
  UserRole.guest: 'guest',
  UserRole.cleaner: 'cleaner',
};
