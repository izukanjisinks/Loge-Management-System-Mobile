import '../../features/cleaner/dashboard/cleaner_room_model.dart';
import '../../features/cleaner/dashboard/cleaner_rooms_api.dart';

final _mockRooms = <CleanerRoom>[
  CleanerRoom(
    id: 'room-001',
    roomNumber: '402',
    roomName: 'Suite 402 — Pine Grove',
    roomType: 'Luxury Suite',
    priority: RoomPriority.checkout,
    cleanByTime: '11:00 AM',
    guestNotes: 'VIP guest arriving at 14:00. Ensure champagne is chilled.',
  ),
  CleanerRoom(
    id: 'room-002',
    roomNumber: '12',
    roomName: 'Cabin 12 — The Creek',
    roomType: 'Forest Cabin',
    priority: RoomPriority.checkout,
    cleanByTime: '11:30 AM',
    guestNotes: null,
  ),
  CleanerRoom(
    id: 'room-003',
    roomNumber: '201',
    roomName: 'Suite 201 — Ridge View',
    roomType: 'Mountain Suite',
    priority: RoomPriority.notReady,
    guestInRoom: true,
    guestNotes: null,
  ),
  CleanerRoom(
    id: 'room-004',
    roomNumber: '105',
    roomName: 'Room 105 — Basecamp',
    roomType: 'Standard Room',
    priority: RoomPriority.stayOver,
    guestNotes: 'Allergic to feather pillows. Use hypoallergenic linens only.',
  ),
  CleanerRoom(
    id: 'room-005',
    roomNumber: '07',
    roomName: 'Cabin 07 — Birchwood',
    roomType: 'Forest Cabin',
    priority: RoomPriority.stayOver,
    guestNotes: null,
  ),
];

class MockCleanerRoomsApi implements CleanerRoomsApi {
  final _rooms = List<CleanerRoom>.from(_mockRooms);

  @override
  Future<List<CleanerRoom>> getRooms() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return List.from(_rooms);
  }

  @override
  Future<void> markAsClean(String roomId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _rooms.removeWhere((r) => r.id == roomId);
  }
}
