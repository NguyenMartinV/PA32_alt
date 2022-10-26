import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/customer_alerts_entity.g.dart';

@JsonSerializable()
class CustomerAlertsEntity {
  int? code;
  String? msg;
  List<CustomerAlertsData>? data;
  String? count;

  CustomerAlertsEntity();

  factory CustomerAlertsEntity.fromJson(Map<String, dynamic> json) =>
      $CustomerAlertsEntityFromJson(json);

  Map<String, dynamic> toJson() => $CustomerAlertsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerAlertsData {
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
  List<CustomerAlertsDataGps>? gps;
  List<CustomerAlertsDataGiver>? giver;
  List<dynamic>? emergency;
  List<dynamic>? alert;

  CustomerAlertsData();

  factory CustomerAlertsData.fromJson(Map<String, dynamic> json) =>
      $CustomerAlertsDataFromJson(json);

  Map<String, dynamic> toJson() => $CustomerAlertsDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerAlertsDataGps {
  int? batteryPower;
  String? posTime;
  double? lat;
  double? lng;
  String? pos;
  bool? fallDetection;

  CustomerAlertsDataGps();

  factory CustomerAlertsDataGps.fromJson(Map<String, dynamic> json) =>
      $CustomerAlertsDataGpsFromJson(json);

  Map<String, dynamic> toJson() => $CustomerAlertsDataGpsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerAlertsDataGiver {
  String? id;
  String? nickname;
  String? phone;
  String? email;
  String? regTime;
  String? icon;
  int? caresCount;

  CustomerAlertsDataGiver();

  factory CustomerAlertsDataGiver.fromJson(Map<String, dynamic> json) =>
      $CustomerAlertsDataGiverFromJson(json);

  Map<String, dynamic> toJson() => $CustomerAlertsDataGiverToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
