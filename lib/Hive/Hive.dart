import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveSetUp {
  static Future<void> init() async {
   await Hive.initFlutter();
    await publicBoxes();
  }

  // static Future<void> adapterRegistration() async {}

  static Future<void> publicBoxes() async {
    await Hive.openBox('Authorization');
  }
}
class AuthPrefsHelper {
  var box = Hive.box('Authorization');

  void setToken(String username) {
    box.put('token', username);
  }

  String? getToken() {
    return box.get('token');
  }
  Future<int>  deleteToken() {
    return box.clear();
  }

}