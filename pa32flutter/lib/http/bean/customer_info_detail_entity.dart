import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/customer_info_detail_entity.g.dart';

@JsonSerializable()
class CustomerInfoDetailEntity {
  int? code;
  String? msg;
  CustomerInfoDetailData? data;
  String? count;

  CustomerInfoDetailEntity();

  factory CustomerInfoDetailEntity.fromJson(Map<String, dynamic> json) =>
      $CustomerInfoDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $CustomerInfoDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerInfoDetailData {
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
  List<dynamic>? gps;
  List<CustomerInfoDetailDataGiver>? giver;
  List<dynamic>? emergency;
  List<dynamic>? alert;
  String? state;
  String? detailAddress;
  String? zipCode;

  CustomerInfoDetailData();

  factory CustomerInfoDetailData.fromJson(Map<String, dynamic> json) =>
      $CustomerInfoDetailDataFromJson(json);

  Map<String, dynamic> toJson() => $CustomerInfoDetailDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerInfoDetailDataGiver {
  String? id;
  String? nickname;
  String? phone;
  String? email;
  String? regTime;
  String? icon;
  int? caresCount;

  CustomerInfoDetailDataGiver();

  factory CustomerInfoDetailDataGiver.fromJson(Map<String, dynamic> json) =>
      $CustomerInfoDetailDataGiverFromJson(json);

  Map<String, dynamic> toJson() => $CustomerInfoDetailDataGiverToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
