import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import 'request_model.dart';

abstract interface class RequestsApi {
  Future<List<ServiceRequest>> getRequests();
  Future<ServiceRequest> submitRequest({
    required RequestCategory category,
    required String description,
  });
  Future<void> cancelRequest(String id);
}

class RemoteRequestsApi implements RequestsApi {
  const RemoteRequestsApi(this._dio);

  final Dio _dio;

  @override
  Future<List<ServiceRequest>> getRequests() async {
    try {
      final response = await _dio.get('/guest/requests');
      final list = response.data as List<dynamic>;
      return list
          .map((e) => ServiceRequest.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<ServiceRequest> submitRequest({
    required RequestCategory category,
    required String description,
  }) async {
    try {
      final response = await _dio.post(
        '/guest/requests',
        data: {'category': category.apiValue, 'description': description},
      );
      return ServiceRequest.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<void> cancelRequest(String id) async {
    try {
      await _dio.patch('/guest/requests/$id', data: {'status': 'cancelled'});
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
