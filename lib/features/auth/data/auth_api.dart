import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../domain/user_model.dart';

class AuthApi {
  const AuthApi(this._dio);

  final Dio _dio;

  Future<({String token, User user})> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );
      final data = response.data as Map<String, dynamic>;
      return (
        token: data['token'] as String,
        user: User.fromJson(data['user'] as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> logout(Dio dio) async {
    try {
      await _dio.post('/auth/logout');
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
