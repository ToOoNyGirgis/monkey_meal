import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureLocalStorage {
  // Set Android-specific options
  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true, // Enable encrypted shared preferences
  );

  // Set iOS-specific options
  static IOSOptions _getIOSOptions() => const IOSOptions(
    accessibility: KeychainAccessibility.first_unlock, // Customize as needed
  );

  // Create a static instance of FlutterSecureStorage with platform-specific options
  static final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: _getAndroidOptions(),
    iOptions: _getIOSOptions(),
  );

  /// Save a value to secure storage
  static Future<void> saveToken({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  /// Retrieve a value from secure storage
  static Future<String?> getToken({required String key}) async {
    return await _storage.read(key: key);
  }

  /// Delete a specific value from secure storage
  static Future<void> deleteToken({required String key}) async {
    await _storage.delete(key: key);
  }

  /// Clear all data from secure storage
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
