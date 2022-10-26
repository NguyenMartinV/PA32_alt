import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/customer_alerts_detail_entity.g.dart';

@JsonSerializable()
class CustomerAlertsDetailEntity {
  int? code;
  String? msg;
  CustomerAlertsDetailData? data;
  String? count;

  CustomerAlertsDetailEntity();

  factory CustomerAlertsDetailEntity.fromJson(Map<String, dynamic> json) =>
      $CustomerAlertsDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $CustomerAlertsDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerAlertsDetailData {
  String? id;
  String? nickname;
  String? userName;
  String? icon;
  String? birth;
  int? age;
  String? updateTime;
  String? lastUpdateTime;
  String? physicalCondition;
  String? deviceId;
  String? deviceNo;
  int? giversCount;
  String? address;
  String? createTime;
  List<CustomerAlertsDetailDataGps>? gps;
  List<CustomerAlertsDetailDataGiver>? giver;
  List<dynamic>? emergency;
  List<CustomerAlertsDetailDataAlert>? alert;

  CustomerAlertsDetailData();

  factory CustomerAlertsDetailData.fromJson(Map<String, dynamic> json) =>
      $CustomerAlertsDetailDataFromJson(json);

  Map<String, dynamic> toJson() => $CustomerAlertsDetailDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerAlertsDetailDataGps {
  int? batteryPower;
  String? posTime;
  double? lat;
  double? lng;
  String? pos;
  bool? fallDetection;

  CustomerAlertsDetailDataGps();

  factory CustomerAlertsDetailDataGps.fromJson(Map<String, dynamic> json) =>
      $CustomerAlertsDetailDataGpsFromJson(json);

  Map<String, dynamic> toJson() => $CustomerAlertsDetailDataGpsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerAlertsDetailDataGiver {
  String? id;
  String? nickname;
  String? phone;
  String? email;
  String? regTime;
  String? icon;
  int? caresCount;

  CustomerAlertsDetailDataGiver();

  factory CustomerAlertsDetailDataGiver.fromJson(Map<String, dynamic> json) =>
      $CustomerAlertsDetailDataGiverFromJson(json);

  Map<String, dynamic> toJson() => $CustomerAlertsDetailDataGiverToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerAlertsDetailDataAlert {
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

  CustomerAlertsDetailDataAlert();

  factory CustomerAlertsDetailDataAlert.fromJson(Map<String, dynamic> json) =>
      $CustomerAlertsDetailDataAlertFromJson(json);

  Map<String, dynamic> toJson() => $CustomerAlertsDetailDataAlertToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
