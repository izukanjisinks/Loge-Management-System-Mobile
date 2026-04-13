import '../../features/guest/dashboard/booking_api.dart';
import '../../features/guest/dashboard/booking_model.dart';

class MockBookingApi implements BookingApi {
  @override
  Future<Booking> getActiveBooking() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return Booking(
      id: 'booking-001',
      roomNumber: '01',
      roomName: 'Cabin 01',
      roomType: 'Timber Ridge Estates • Forest View',
      checkIn: DateTime(2026, 10, 12),
      checkOut: DateTime(2026, 10, 18),
      mealPlan: 'Full Board',
      roomImageUrl: null, // no external URL needed — placeholder will show
    );
  }
}
