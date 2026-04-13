import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../main.dart';
import 'booking_api.dart';
import 'booking_model.dart';

final bookingApiProvider = Provider<BookingApi>((ref) {
  return RemoteBookingApi(ref.watch(apiClientProvider).dio);
});

final activeBookingProvider = FutureProvider<Booking>((ref) {
  return ref.watch(bookingApiProvider).getActiveBooking();
});
