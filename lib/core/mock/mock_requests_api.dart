import '../../features/guest/requests/request_model.dart';
import '../../features/guest/requests/requests_api.dart';

final _mockRequests = <ServiceRequest>[
  ServiceRequest(
    id: 'req-001',
    category: RequestCategory.foodAndBeverage,
    description: 'Artisan cheese platter and one bottle of sparkling water.',
    status: RequestStatus.pending,
    createdAt: DateTime.now().subtract(const Duration(hours: 1, minutes: 15)),
  ),
  ServiceRequest(
    id: 'req-002',
    category: RequestCategory.housekeeping,
    description: 'Two additional firm down pillows for the master suite.',
    status: RequestStatus.inProgress,
    createdAt: DateTime.now().subtract(const Duration(hours: 2, minutes: 40)),
  ),
  ServiceRequest(
    id: 'req-003',
    category: RequestCategory.maintenance,
    description: 'Fireplace ventilation check — pilot light was out.',
    status: RequestStatus.resolved,
    createdAt: DateTime.now().subtract(const Duration(hours: 4)),
  ),
];

class MockRequestsApi implements RequestsApi {
  final _requests = List<ServiceRequest>.from(_mockRequests);

  @override
  Future<List<ServiceRequest>> getRequests() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_requests);
  }

  @override
  Future<ServiceRequest> submitRequest({
    required RequestCategory category,
    required String description,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final newRequest = ServiceRequest(
      id: 'req-${DateTime.now().millisecondsSinceEpoch}',
      category: category,
      description: description,
      status: RequestStatus.pending,
      createdAt: DateTime.now(),
    );
    _requests.insert(0, newRequest);
    return newRequest;
  }

  @override
  Future<void> cancelRequest(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _requests.indexWhere((r) => r.id == id);
    if (index != -1) {
      _requests.removeAt(index);
    }
  }
}
