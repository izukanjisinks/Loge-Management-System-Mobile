import '../../../core/storage/secure_storage_service.dart';
import '../domain/user_model.dart';
import 'auth_api.dart';

class AuthRepository {
  const AuthRepository({
    required this.api,
    required this.storage,
  });

  final AuthApi api;
  final SecureStorageService storage;

  Future<User> login({
    required String email,
    required String password,
  }) async {
    final result = await api.login(email: email, password: password);
    await Future.wait([
      storage.writeToken(result.token),
      storage.writeUserId(result.user.id),
      storage.writeUserName(result.user.name),
      storage.writeUserRole(result.user.role.name),
    ]);
    return result.user;
  }

  Future<void> logout() async {
    await storage.clearAll();
  }

  /// Restores session from secure storage on app start.
  /// Returns null if no valid session exists.
  Future<User?> restoreSession() async {
    final token = await storage.readToken();
    if (token == null) return null;

    final id = await storage.readUserId();
    final name = await storage.readUserName();
    final roleStr = await storage.readUserRole();

    if (id == null || name == null || roleStr == null) {
      await storage.clearAll();
      return null;
    }

    final role = UserRole.values.firstWhere(
      (r) => r.name == roleStr,
      orElse: () => UserRole.guest,
    );

    // We restore a minimal User from storage — email not cached,
    // roomNumber will be fetched by the dashboard.
    return User(id: id, name: name, email: '', role: role);
  }
}
