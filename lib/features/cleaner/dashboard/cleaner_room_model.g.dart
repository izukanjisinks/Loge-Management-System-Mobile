// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cleaner_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CleanerRoomImpl _$$CleanerRoomImplFromJson(Map<String, dynamic> json) =>
    _$CleanerRoomImpl(
      id: json['id'] as String,
      roomNumber: json['roomNumber'] as String,
      roomName: json['roomName'] as String,
      roomType: json['roomType'] as String,
      priority: $enumDecode(_$RoomPriorityEnumMap, json['priority']),
      cleanByTime: json['cleanByTime'] as String?,
      guestNotes: json['guestNotes'] as String?,
      roomImageUrl: json['roomImageUrl'] as String?,
      guestInRoom: json['guestInRoom'] as bool?,
    );

Map<String, dynamic> _$$CleanerRoomImplToJson(_$CleanerRoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomNumber': instance.roomNumber,
      'roomName': instance.roomName,
      'roomType': instance.roomType,
      'priority': _$RoomPriorityEnumMap[instance.priority]!,
      'cleanByTime': instance.cleanByTime,
      'guestNotes': instance.guestNotes,
      'roomImageUrl': instance.roomImageUrl,
      'guestInRoom': instance.guestInRoom,
    };

const _$RoomPriorityEnumMap = {
  RoomPriority.checkout: 'checkout',
  RoomPriority.notReady: 'notReady',
  RoomPriority.stayOver: 'stayOver',
};
