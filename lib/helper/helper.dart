import 'package:shared_preferences/shared_preferences.dart';

class DbHelper {
  static Future<bool?> saveEmail(String email) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString('email', email);
  }

  static Future<bool?> saveLoggedInState(bool loggedInKey) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool('loggedInKey', loggedInKey);
  }

  static Future<bool?> saveUsername(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString('userName', userName);
  }

  static Future<bool?> saveFamilyName(String familyName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString('familyName', familyName);
  }

  static Future<bool?> saveDob(String dob) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString('dob', dob);
  }

  static Future<bool?> saveHomeAddress(String homeAddress) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString('homeAddress', homeAddress);
  }

  static Future<bool?> savePhoneNumber(String phoneNumber) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString('phoneNumber', phoneNumber);
  }

  static Future<bool?> saveBvn(String bvn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString('bvn', bvn);
  }

  static Future<bool?> savePin(String pin) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString('pin', pin);
  }

  static Future<String?> getPin() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString('pin');
  }

  static Future<String?> getEmail() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString('email');
  }

  static Future<bool?> getLoggedInState() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool('loggedInKey');
  }

  static Future<String?> getUsername() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString('userName');
  }

  static Future<String?> getFamilyName() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString('familyName');
  }

  static Future<String?> getDob() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString('dob');
  }

  static Future<String?> getHomeAddress() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString('homeAddress');
  }

  static Future<String?> getPhoneNumber() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString('phoneNumber');
  }

  static Future<String?> getBvn() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString('bvn');
  }
}
