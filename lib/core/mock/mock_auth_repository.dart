import '../../features/auth/data/auth_repository.dart';
import '../../features/auth/domain/user_model.dart';

// Hardcoded credentials for development.
// guest@timber.com / guest123  → guest dashboard
// cleaner@timber.com / cleaner123 → cleaner dashboard
const _mockUsers = [
  (
    email: 'guest@timber.com',
    password: 'guest123',
    user: User(
      id: 'guest-001',
      name: 'John Hartwell',
      email: 'guest@timber.com',
      role: UserRole.guest,
      roomNumber: '01',
    ),
  ),
  (
    email: 'cleaner@timber.com',
    password: 'cleaner123',
    user: User(
      id: 'cleaner-001',
      name: 'Elias Mokoena',
      email: 'cleaner@timber.com',
      role: UserRole.cleaner,
    ),
  ),
];

class MockAuthRepository implements AuthRepository {
  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    final match = _mockUsers.where(
      (u) => u.email == email.trim() && u.password == password,
    );
    if (match.isEmpty) throw Exception('Invalid email or password.');
    return match.first.user;
  }

  @override
  Future<void> logout() async =>
      Future.delayed(const Duration(milliseconds: 200));

  @override
  Future<User?> restoreSession() async => null; // always start logged out in dev
}
