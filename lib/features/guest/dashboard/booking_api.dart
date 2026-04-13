import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import 'booking_model.dart';

abstract interface class BookingApi {
  Future<Booking> getActiveBooking();
}

class RemoteBookingApi implements BookingApi {
  const RemoteBookingApi(this._dio);

  final Dio _dio;

  @override
  Future<Booking> getActiveBooking() async {
    try {
      final response = await _dio.get('/guest/booking');
      return Booking.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
