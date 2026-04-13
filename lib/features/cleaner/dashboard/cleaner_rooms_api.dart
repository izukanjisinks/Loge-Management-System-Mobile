import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import 'cleaner_room_model.dart';

abstract interface class CleanerRoomsApi {
  Future<List<CleanerRoom>> getRooms();
  Future<void> markAsClean(String roomId);
}

class RemoteCleanerRoomsApi implements CleanerRoomsApi {
  const RemoteCleanerRoomsApi(this._dio);

  final Dio _dio;

  @override
  Future<List<CleanerRoom>> getRooms() async {
    try {
      final response = await _dio.get('/cleaner/rooms');
      final list = response.data as List<dynamic>;
      return list
          .map((e) => CleanerRoom.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<void> markAsClean(String roomId) async {
    try {
      await _dio.patch('/rooms/$roomId/status', data: {'status': 'available'});
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
