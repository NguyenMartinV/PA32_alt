import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/customer_list_entity.g.dart';

@JsonSerializable()
class CustomerListEntity {
  int? code;
  String? msg;
  List<CustomerListData>? data;
  String? count;

  CustomerListEntity();

  factory CustomerListEntity.fromJson(Map<String, dynamic> json) =>
      $CustomerListEntityFromJson(json);

  Map<String, dynamic> toJson() => $CustomerListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerListData {
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
  List<CustomerListDataGps>? gps;
  List<CustomerListDataGiver>? giver;
  List<dynamic>? emergency;
  List<CustomerListDataAlert>? alert;
  String? alertTime;
  String? callTime;
  String? gpsTime;
  int? callType;
  String? phone;
  String? callOutTime;
  String? callComeTime;

  CustomerListData();

  factory CustomerListData.fromJson(Map<String, dynamic> json) =>
      $CustomerListDataFromJson(json);

  Map<String, dynamic> toJson() => $CustomerListDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerListDataGps {
  int? batteryPower;
  String? posTime;
  double? lat;
  double? lng;
  String? pos;
  bool? fallDetection;

  CustomerListDataGps();

  factory CustomerListDataGps.fromJson(Map<String, dynamic> json) =>
      $CustomerListDataGpsFromJson(json);

  Map<String, dynamic> toJson() => $CustomerListDataGpsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerListDataGiver {
  String? id;
  String? nickname;
  String? phone;
  String? email;
  String? regTime;
  String? icon;
  int? caresCount;

  CustomerListDataGiver();

  factory CustomerListDataGiver.fromJson(Map<String, dynamic> json) =>
      $CustomerListDataGiverFromJson(json);

  Map<String, dynamic> toJson() => $CustomerListDataGiverToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerListDataAlert {
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

  CustomerListDataAlert();

  factory CustomerListDataAlert.fromJson(Map<String, dynamic> json) =>
      $CustomerListDataAlertFromJson(json);

  Map<String, dynamic> toJson() => $CustomerListDataAlertToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
