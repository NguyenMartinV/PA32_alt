

import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences{
  static late SharedPreferences _preferences;

  static const _keyLatLocation = '37.42796133580664';// -122.085749655962';
  static const _keyLongLocation = '-122.085749655962';


  static Future init() async =>
  _preferences = await SharedPreferences.getInstance();


  static Future setLat(bool remember) async =>
      await _preferences.setBool(_keyLatLocation, remember);
  static bool? getLat() => _preferences.getBool(_keyLatLocation);
  static Future setLong(bool remember) async =>
      await _preferences.setBool(_keyLongLocation, remember);
  static bool? getLong() => _preferences.getBool(_keyLongLocation);
}