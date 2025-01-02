import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

// تخزين البيانات
Future<void> saveData(String key, String value) async {
  await storage.write(key: key, value: value);
}

// استرجاع البيانات
Future<String?> getData(String key) async {
  return await storage.read(key: key);
}

// حذف البيانات
Future<void> deleteData(String key) async {
  await storage.delete(key: key);
}




