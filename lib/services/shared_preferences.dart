import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  setToken(String authToken) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString("token", authToken);
  }

  Future getToken() async {
    final instance = await SharedPreferences.getInstance();
    return instance.getString("token");
  }

  deleteToken() async {
    final instance = await SharedPreferences.getInstance();
    instance.remove("token");
  }
}
