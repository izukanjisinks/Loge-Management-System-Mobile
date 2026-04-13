import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
class Booking with _$Booking {
  const factory Booking({
    required String id,
    required String roomNumber,
    required String roomName,
    required String roomType,
    required DateTime checkIn,
    required DateTime checkOut,
    required String mealPlan,
    String? roomImageUrl,
    String? guestNotes,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}
