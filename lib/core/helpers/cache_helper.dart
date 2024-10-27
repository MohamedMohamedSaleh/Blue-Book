import 'package:blue_book/features/auth/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveUserData({required LoginModel model}) async {
    await _prefs.setString('userName', model.userName);
    await _prefs.setString('password', model.password);
  }

  static String? getUserName() {
    return _prefs.getString('userName');
  }

  static String? getUserPassword() {
    return _prefs.getString('password');
  }

  static bool isAuth() {
    getUserName();
    String? userName = getUserName();
    String? password = getUserPassword();
    return (userName != null || (userName ?? "").isNotEmpty) &&
        (password != null || (password ?? '').isNotEmpty);
  }

  static Future<void> deletUserData() async {
    await _prefs.remove('userName');
    await _prefs.remove('password');
  }

}
