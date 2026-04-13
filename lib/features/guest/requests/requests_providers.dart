import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../main.dart';
import 'request_model.dart';
import 'requests_api.dart';

final requestsApiProvider = Provider<RequestsApi>((ref) {
  return RemoteRequestsApi(ref.watch(apiClientProvider).dio);
});

final requestsNotifierProvider =
    AsyncNotifierProvider<RequestsNotifier, List<ServiceRequest>>(
  RequestsNotifier.new,
);

class RequestsNotifier extends AsyncNotifier<List<ServiceRequest>> {
  @override
  Future<List<ServiceRequest>> build() {
    return ref.watch(requestsApiProvider).getRequests();
  }

  Future<void> submit({
    required RequestCategory category,
    required String description,
  }) async {
    final previous = state;
    // Optimistic insert as pending while the request is in-flight
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final newRequest = await ref.read(requestsApiProvider).submitRequest(
            category: category,
            description: description,
          );
      final current = previous.valueOrNull ?? [];
      return [newRequest, ...current];
    });
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(requestsApiProvider).getRequests(),
    );
  }
}
