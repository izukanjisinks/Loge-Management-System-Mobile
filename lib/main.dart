import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'core/mock/mock_auth_repository.dart';
import 'core/mock/mock_booking_api.dart';
import 'core/mock/mock_cleaner_rooms_api.dart';
import 'core/mock/mock_requests_api.dart';
import 'core/network/api_client.dart';
import 'core/router/app_router.dart';
import 'core/storage/secure_storage_service.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/auth_providers.dart';
import 'features/cleaner/dashboard/cleaner_rooms_providers.dart';
import 'features/guest/dashboard/booking_providers.dart';
import 'features/guest/requests/requests_providers.dart';

// ─── Toggle this to switch between mock and real API ─────────────────────────
const bool useMocks = true;
// ─────────────────────────────────────────────────────────────────────────────

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  runApp(
    ProviderScope(
      overrides: [
        storageProvider.overrideWithValue(
          SecureStorageService(const FlutterSecureStorage()),
        ),
        if (useMocks) ...[
          authRepositoryProvider.overrideWithValue(MockAuthRepository()),
          bookingApiProvider.overrideWithValue(MockBookingApi()),
          requestsApiProvider.overrideWithValue(MockRequestsApi()),
          cleanerRoomsApiProvider.overrideWithValue(MockCleanerRoomsApi()),
        ],
      ],
      child: const TimberLodgeApp(),
    ),
  );
}

final storageProvider = Provider<SecureStorageService>(
  (_) => throw UnimplementedError('overridden in main'),
);

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.watch(storageProvider));
});

class TimberLodgeApp extends ConsumerWidget {
  const TimberLodgeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'The Timber Lodge',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}
