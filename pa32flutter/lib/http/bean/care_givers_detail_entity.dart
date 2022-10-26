import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/care_givers_detail_entity.g.dart';

@JsonSerializable()
class CareGiversDetailEntity {
  int? code;
  String? msg;
  CareGiversDetailData? data;
  String? count;

  CareGiversDetailEntity();

  factory CareGiversDetailEntity.fromJson(Map<String, dynamic> json) =>
      $CareGiversDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $CareGiversDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CareGiversDetailData {
  String? id;
  String? nickname;
  String? userName;
  String? firstName;
  String? middleName;
  String? lastName;
  String? icon;
  String? birth;
  int? age;
  int? gender;
  String? updateTime;
  String? alertTime;
  String? callTime;
  String? gpsTime;
  String? lastUpdateTime;
  String? physicalCondition;
  String? deviceId;
  String? deviceNo;
  int? giversCount;
  String? address;
  String? createTime;
  List<dynamic>? gps;
  List<CareGiversDetailDataGiver>? giver;
  List<dynamic>? emergency;
  List<dynamic>? alert;

  CareGiversDetailData();

  factory CareGiversDetailData.fromJson(Map<String, dynamic> json) =>
      $CareGiversDetailDataFromJson(json);

  Map<String, dynamic> toJson() => $CareGiversDetailDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CareGiversDetailDataGiver {
  String? id;
  String? nickname;
  String? phone;
  String? email;
  String? regTime;
  String? icon;
  int? caresCount;

  CareGiversDetailDataGiver();

  factory CareGiversDetailDataGiver.fromJson(Map<String, dynamic> json) =>
      $CareGiversDetailDataGiverFromJson(json);

  Map<String, dynamic> toJson() => $CareGiversDetailDataGiverToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
