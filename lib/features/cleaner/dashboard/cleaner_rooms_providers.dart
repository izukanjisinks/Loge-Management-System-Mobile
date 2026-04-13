import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../main.dart';
import 'cleaner_room_model.dart';
import 'cleaner_rooms_api.dart';

final cleanerRoomsApiProvider = Provider<CleanerRoomsApi>((ref) {
  return RemoteCleanerRoomsApi(ref.watch(apiClientProvider).dio);
});

final cleanerRoomsNotifierProvider =
    AsyncNotifierProvider<CleanerRoomsNotifier, List<CleanerRoom>>(
  CleanerRoomsNotifier.new,
);

class CleanerRoomsNotifier extends AsyncNotifier<List<CleanerRoom>> {
  @override
  Future<List<CleanerRoom>> build() async {
    final rooms = await ref.watch(cleanerRoomsApiProvider).getRooms();
    // Always show in priority order: checkout → notReady → stayOver
    return rooms..sort((a, b) =>
        a.priority.sortOrder.compareTo(b.priority.sortOrder));
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final rooms = await ref.read(cleanerRoomsApiProvider).getRooms();
      return rooms..sort((a, b) =>
          a.priority.sortOrder.compareTo(b.priority.sortOrder));
    });
  }

  /// Called after checklist is submitted — removes the room from the list.
  void removeRoom(String roomId) {
    state = state.whenData(
      (rooms) => rooms.where((r) => r.id != roomId).toList(),
    );
  }
}

// Derived providers for the stats bento
final assignedCountProvider = Provider<int>((ref) {
  return ref.watch(cleanerRoomsNotifierProvider).valueOrNull?.length ?? 0;
});

final needsCleaningCountProvider = Provider<int>((ref) {
  final rooms = ref.watch(cleanerRoomsNotifierProvider).valueOrNull ?? [];
  return rooms
      .where((r) =>
          r.priority == RoomPriority.checkout ||
          r.priority == RoomPriority.stayOver)
      .length;
});

final completedTodayCountProvider = StateProvider<int>((ref) => 0);
