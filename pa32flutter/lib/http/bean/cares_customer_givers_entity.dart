import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/cares_customer_givers_entity.g.dart';

@JsonSerializable()
class CaresCustomerGiversEntity {
  int? code;
  String? msg;
  CaresCustomerGiversData? data;
  String? count;

  CaresCustomerGiversEntity();

  factory CaresCustomerGiversEntity.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerGiversEntityFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerGiversEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresCustomerGiversData {
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
  String? lastUpdateTime;
  String? physicalCondition;
  String? deviceId;
  String? deviceNo;
  int? giversCount;
  String? address;
  String? createTime;
  List<CaresCustomerGiversDataGps>? gps;
  List<CaresCustomerGiversDataGiver>? giver;
  List<CaresCustomerGiversDataEmergency>? emergency;
  List<CaresCustomerGiversDataAlert>? alert;

  CaresCustomerGiversData();

  factory CaresCustomerGiversData.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerGiversDataFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerGiversDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresCustomerGiversDataGps {
  int? batteryPower;
  String? posTime;
  double? lat;
  double? lng;
  String? pos;
  bool? fallDetection;

  CaresCustomerGiversDataGps();

  factory CaresCustomerGiversDataGps.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerGiversDataGpsFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerGiversDataGpsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresCustomerGiversDataGiver {
  String? id;
  String? nickname;
  String? phone;
  String? email;
  String? regTime;
  String? icon;
  int? caresCount;

  CaresCustomerGiversDataGiver();

  factory CaresCustomerGiversDataGiver.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerGiversDataGiverFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerGiversDataGiverToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresCustomerGiversDataEmergency {
  String? phone;
  String? callTime;
  int? callType;
  int? callStatus;
  int? callDuration;
  int? callFailReason;

  CaresCustomerGiversDataEmergency();

  factory CaresCustomerGiversDataEmergency.fromJson(
          Map<String, dynamic> json) =>
      $CaresCustomerGiversDataEmergencyFromJson(json);

  Map<String, dynamic> toJson() =>
      $CaresCustomerGiversDataEmergencyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresCustomerGiversDataAlert {
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

  CaresCustomerGiversDataAlert();

  factory CaresCustomerGiversDataAlert.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerGiversDataAlertFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerGiversDataAlertToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
