import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'core/network/api_client.dart';
import 'core/router/app_router.dart';
import 'core/storage/secure_storage_service.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  runApp(
    ProviderScope(
      overrides: [
        storageProvider.overrideWithValue(
          SecureStorageService(const FlutterSecureStorage()),
        ),
      ],
      child: const TimberLodgeApp(),
    ),
  );
}

// Top-level providers — consumed by features across the app
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
