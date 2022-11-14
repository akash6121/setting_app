import 'package:shared_preferences/shared_preferences.dart';
class UserPreferences{
  static SharedPreferences? prefs;
  static Future init() async{
    prefs= await SharedPreferences.getInstance();
  }
  static Future setval(String path) async{
    return await prefs!.setString('image', path);
  }
  static Future getval()async{
    return prefs?.getString('path')??'0';
  }

}