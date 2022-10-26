import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/my_emergency_call_entity.g.dart';

@JsonSerializable()
class MyEmergencyCallEntity {
  int? code;
  String? msg;
  List<MyEmergencyCallData>? data;
  String? count;

  MyEmergencyCallEntity();

  factory MyEmergencyCallEntity.fromJson(Map<String, dynamic> json) =>
      $MyEmergencyCallEntityFromJson(json);

  Map<String, dynamic> toJson() => $MyEmergencyCallEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MyEmergencyCallData {
  String? phone;
  String? callTime;
  int? callType;
  int? callStatus;
  int? callDuration;
  int? callFailReason;

  MyEmergencyCallData();

  factory MyEmergencyCallData.fromJson(Map<String, dynamic> json) =>
      $MyEmergencyCallDataFromJson(json);

  Map<String, dynamic> toJson() => $MyEmergencyCallDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
