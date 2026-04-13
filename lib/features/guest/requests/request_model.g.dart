// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceRequestImpl _$$ServiceRequestImplFromJson(Map<String, dynamic> json) =>
    _$ServiceRequestImpl(
      id: json['id'] as String,
      category: $enumDecode(_$RequestCategoryEnumMap, json['category']),
      description: json['description'] as String,
      status: $enumDecode(_$RequestStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      roomNumber: json['roomNumber'] as String?,
    );

Map<String, dynamic> _$$ServiceRequestImplToJson(
  _$ServiceRequestImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'category': _$RequestCategoryEnumMap[instance.category]!,
  'description': instance.description,
  'status': _$RequestStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'roomNumber': instance.roomNumber,
};

const _$RequestCategoryEnumMap = {
  RequestCategory.housekeeping: 'housekeeping',
  RequestCategory.maintenance: 'maintenance',
  RequestCategory.foodAndBeverage: 'foodAndBeverage',
  RequestCategory.concierge: 'concierge',
};

const _$RequestStatusEnumMap = {
  RequestStatus.pending: 'pending',
  RequestStatus.inProgress: 'inProgress',
  RequestStatus.resolved: 'resolved',
};
