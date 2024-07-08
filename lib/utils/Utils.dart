import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static Future<void> saveToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
  }

  static Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString('token').toString();
  }
}
