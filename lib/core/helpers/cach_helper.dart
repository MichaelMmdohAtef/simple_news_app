import 'package:hive/hive.dart';

class CachHelper {
  static late Box box;

  static Future putData({required String key, required String value}) async {
    await box.put(key,value);
  }

  static dynamic getData({required String key}) async {
    return box.get(key);
  }

  static dynamic deleteData({required String key}) async {
    return box.delete(key);
  }

  static dynamic clearBox({required String key}) async {
    return box.clear();
  }
}
