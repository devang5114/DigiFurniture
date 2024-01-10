import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  LocalDb._();

  static LocalDb instance = LocalDb._();
  late SharedPreferences pref;

  Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String val) async {
    await pref.setString(key, val);
  }

  String? getString(String key, {String? defaultVal}) {
    return pref.getString(key) ?? defaultVal;
  }

  Future<void> setBool(String key, bool val) async {
    await pref.setBool(key, val);
  }

  bool getBool(String key) {
    return pref.getBool(key) ?? false;
  }
}
