import 'package:meal_monkey/core/utils/functions/encrypt_text.dart';
import 'package:meal_monkey/core/utils/functions/flutter_secure_storage.dart';

Future<void> saveEncryptedData(String key, String value) async {
  final encryptedValue = encryptData(value); // تشفير البيانات
  await storage.write(key: key, value: encryptedValue); // تخزين البيانات المشفرة
}

Future<String?> getDecryptedData(String key) async {
  final encryptedValue = await storage.read(key: key); // استرجاع البيانات المشفرة
  if (encryptedValue != null) {
    return decryptData(encryptedValue); // فك تشفير البيانات
  }
  return null;
}
