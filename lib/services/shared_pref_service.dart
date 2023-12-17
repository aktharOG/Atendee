import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceService {

  static late final SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  saveString(String name) {
    prefs.setString("login", name);
  
  }

  getString() {
    var name = prefs.getString("login");
    return name;
  }

    saveUserType(String name) {
    prefs.setString("user", name);
  
  }

  getUserType() {
    var name = prefs.getString("user");
    return name;
  }

  
}