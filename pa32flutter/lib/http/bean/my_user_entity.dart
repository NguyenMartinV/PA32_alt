import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/my_user_entity.g.dart';

@JsonSerializable()
class MyUserEntity {
  int? code;
  String? msg;
  MyUserData? data;
  String? count;

  MyUserEntity();

  factory MyUserEntity.fromJson(Map<String, dynamic> json) =>
      $MyUserEntityFromJson(json);

  Map<String, dynamic> toJson() => $MyUserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MyUserData {
  MyUserDataUser? user;
  String? token;

  MyUserData();

  factory MyUserData.fromJson(Map<String, dynamic> json) =>
      $MyUserDataFromJson(json);

  Map<String, dynamic> toJson() => $MyUserDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MyUserDataUser {
  String? id;
  String? nickname;
  String? userName;
  String? phone;
  int? verifyStatus;
  String? email;
  int? userType;
  String? orgId;
  String? groupId;
  String? pwd;
  String? regTime;
  int? clientOffset;
  String? icon;
  int? removable;
  String? loginTime;
  int? deleted;
  List<String>? roleIds;
  int? standards;

  MyUserDataUser();

  factory MyUserDataUser.fromJson(Map<String, dynamic> json) =>
      $MyUserDataUserFromJson(json);

  Map<String, dynamic> toJson() => $MyUserDataUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
