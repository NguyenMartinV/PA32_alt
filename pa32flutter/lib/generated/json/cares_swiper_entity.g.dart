import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/cares_swiper_entity.dart';

CaresSwiperEntity $CaresSwiperEntityFromJson(Map<String, dynamic> json) {
  final CaresSwiperEntity caresSwiperEntity = CaresSwiperEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    caresSwiperEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    caresSwiperEntity.msg = msg;
  }
  final List<CaresSwiperData>? data =
      jsonConvert.convertListNotNull<CaresSwiperData>(json['data']);
  if (data != null) {
    caresSwiperEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    caresSwiperEntity.count = count;
  }
  return caresSwiperEntity;
}

Map<String, dynamic> $CaresSwiperEntityToJson(CaresSwiperEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['count'] = entity.count;
  return data;
}

CaresSwiperData $CaresSwiperDataFromJson(Map<String, dynamic> json) {
  final CaresSwiperData caresSwiperData = CaresSwiperData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    caresSwiperData.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    caresSwiperData.nickname = nickname;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    caresSwiperData.userName = userName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    caresSwiperData.icon = icon;
  }
  final String? birth = jsonConvert.convert<String>(json['birth']);
  if (birth != null) {
    caresSwiperData.birth = birth;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    caresSwiperData.age = age;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    caresSwiperData.email = email;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    caresSwiperData.updateTime = updateTime;
  }
  final String? alertTime = jsonConvert.convert<String>(json['alertTime']);
  if (alertTime != null) {
    caresSwiperData.alertTime = alertTime;
  }
  final String? callTime = jsonConvert.convert<String>(json['callTime']);
  if (callTime != null) {
    caresSwiperData.callTime = callTime;
  }
  final String? gpsTime = jsonConvert.convert<String>(json['gpsTime']);
  if (gpsTime != null) {
    caresSwiperData.gpsTime = gpsTime;
  }
  final String? lastUpdateTime =
      jsonConvert.convert<String>(json['lastUpdateTime']);
  if (lastUpdateTime != null) {
    caresSwiperData.lastUpdateTime = lastUpdateTime;
  }
  final String? physicalCondition =
      jsonConvert.convert<String>(json['physicalCondition']);
  if (physicalCondition != null) {
    caresSwiperData.physicalCondition = physicalCondition;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    caresSwiperData.deviceId = deviceId;
  }
  final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
  if (deviceNo != null) {
    caresSwiperData.deviceNo = deviceNo;
  }
  final int? giversCount = jsonConvert.convert<int>(json['giversCount']);
  if (giversCount != null) {
    caresSwiperData.giversCount = giversCount;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    caresSwiperData.address = address;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    caresSwiperData.createTime = createTime;
  }
  final List<dynamic>? gps =
      jsonConvert.convertListNotNull<dynamic>(json['gps']);
  if (gps != null) {
    caresSwiperData.gps = gps;
  }
  final List<CaresSwiperDataGiver>? giver =
      jsonConvert.convertListNotNull<CaresSwiperDataGiver>(json['giver']);
  if (giver != null) {
    caresSwiperData.giver = giver;
  }
  final List<dynamic>? emergency =
      jsonConvert.convertListNotNull<dynamic>(json['emergency']);
  if (emergency != null) {
    caresSwiperData.emergency = emergency;
  }
  final List<dynamic>? alert =
      jsonConvert.convertListNotNull<dynamic>(json['alert']);
  if (alert != null) {
    caresSwiperData.alert = alert;
  }
  final int? callType = jsonConvert.convert<int>(json['callType']);
  if (callType != null) {
    caresSwiperData.callType = callType;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    caresSwiperData.phone = phone;
  }
  final String? alarmContent =
      jsonConvert.convert<String>(json['alarmContent']);
  if (alarmContent != null) {
    caresSwiperData.alarmContent = alarmContent;
  }
  return caresSwiperData;
}

Map<String, dynamic> $CaresSwiperDataToJson(CaresSwiperData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['nickname'] = entity.nickname;
  data['userName'] = entity.userName;
  data['icon'] = entity.icon;
  data['birth'] = entity.birth;
  data['age'] = entity.age;
  data['email'] = entity.email;
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
  data['callType'] = entity.callType;
  data['phone'] = entity.phone;
  data['alarmContent'] = entity.alarmContent;
  return data;
}

CaresSwiperDataGiver $CaresSwiperDataGiverFromJson(Map<String, dynamic> json) {
  final CaresSwiperDataGiver caresSwiperDataGiver = CaresSwiperDataGiver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    caresSwiperDataGiver.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    caresSwiperDataGiver.nickname = nickname;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    caresSwiperDataGiver.phone = phone;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    caresSwiperDataGiver.email = email;
  }
  final String? regTime = jsonConvert.convert<String>(json['regTime']);
  if (regTime != null) {
    caresSwiperDataGiver.regTime = regTime;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    caresSwiperDataGiver.icon = icon;
  }
  final int? caresCount = jsonConvert.convert<int>(json['caresCount']);
  if (caresCount != null) {
    caresSwiperDataGiver.caresCount = caresCount;
  }
  return caresSwiperDataGiver;
}

Map<String, dynamic> $CaresSwiperDataGiverToJson(CaresSwiperDataGiver entity) {
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
