import 'dart:convert';

import 'package:pa32/http/bean/login_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// desc：本地储存
class SPUtil {
  static const String tokenKey = "token";
  static const String usernameKey = "username";
  static const String pwdKey = "pwd";
  static const String userInfoKey = "userinfo";
  static const String isKeepPwdKey = "isKeepPwd";
  static String unitKey = "unit"; //单位Key  km/mi
  static String timezoneKey = "timeZoneId"; //时区

  // 异步保存
  static Future save(String key, String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  // 异步读取
  static Future<String?> get(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  // 异步删除
  static void remove(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      sp.remove(key);
    } catch (e) {
      print("Remove storage error");
    }
  }

  //清理token
  static void clearToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(SPUtil.tokenKey);
  }

  //保存token
  static void saveToken(String token) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(tokenKey, token);
  }

  //清理token
  static Future<String?> getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(tokenKey);
  }

  // 异步保存用户信息
  static Future saveLoginUserData(LoginData value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(userInfoKey, value.toString());
  }

  // 异步读取用户信息
  static Future<LoginData> getLoginUserData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return LoginData.fromJson(json.decode(sp.getString(userInfoKey)!));
  }

  //单位保存
  static Future saveUnit(String unit) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(unitKey, unit);
  }

  //单位读取
  static Future<String?> getUnit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(unitKey);
  }

  //时区保存
  static Future saveTimezone(String timezone) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(timezoneKey, timezone);
  }

  //时区读取
  static Future<String?> getTimezone() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(timezoneKey);
  }
}
