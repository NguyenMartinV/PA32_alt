import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/my_cares_customer_detail_entity.g.dart';

@JsonSerializable()
class MyCaresCustomerDetailEntity {
  int? code;
  String? msg;
  MyCaresCustomerDetailData? data;
  String? count;

  MyCaresCustomerDetailEntity();

  factory MyCaresCustomerDetailEntity.fromJson(Map<String, dynamic> json) =>
      $MyCaresCustomerDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $MyCaresCustomerDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MyCaresCustomerDetailData {
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
  String? callOutTime;
  String? callComeTime;
  List<MyCaresCustomerDetailDataGps>? gps;
  List<MyCaresCustomerDetailDataGiver>? giver;
  List<MyCaresCustomerDetailDataEmergency>? emergency;
  List<MyCaresCustomerDetailDataAlert>? alert;

  MyCaresCustomerDetailData();

  factory MyCaresCustomerDetailData.fromJson(Map<String, dynamic> json) =>
      $MyCaresCustomerDetailDataFromJson(json);

  Map<String, dynamic> toJson() => $MyCaresCustomerDetailDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MyCaresCustomerDetailDataGps {
  int? batteryPower;
  String? posTime;
  double? lat;
  double? lng;
  String? pos;
  bool? fallDetection;

  MyCaresCustomerDetailDataGps();

  factory MyCaresCustomerDetailDataGps.fromJson(Map<String, dynamic> json) =>
      $MyCaresCustomerDetailDataGpsFromJson(json);

  Map<String, dynamic> toJson() => $MyCaresCustomerDetailDataGpsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MyCaresCustomerDetailDataGiver {
  String? id;
  String? nickname;
  String? phone;
  String? email;
  String? regTime;
  String? icon;
  int? caresCount;

  MyCaresCustomerDetailDataGiver();

  factory MyCaresCustomerDetailDataGiver.fromJson(Map<String, dynamic> json) =>
      $MyCaresCustomerDetailDataGiverFromJson(json);

  Map<String, dynamic> toJson() => $MyCaresCustomerDetailDataGiverToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MyCaresCustomerDetailDataEmergency {
  String? phone;
  String? callTime;
  int? callType;
  int? callStatus;
  int? callDuration;
  int? callFailReason;

  MyCaresCustomerDetailDataEmergency();

  factory MyCaresCustomerDetailDataEmergency.fromJson(
          Map<String, dynamic> json) =>
      $MyCaresCustomerDetailDataEmergencyFromJson(json);

  Map<String, dynamic> toJson() =>
      $MyCaresCustomerDetailDataEmergencyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MyCaresCustomerDetailDataAlert {
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
  double? lng;
  double? lat;
  String? refId;
  String? deviceNo;
  String? alarmTypeName;

  MyCaresCustomerDetailDataAlert();

  factory MyCaresCustomerDetailDataAlert.fromJson(Map<String, dynamic> json) =>
      $MyCaresCustomerDetailDataAlertFromJson(json);

  Map<String, dynamic> toJson() => $MyCaresCustomerDetailDataAlertToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
