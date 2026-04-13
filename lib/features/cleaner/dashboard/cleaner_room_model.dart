import 'package:freezed_annotation/freezed_annotation.dart';

part 'cleaner_room_model.freezed.dart';
part 'cleaner_room_model.g.dart';

enum RoomPriority { checkout, notReady, stayOver }

extension RoomPriorityOrder on RoomPriority {
  int get sortOrder => switch (this) {
        RoomPriority.checkout => 0,
        RoomPriority.notReady => 1,
        RoomPriority.stayOver => 2,
      };
}

@freezed
class CleanerRoom with _$CleanerRoom {
  const factory CleanerRoom({
    required String id,
    required String roomNumber,
    required String roomName,
    required String roomType,
    required RoomPriority priority,
    String? cleanByTime,     // e.g. "11:00 AM" — shown for checkout rooms
    String? guestNotes,      // special notes from front desk
    String? roomImageUrl,
    bool? guestInRoom,       // true when not_ready because guest is present
  }) = _CleanerRoom;

  factory CleanerRoom.fromJson(Map<String, dynamic> json) =>
      _$CleanerRoomFromJson(json);
}
