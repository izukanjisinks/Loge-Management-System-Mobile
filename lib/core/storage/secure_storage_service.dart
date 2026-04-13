import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract final class StorageKeys {
  static const accessToken = 'access_token';
  static const userRole = 'user_role';
  static const userId = 'user_id';
  static const userName = 'user_name';
}

class SecureStorageService {
  const SecureStorageService(this._storage);

  final FlutterSecureStorage _storage;

  Future<void> writeToken(String token) =>
      _storage.write(key: StorageKeys.accessToken, value: token);

  Future<String?> readToken() =>
      _storage.read(key: StorageKeys.accessToken);

  Future<void> writeUserRole(String role) =>
      _storage.write(key: StorageKeys.userRole, value: role);

  Future<String?> readUserRole() =>
      _storage.read(key: StorageKeys.userRole);

  Future<void> writeUserId(String id) =>
      _storage.write(key: StorageKeys.userId, value: id);

  Future<String?> readUserId() =>
      _storage.read(key: StorageKeys.userId);

  Future<void> writeUserName(String name) =>
      _storage.write(key: StorageKeys.userName, value: name);

  Future<String?> readUserName() =>
      _storage.read(key: StorageKeys.userName);

  Future<void> clearAll() => _storage.deleteAll();
}
