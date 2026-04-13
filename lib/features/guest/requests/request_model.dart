import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_model.freezed.dart';
part 'request_model.g.dart';

enum RequestCategory { housekeeping, maintenance, foodAndBeverage, concierge }

enum RequestStatus { pending, inProgress, resolved }

extension RequestCategoryLabel on RequestCategory {
  String get label => switch (this) {
        RequestCategory.housekeeping => 'Housekeeping',
        RequestCategory.maintenance => 'Maintenance',
        RequestCategory.foodAndBeverage => 'Food & Beverage',
        RequestCategory.concierge => 'Concierge',
      };

  String get apiValue => switch (this) {
        RequestCategory.housekeeping => 'housekeeping',
        RequestCategory.maintenance => 'maintenance',
        RequestCategory.foodAndBeverage => 'food_and_beverage',
        RequestCategory.concierge => 'concierge',
      };
}

extension RequestStatusLabel on RequestStatus {
  String get label => switch (this) {
        RequestStatus.pending => 'Pending',
        RequestStatus.inProgress => 'In Progress',
        RequestStatus.resolved => 'Resolved',
      };
}

@freezed
class ServiceRequest with _$ServiceRequest {
  const factory ServiceRequest({
    required String id,
    required RequestCategory category,
    required String description,
    required RequestStatus status,
    required DateTime createdAt,
    String? roomNumber,
  }) = _ServiceRequest;

  factory ServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestFromJson(json);
}
