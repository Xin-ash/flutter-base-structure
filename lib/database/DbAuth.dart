import 'package:shared_preferences/shared_preferences.dart';
import '../models/local_config.dart';

class DbAuth {
  final _pres = ['login'];

  Future<LocalConfig> getLocalConfig() async {
    late bool login;

    await SharedPreferences.getInstance().then((value) {
      login = value.getBool(_pres[0]) ?? false;
    });

    return LocalConfig(login);
  }

  Future<bool> getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_pres[0]) ?? false;
  }

  void setLogin(bool login) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_pres[0], login);
  }

  void logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_pres[0]);
  }
}