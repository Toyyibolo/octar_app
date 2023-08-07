import 'package:shared_preferences/shared_preferences.dart';

class DbHelper {
  static saveEmail(String email) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('email', email);
  }

  static saveLoggedInStatus(bool LoggedInKey) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('loggedInKey', LoggedInKey);
  }
}
