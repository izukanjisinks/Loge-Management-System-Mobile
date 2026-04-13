// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingImpl _$$BookingImplFromJson(Map<String, dynamic> json) =>
    _$BookingImpl(
      id: json['id'] as String,
      roomNumber: json['roomNumber'] as String,
      roomName: json['roomName'] as String,
      roomType: json['roomType'] as String,
      checkIn: DateTime.parse(json['checkIn'] as String),
      checkOut: DateTime.parse(json['checkOut'] as String),
      mealPlan: json['mealPlan'] as String,
      roomImageUrl: json['roomImageUrl'] as String?,
      guestNotes: json['guestNotes'] as String?,
    );

Map<String, dynamic> _$$BookingImplToJson(_$BookingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomNumber': instance.roomNumber,
      'roomName': instance.roomName,
      'roomType': instance.roomType,
      'checkIn': instance.checkIn.toIso8601String(),
      'checkOut': instance.checkOut.toIso8601String(),
      'mealPlan': instance.mealPlan,
      'roomImageUrl': instance.roomImageUrl,
      'guestNotes': instance.guestNotes,
    };
