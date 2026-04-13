import '../../../core/storage/secure_storage_service.dart';
import '../domain/user_model.dart';
import 'auth_api.dart';

abstract interface class AuthRepository {
  Future<User> login({required String email, required String password});
  Future<void> logout();
  Future<User?> restoreSession();
}

class RemoteAuthRepository implements AuthRepository {
  const RemoteAuthRepository({required this.api, required this.storage});

  final AuthApi api;
  final SecureStorageService storage;

  @override
  Future<User> login({required String email, required String password}) async {
    final result = await api.login(email: email, password: password);
    await Future.wait([
      storage.writeToken(result.token),
      storage.writeUserId(result.user.id),
      storage.writeUserName(result.user.name),
      storage.writeUserRole(result.user.role.name),
    ]);
    return result.user;
  }

  @override
  Future<void> logout() => storage.clearAll();

  @override
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

    return User(id: id, name: name, email: '', role: role);
  }
}
