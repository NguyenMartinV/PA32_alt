import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/cares_swiper_entity.g.dart';

@JsonSerializable()
class CaresSwiperEntity {
  int? code;
  String? msg;
  List<CaresSwiperData>? data;
  String? count;

  CaresSwiperEntity();

  factory CaresSwiperEntity.fromJson(Map<String, dynamic> json) =>
      $CaresSwiperEntityFromJson(json);

  Map<String, dynamic> toJson() => $CaresSwiperEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresSwiperData {
  String? id;
  String? nickname;
  String? userName;
  String? icon;
  String? birth;
  int? age;
  String? email;
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
  List<CaresSwiperDataGiver>? giver;
  List<dynamic>? emergency;
  List<dynamic>? alert;
  int? callType;
  String? phone;
  String? alarmContent;

  CaresSwiperData();

  factory CaresSwiperData.fromJson(Map<String, dynamic> json) =>
      $CaresSwiperDataFromJson(json);

  Map<String, dynamic> toJson() => $CaresSwiperDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresSwiperDataGiver {
  String? id;
  String? nickname;
  String? phone;
  String? email;
  String? regTime;
  String? icon;
  int? caresCount;

  CaresSwiperDataGiver();

  factory CaresSwiperDataGiver.fromJson(Map<String, dynamic> json) =>
      $CaresSwiperDataGiverFromJson(json);

  Map<String, dynamic> toJson() => $CaresSwiperDataGiverToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
