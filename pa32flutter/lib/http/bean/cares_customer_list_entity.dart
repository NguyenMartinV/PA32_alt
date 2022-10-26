import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/cares_customer_list_entity.g.dart';

@JsonSerializable()
class CaresCustomerListEntity {
  int? code;
  String? msg;
  List<CaresCustomerListData>? data;
  String? count;

  CaresCustomerListEntity();

  factory CaresCustomerListEntity.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerListEntityFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresCustomerListData {
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
  String? alarmContent;
  String? createTime;
  List<CaresCustomerListDataGps>? gps;
  List<CaresCustomerListDataGiver>? giver;
  List<dynamic>? emergency;
  List<CaresCustomerListDataAlert>? alert;
  String? alertTime;
  String? callTime;
  String? gpsTime;
  int? callType;
  String? phone;
  String? callOutTime;
  String? callComeTime;

  CaresCustomerListData();

  factory CaresCustomerListData.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerListDataFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerListDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresCustomerListDataGps {
  int? batteryPower;
  String? posTime;
  double? lat;
  double? lng;
  String? pos;
  bool? fallDetection;

  CaresCustomerListDataGps();

  factory CaresCustomerListDataGps.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerListDataGpsFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerListDataGpsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresCustomerListDataGiver {
  String? id;
  String? nickname;
  String? phone;
  String? email;
  String? regTime;
  String? icon;
  int? caresCount;

  CaresCustomerListDataGiver();

  factory CaresCustomerListDataGiver.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerListDataGiverFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerListDataGiverToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CaresCustomerListDataAlert {
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

  CaresCustomerListDataAlert();

  factory CaresCustomerListDataAlert.fromJson(Map<String, dynamic> json) =>
      $CaresCustomerListDataAlertFromJson(json);

  Map<String, dynamic> toJson() => $CaresCustomerListDataAlertToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
