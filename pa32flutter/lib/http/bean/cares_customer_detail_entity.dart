import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/cares_customer_detail_entity.g.dart';

@JsonSerializable()
class CaresCustomerDetailEntity {
  int? code;
  String? msg;
  CaresCustomerDetailData? data;
  String? count;

  CaresCustomerDetailEntity();

  factory CaresCustomerDetailEntity.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresCustomerDetailData {
  String? id;
  String? nickname;
  String? userName;
  String? icon;
  String? birth;
  int? age;
  String? updateTime;
  String? alertTime;
  String? callTime;
  String? gpsTime;
  String? lastUpdateTime;
  String? deviceId;
  String? deviceNo;
  int? giversCount;
  String? address;
  String? createTime;
  List<CaresCustomerDetailDataGps>? gps;
  List<CaresCustomerDetailDataGiver>? giver;
  List<CaresCustomerDetailDataEmergency>? emergency;
  List<CaresCustomerDetailDataAlert>? alert;

  CaresCustomerDetailData();

  factory CaresCustomerDetailData.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerDetailDataFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerDetailDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresCustomerDetailDataGps {
  int? batteryPower;
  String? posTime;
  double? lat;
  double? lng;
  String? pos;
  bool? fallDetection;

  CaresCustomerDetailDataGps();

  factory CaresCustomerDetailDataGps.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerDetailDataGpsFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerDetailDataGpsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresCustomerDetailDataGiver {
  String? id;
  String? nickname;
  String? phone;
  String? email;
  String? regTime;
  String? icon;
  int? caresCount;

  CaresCustomerDetailDataGiver();

  factory CaresCustomerDetailDataGiver.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerDetailDataGiverFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerDetailDataGiverToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresCustomerDetailDataEmergency {
  String? phone;
  String? callTime;
  int? callType;
  int? callStatus;
  int? callDuration;
  int? callFailReason;

  CaresCustomerDetailDataEmergency();

  factory CaresCustomerDetailDataEmergency.fromJson(
          Map<String, dynamic> json) =>
      $CaresCustomerDetailDataEmergencyFromJson(json);

  Map<String, dynamic> toJson() =>
      $CaresCustomerDetailDataEmergencyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresCustomerDetailDataAlert {
  String? id;
  String? deviceId;
  String? orgId;
  String? groupId;
  int? alarmType;
  String? alarmTime;
  int? alarmLevel;
  int? alarmSource;
  int? flag;
  int? alarmValue;
  String? alarmContent;
  int? status;
  String? refId;
  String? alarmTypeName;

  CaresCustomerDetailDataAlert();

  factory CaresCustomerDetailDataAlert.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerDetailDataAlertFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerDetailDataAlertToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
