import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/customer_list_all_entity.g.dart';

@JsonSerializable()
class CustomerListAllEntity {
  int? code;
  String? msg;
  List<CustomerListAllData>? data;
  String? count;

  CustomerListAllEntity();

  factory CustomerListAllEntity.fromJson(Map<String, dynamic> json) =>
      $CustomerListAllEntityFromJson(json);

  Map<String, dynamic> toJson() => $CustomerListAllEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerListAllData {
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
  int? callType;
  String? phone;
  String? alarmContent;
  String? createTime;
  String? callOutTime;
  String? callComeTime;
  List<CustomerListAllDataGps>? gps;
  List<CustomerListAllDataGiver>? giver;
  List<CustomerListAllDataEmergency>? emergency;
  List<CustomerListAllDataAlert>? alert;

  CustomerListAllData();

  factory CustomerListAllData.fromJson(Map<String, dynamic> json) =>
      $CustomerListAllDataFromJson(json);

  Map<String, dynamic> toJson() => $CustomerListAllDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerListAllDataGps {
  int? batteryPower;
  String? posTime;
  double? lat;
  double? lng;
  String? pos;
  bool? fallDetection;

  CustomerListAllDataGps();

  factory CustomerListAllDataGps.fromJson(Map<String, dynamic> json) =>
      $CustomerListAllDataGpsFromJson(json);

  Map<String, dynamic> toJson() => $CustomerListAllDataGpsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerListAllDataGiver {
  String? id;
  String? nickname;
  String? phone;
  String? email;
  String? regTime;
  String? icon;
  int? caresCount;

  CustomerListAllDataGiver();

  factory CustomerListAllDataGiver.fromJson(Map<String, dynamic> json) =>
      $CustomerListAllDataGiverFromJson(json);

  Map<String, dynamic> toJson() => $CustomerListAllDataGiverToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerListAllDataEmergency {
  String? phone;
  String? callTime;
  int? callType;
  int? callStatus;
  int? callDuration;
  int? callFailReason;

  CustomerListAllDataEmergency();

  factory CustomerListAllDataEmergency.fromJson(Map<String, dynamic> json) =>
      $CustomerListAllDataEmergencyFromJson(json);

  Map<String, dynamic> toJson() => $CustomerListAllDataEmergencyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerListAllDataAlert {
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

  CustomerListAllDataAlert();

  factory CustomerListAllDataAlert.fromJson(Map<String, dynamic> json) =>
      $CustomerListAllDataAlertFromJson(json);

  Map<String, dynamic> toJson() => $CustomerListAllDataAlertToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
