import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/care_givers_detail_entity.dart';

CareGiversDetailEntity $CareGiversDetailEntityFromJson(
    Map<String, dynamic> json) {
  final CareGiversDetailEntity careGiversDetailEntity =
      CareGiversDetailEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    careGiversDetailEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    careGiversDetailEntity.msg = msg;
  }
  final CareGiversDetailData? data =
      jsonConvert.convert<CareGiversDetailData>(json['data']);
  if (data != null) {
    careGiversDetailEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    careGiversDetailEntity.count = count;
  }
  return careGiversDetailEntity;
}

Map<String, dynamic> $CareGiversDetailEntityToJson(
    CareGiversDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  data['count'] = entity.count;
  return data;
}

CareGiversDetailData $CareGiversDetailDataFromJson(Map<String, dynamic> json) {
  final CareGiversDetailData careGiversDetailData = CareGiversDetailData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    careGiversDetailData.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    careGiversDetailData.nickname = nickname;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    careGiversDetailData.userName = userName;
  }
  final String? firstName = jsonConvert.convert<String>(json['firstName']);
  if (firstName != null) {
    careGiversDetailData.firstName = firstName;
  }
  final String? middleName = jsonConvert.convert<String>(json['middleName']);
  if (middleName != null) {
    careGiversDetailData.middleName = middleName;
  }
  final String? lastName = jsonConvert.convert<String>(json['lastName']);
  if (lastName != null) {
    careGiversDetailData.lastName = lastName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    careGiversDetailData.icon = icon;
  }
  final String? birth = jsonConvert.convert<String>(json['birth']);
  if (birth != null) {
    careGiversDetailData.birth = birth;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    careGiversDetailData.age = age;
  }
  final int? gender = jsonConvert.convert<int>(json['gender']);
  if (gender != null) {
    careGiversDetailData.gender = gender;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    careGiversDetailData.updateTime = updateTime;
  }
  final String? alertTime = jsonConvert.convert<String>(json['alertTime']);
  if (alertTime != null) {
    careGiversDetailData.alertTime = alertTime;
  }
  final String? callTime = jsonConvert.convert<String>(json['callTime']);
  if (callTime != null) {
    careGiversDetailData.callTime = callTime;
  }
  final String? gpsTime = jsonConvert.convert<String>(json['gpsTime']);
  if (gpsTime != null) {
    careGiversDetailData.gpsTime = gpsTime;
  }
  final String? lastUpdateTime =
      jsonConvert.convert<String>(json['lastUpdateTime']);
  if (lastUpdateTime != null) {
    careGiversDetailData.lastUpdateTime = lastUpdateTime;
  }
  final String? physicalCondition =
      jsonConvert.convert<String>(json['physicalCondition']);
  if (physicalCondition != null) {
    careGiversDetailData.physicalCondition = physicalCondition;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    careGiversDetailData.deviceId = deviceId;
  }
  final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
  if (deviceNo != null) {
    careGiversDetailData.deviceNo = deviceNo;
  }
  final int? giversCount = jsonConvert.convert<int>(json['giversCount']);
  if (giversCount != null) {
    careGiversDetailData.giversCount = giversCount;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    careGiversDetailData.address = address;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    careGiversDetailData.createTime = createTime;
  }
  final List<dynamic>? gps =
      jsonConvert.convertListNotNull<dynamic>(json['gps']);
  if (gps != null) {
    careGiversDetailData.gps = gps;
  }
  final List<CareGiversDetailDataGiver>? giver =
      jsonConvert.convertListNotNull<CareGiversDetailDataGiver>(json['giver']);
  if (giver != null) {
    careGiversDetailData.giver = giver;
  }
  final List<dynamic>? emergency =
      jsonConvert.convertListNotNull<dynamic>(json['emergency']);
  if (emergency != null) {
    careGiversDetailData.emergency = emergency;
  }
  final List<dynamic>? alert =
      jsonConvert.convertListNotNull<dynamic>(json['alert']);
  if (alert != null) {
    careGiversDetailData.alert = alert;
  }
  return careGiversDetailData;
}

Map<String, dynamic> $CareGiversDetailDataToJson(CareGiversDetailData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['nickname'] = entity.nickname;
  data['userName'] = entity.userName;
  data['firstName'] = entity.firstName;
  data['middleName'] = entity.middleName;
  data['lastName'] = entity.lastName;
  data['icon'] = entity.icon;
  data['birth'] = entity.birth;
  data['age'] = entity.age;
  data['gender'] = entity.gender;
  data['updateTime'] = entity.updateTime;
  data['alertTime'] = entity.alertTime;
  data['callTime'] = entity.callTime;
  data['gpsTime'] = entity.gpsTime;
  data['lastUpdateTime'] = entity.lastUpdateTime;
  data['physicalCondition'] = entity.physicalCondition;
  data['deviceId'] = entity.deviceId;
  data['deviceNo'] = entity.deviceNo;
  data['giversCount'] = entity.giversCount;
  data['address'] = entity.address;
  data['createTime'] = entity.createTime;
  data['gps'] = entity.gps;
  data['giver'] = entity.giver?.map((v) => v.toJson()).toList();
  data['emergency'] = entity.emergency;
  data['alert'] = entity.alert;
  return data;
}

CareGiversDetailDataGiver $CareGiversDetailDataGiverFromJson(
    Map<String, dynamic> json) {
  final CareGiversDetailDataGiver careGiversDetailDataGiver =
      CareGiversDetailDataGiver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    careGiversDetailDataGiver.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    careGiversDetailDataGiver.nickname = nickname;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    careGiversDetailDataGiver.phone = phone;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    careGiversDetailDataGiver.email = email;
  }
  final String? regTime = jsonConvert.convert<String>(json['regTime']);
  if (regTime != null) {
    careGiversDetailDataGiver.regTime = regTime;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    careGiversDetailDataGiver.icon = icon;
  }
  final int? caresCount = jsonConvert.convert<int>(json['caresCount']);
  if (caresCount != null) {
    careGiversDetailDataGiver.caresCount = caresCount;
  }
  return careGiversDetailDataGiver;
}

Map<String, dynamic> $CareGiversDetailDataGiverToJson(
    CareGiversDetailDataGiver entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['nickname'] = entity.nickname;
  data['phone'] = entity.phone;
  data['email'] = entity.email;
  data['regTime'] = entity.regTime;
  data['icon'] = entity.icon;
  data['caresCount'] = entity.caresCount;
  return data;
}
