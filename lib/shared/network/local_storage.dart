import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences? sharedPreferences;

  static Future<SharedPreferences> initial() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<dynamic> saveData({
    required String key,
    required dynamic value,
  }) {
    if (value is String) {
      return sharedPreferences!.setString(key, value);
    }
    if (value is int) {
      return sharedPreferences!.setInt(key, value);
    }
    if (value is double) {
      return sharedPreferences!.setDouble(key, value);
    }
    else {
      return sharedPreferences!.setBool(key, value);
    }
  }

  static dynamic getData({
    required String? key,
  })  {
    return  sharedPreferences!.get(key!);
  }

  static Future<dynamic> removeData ({
    required String? key,

  })
  async {
    await sharedPreferences!.remove(key!);
  }
}
