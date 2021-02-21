import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static SharedPreferences prefs;

  PreferenceService() {
    _init();
  }

  _init() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  Future<void> seBoolPrefValue(
      {@required String key, @required bool value}) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool> getBoolPrefValue({@required String key}) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  Future<void> seStringPrefValue(
      {@required String key, @required String value}) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getStringPrefValue({@required String key}) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  Future<bool> clear() async {
    prefs = await SharedPreferences.getInstance();
    final Future<bool> value = prefs.clear();
    return value;
  }
}
