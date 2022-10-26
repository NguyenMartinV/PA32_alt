import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/customer_detail_entity.g.dart';

@JsonSerializable()
class CustomerDetailEntity {
  int? code;
  String? msg;
  CustomerDetailData? data;
  String? count;

  CustomerDetailEntity();

  factory CustomerDetailEntity.fromJson(Map<String, dynamic> json) =>
      $CustomerDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $CustomerDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerDetailData {
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
  List<CustomerDetailDataGps>? gps;
  List<CustomerDetailDataGiver>? giver;

  CustomerDetailData();

  factory CustomerDetailData.fromJson(Map<String, dynamic> json) =>
      $CustomerDetailDataFromJson(json);

  Map<String, dynamic> toJson() => $CustomerDetailDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerDetailDataGps {
  int? batteryPower;
  String? posTime;
  double? lat;
  double? lng;
  String? pos;
  bool? fallDetection;

  CustomerDetailDataGps();

  factory CustomerDetailDataGps.fromJson(Map<String, dynamic> json) =>
      $CustomerDetailDataGpsFromJson(json);

  Map<String, dynamic> toJson() => $CustomerDetailDataGpsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerDetailDataGiver {
  String? id;
  String? nickname;
  String? phone;
  String? email;
  String? regTime;
  String? icon;
  int? caresCount;

  CustomerDetailDataGiver();

  factory CustomerDetailDataGiver.fromJson(Map<String, dynamic> json) =>
      $CustomerDetailDataGiverFromJson(json);

  Map<String, dynamic> toJson() => $CustomerDetailDataGiverToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
