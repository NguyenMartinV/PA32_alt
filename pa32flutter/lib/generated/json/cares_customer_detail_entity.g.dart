import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/cares_customer_detail_entity.dart';

CaresCustomerDetailEntity $CaresCustomerDetailEntityFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerDetailEntity caresCustomerDetailEntity =
      CaresCustomerDetailEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    caresCustomerDetailEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    caresCustomerDetailEntity.msg = msg;
  }
  final CaresCustomerDetailData? data =
      jsonConvert.convert<CaresCustomerDetailData>(json['data']);
  if (data != null) {
    caresCustomerDetailEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    caresCustomerDetailEntity.count = count;
  }
  return caresCustomerDetailEntity;
}

Map<String, dynamic> $CaresCustomerDetailEntityToJson(
    CaresCustomerDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  data['count'] = entity.count;
  return data;
}

CaresCustomerDetailData $CaresCustomerDetailDataFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerDetailData caresCustomerDetailData =
      CaresCustomerDetailData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    caresCustomerDetailData.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    caresCustomerDetailData.nickname = nickname;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    caresCustomerDetailData.userName = userName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    caresCustomerDetailData.icon = icon;
  }
  final String? birth = jsonConvert.convert<String>(json['birth']);
  if (birth != null) {
    caresCustomerDetailData.birth = birth;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    caresCustomerDetailData.age = age;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    caresCustomerDetailData.updateTime = updateTime;
  }
  final String? alertTime = jsonConvert.convert<String>(json['alertTime']);
  if (alertTime != null) {
    caresCustomerDetailData.alertTime = alertTime;
  }
  final String? callTime = jsonConvert.convert<String>(json['callTime']);
  if (callTime != null) {
    caresCustomerDetailData.callTime = callTime;
  }
  final String? gpsTime = jsonConvert.convert<String>(json['gpsTime']);
  if (gpsTime != null) {
    caresCustomerDetailData.gpsTime = gpsTime;
  }
  final String? lastUpdateTime =
      jsonConvert.convert<String>(json['lastUpdateTime']);
  if (lastUpdateTime != null) {
    caresCustomerDetailData.lastUpdateTime = lastUpdateTime;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    caresCustomerDetailData.deviceId = deviceId;
  }
  final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
  if (deviceNo != null) {
    caresCustomerDetailData.deviceNo = deviceNo;
  }
  final int? giversCount = jsonConvert.convert<int>(json['giversCount']);
  if (giversCount != null) {
    caresCustomerDetailData.giversCount = giversCount;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    caresCustomerDetailData.address = address;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    caresCustomerDetailData.createTime = createTime;
  }
  final List<CaresCustomerDetailDataGps>? gps =
      jsonConvert.convertListNotNull<CaresCustomerDetailDataGps>(json['gps']);
  if (gps != null) {
    caresCustomerDetailData.gps = gps;
  }
  final List<CaresCustomerDetailDataGiver>? giver = jsonConvert
      .convertListNotNull<CaresCustomerDetailDataGiver>(json['giver']);
  if (giver != null) {
    caresCustomerDetailData.giver = giver;
  }
  final List<CaresCustomerDetailDataEmergency>? emergency = jsonConvert
      .convertListNotNull<CaresCustomerDetailDataEmergency>(json['emergency']);
  if (emergency != null) {
    caresCustomerDetailData.emergency = emergency;
  }
  final List<CaresCustomerDetailDataAlert>? alert = jsonConvert
      .convertListNotNull<CaresCustomerDetailDataAlert>(json['alert']);
  if (alert != null) {
    caresCustomerDetailData.alert = alert;
  }
  return caresCustomerDetailData;
}

Map<String, dynamic> $CaresCustomerDetailDataToJson(
    CaresCustomerDetailData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['nickname'] = entity.nickname;
  data['userName'] = entity.userName;
  data['icon'] = entity.icon;
  data['birth'] = entity.birth;
  data['age'] = entity.age;
  data['updateTime'] = entity.updateTime;
  data['alertTime'] = entity.alertTime;
  data['callTime'] = entity.callTime;
  data['gpsTime'] = entity.gpsTime;
  data['lastUpdateTime'] = entity.lastUpdateTime;
  data['deviceId'] = entity.deviceId;
  data['deviceNo'] = entity.deviceNo;
  data['giversCount'] = entity.giversCount;
  data['address'] = entity.address;
  data['createTime'] = entity.createTime;
  data['gps'] = entity.gps?.map((v) => v.toJson()).toList();
  data['giver'] = entity.giver?.map((v) => v.toJson()).toList();
  data['emergency'] = entity.emergency?.map((v) => v.toJson()).toList();
  data['alert'] = entity.alert?.map((v) => v.toJson()).toList();
  return data;
}

CaresCustomerDetailDataGps $CaresCustomerDetailDataGpsFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerDetailDataGps caresCustomerDetailDataGps =
      CaresCustomerDetailDataGps();
  final int? batteryPower = jsonConvert.convert<int>(json['batteryPower']);
  if (batteryPower != null) {
    caresCustomerDetailDataGps.batteryPower = batteryPower;
  }
  final String? posTime = jsonConvert.convert<String>(json['posTime']);
  if (posTime != null) {
    caresCustomerDetailDataGps.posTime = posTime;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    caresCustomerDetailDataGps.lat = lat;
  }
  final double? lng = jsonConvert.convert<double>(json['lng']);
  if (lng != null) {
    caresCustomerDetailDataGps.lng = lng;
  }
  final String? pos = jsonConvert.convert<String>(json['pos']);
  if (pos != null) {
    caresCustomerDetailDataGps.pos = pos;
  }
  final bool? fallDetection = jsonConvert.convert<bool>(json['fallDetection']);
  if (fallDetection != null) {
    caresCustomerDetailDataGps.fallDetection = fallDetection;
  }
  return caresCustomerDetailDataGps;
}

Map<String, dynamic> $CaresCustomerDetailDataGpsToJson(
    CaresCustomerDetailDataGps entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['batteryPower'] = entity.batteryPower;
  data['posTime'] = entity.posTime;
  data['lat'] = entity.lat;
  data['lng'] = entity.lng;
  data['pos'] = entity.pos;
  data['fallDetection'] = entity.fallDetection;
  return data;
}

CaresCustomerDetailDataGiver $CaresCustomerDetailDataGiverFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerDetailDataGiver caresCustomerDetailDataGiver =
      CaresCustomerDetailDataGiver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    caresCustomerDetailDataGiver.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    caresCustomerDetailDataGiver.nickname = nickname;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    caresCustomerDetailDataGiver.phone = phone;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    caresCustomerDetailDataGiver.email = email;
  }
  final String? regTime = jsonConvert.convert<String>(json['regTime']);
  if (regTime != null) {
    caresCustomerDetailDataGiver.regTime = regTime;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    caresCustomerDetailDataGiver.icon = icon;
  }
  final int? caresCount = jsonConvert.convert<int>(json['caresCount']);
  if (caresCount != null) {
    caresCustomerDetailDataGiver.caresCount = caresCount;
  }
  return caresCustomerDetailDataGiver;
}

Map<String, dynamic> $CaresCustomerDetailDataGiverToJson(
    CaresCustomerDetailDataGiver entity) {
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

CaresCustomerDetailDataEmergency $CaresCustomerDetailDataEmergencyFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerDetailDataEmergency caresCustomerDetailDataEmergency =
      CaresCustomerDetailDataEmergency();
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    caresCustomerDetailDataEmergency.phone = phone;
  }
  final String? callTime = jsonConvert.convert<String>(json['callTime']);
  if (callTime != null) {
    caresCustomerDetailDataEmergency.callTime = callTime;
  }
  final int? callType = jsonConvert.convert<int>(json['callType']);
  if (callType != null) {
    caresCustomerDetailDataEmergency.callType = callType;
  }
  final int? callStatus = jsonConvert.convert<int>(json['callStatus']);
  if (callStatus != null) {
    caresCustomerDetailDataEmergency.callStatus = callStatus;
  }
  final int? callDuration = jsonConvert.convert<int>(json['callDuration']);
  if (callDuration != null) {
    caresCustomerDetailDataEmergency.callDuration = callDuration;
  }
  final int? callFailReason = jsonConvert.convert<int>(json['callFailReason']);
  if (callFailReason != null) {
    caresCustomerDetailDataEmergency.callFailReason = callFailReason;
  }
  return caresCustomerDetailDataEmergency;
}

Map<String, dynamic> $CaresCustomerDetailDataEmergencyToJson(
    CaresCustomerDetailDataEmergency entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['phone'] = entity.phone;
  data['callTime'] = entity.callTime;
  data['callType'] = entity.callType;
  data['callStatus'] = entity.callStatus;
  data['callDuration'] = entity.callDuration;
  data['callFailReason'] = entity.callFailReason;
  return data;
}

CaresCustomerDetailDataAlert $CaresCustomerDetailDataAlertFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerDetailDataAlert caresCustomerDetailDataAlert =
      CaresCustomerDetailDataAlert();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    caresCustomerDetailDataAlert.id = id;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    caresCustomerDetailDataAlert.deviceId = deviceId;
  }
  final String? orgId = jsonConvert.convert<String>(json['orgId']);
  if (orgId != null) {
    caresCustomerDetailDataAlert.orgId = orgId;
  }
  final String? groupId = jsonConvert.convert<String>(json['groupId']);
  if (groupId != null) {
    caresCustomerDetailDataAlert.groupId = groupId;
  }
  final int? alarmType = jsonConvert.convert<int>(json['alarmType']);
  if (alarmType != null) {
    caresCustomerDetailDataAlert.alarmType = alarmType;
  }
  final String? alarmTime = jsonConvert.convert<String>(json['alarmTime']);
  if (alarmTime != null) {
    caresCustomerDetailDataAlert.alarmTime = alarmTime;
  }
  final int? alarmLevel = jsonConvert.convert<int>(json['alarmLevel']);
  if (alarmLevel != null) {
    caresCustomerDetailDataAlert.alarmLevel = alarmLevel;
  }
  final int? alarmSource = jsonConvert.convert<int>(json['alarmSource']);
  if (alarmSource != null) {
    caresCustomerDetailDataAlert.alarmSource = alarmSource;
  }
  final int? flag = jsonConvert.convert<int>(json['flag']);
  if (flag != null) {
    caresCustomerDetailDataAlert.flag = flag;
  }
  final int? alarmValue = jsonConvert.convert<int>(json['alarmValue']);
  if (alarmValue != null) {
    caresCustomerDetailDataAlert.alarmValue = alarmValue;
  }
  final String? alarmContent =
      jsonConvert.convert<String>(json['alarmContent']);
  if (alarmContent != null) {
    caresCustomerDetailDataAlert.alarmContent = alarmContent;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    caresCustomerDetailDataAlert.status = status;
  }
  final String? refId = jsonConvert.convert<String>(json['refId']);
  if (refId != null) {
    caresCustomerDetailDataAlert.refId = refId;
  }
  final String? alarmTypeName =
      jsonConvert.convert<String>(json['alarmTypeName']);
  if (alarmTypeName != null) {
    caresCustomerDetailDataAlert.alarmTypeName = alarmTypeName;
  }
  return caresCustomerDetailDataAlert;
}

Map<String, dynamic> $CaresCustomerDetailDataAlertToJson(
    CaresCustomerDetailDataAlert entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['deviceId'] = entity.deviceId;
  data['orgId'] = entity.orgId;
  data['groupId'] = entity.groupId;
  data['alarmType'] = entity.alarmType;
  data['alarmTime'] = entity.alarmTime;
  data['alarmLevel'] = entity.alarmLevel;
  data['alarmSource'] = entity.alarmSource;
  data['flag'] = entity.flag;
  data['alarmValue'] = entity.alarmValue;
  data['alarmContent'] = entity.alarmContent;
  data['status'] = entity.status;
  data['refId'] = entity.refId;
  data['alarmTypeName'] = entity.alarmTypeName;
  return data;
}
