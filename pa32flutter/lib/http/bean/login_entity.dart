import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/login_entity.g.dart';

@JsonSerializable()
class LoginEntity {
  int? code;
  String? msg;
  LoginData? data;
  String? count;

  LoginEntity();

  factory LoginEntity.fromJson(Map<String, dynamic> json) =>
      $LoginEntityFromJson(json);

  Map<String, dynamic> toJson() => $LoginEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginData {
  String? token;

  LoginData();

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      $LoginDataFromJson(json);

  Map<String, dynamic> toJson() => $LoginDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
