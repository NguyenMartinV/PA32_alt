import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/cares_customer_givers_entity.dart';

CaresCustomerGiversEntity $CaresCustomerGiversEntityFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerGiversEntity caresCustomerGiversEntity =
      CaresCustomerGiversEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    caresCustomerGiversEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    caresCustomerGiversEntity.msg = msg;
  }
  final CaresCustomerGiversData? data =
      jsonConvert.convert<CaresCustomerGiversData>(json['data']);
  if (data != null) {
    caresCustomerGiversEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    caresCustomerGiversEntity.count = count;
  }
  return caresCustomerGiversEntity;
}

Map<String, dynamic> $CaresCustomerGiversEntityToJson(
    CaresCustomerGiversEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  data['count'] = entity.count;
  return data;
}

CaresCustomerGiversData $CaresCustomerGiversDataFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerGiversData caresCustomerGiversData =
      CaresCustomerGiversData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    caresCustomerGiversData.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    caresCustomerGiversData.nickname = nickname;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    caresCustomerGiversData.userName = userName;
  }
  final String? firstName = jsonConvert.convert<String>(json['firstName']);
  if (firstName != null) {
    caresCustomerGiversData.firstName = firstName;
  }
  final String? middleName = jsonConvert.convert<String>(json['middleName']);
  if (middleName != null) {
    caresCustomerGiversData.middleName = middleName;
  }
  final String? lastName = jsonConvert.convert<String>(json['lastName']);
  if (lastName != null) {
    caresCustomerGiversData.lastName = lastName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    caresCustomerGiversData.icon = icon;
  }
  final String? birth = jsonConvert.convert<String>(json['birth']);
  if (birth != null) {
    caresCustomerGiversData.birth = birth;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    caresCustomerGiversData.age = age;
  }
  final int? gender = jsonConvert.convert<int>(json['gender']);
  if (gender != null) {
    caresCustomerGiversData.gender = gender;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    caresCustomerGiversData.updateTime = updateTime;
  }
  final String? lastUpdateTime =
      jsonConvert.convert<String>(json['lastUpdateTime']);
  if (lastUpdateTime != null) {
    caresCustomerGiversData.lastUpdateTime = lastUpdateTime;
  }
  final String? physicalCondition =
      jsonConvert.convert<String>(json['physicalCondition']);
  if (physicalCondition != null) {
    caresCustomerGiversData.physicalCondition = physicalCondition;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    caresCustomerGiversData.deviceId = deviceId;
  }
  final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
  if (deviceNo != null) {
    caresCustomerGiversData.deviceNo = deviceNo;
  }
  final int? giversCount = jsonConvert.convert<int>(json['giversCount']);
  if (giversCount != null) {
    caresCustomerGiversData.giversCount = giversCount;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    caresCustomerGiversData.address = address;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    caresCustomerGiversData.createTime = createTime;
  }
  final List<CaresCustomerGiversDataGps>? gps =
      jsonConvert.convertListNotNull<CaresCustomerGiversDataGps>(json['gps']);
  if (gps != null) {
    caresCustomerGiversData.gps = gps;
  }
  final List<CaresCustomerGiversDataGiver>? giver = jsonConvert
      .convertListNotNull<CaresCustomerGiversDataGiver>(json['giver']);
  if (giver != null) {
    caresCustomerGiversData.giver = giver;
  }
  final List<CaresCustomerGiversDataEmergency>? emergency = jsonConvert
      .convertListNotNull<CaresCustomerGiversDataEmergency>(json['emergency']);
  if (emergency != null) {
    caresCustomerGiversData.emergency = emergency;
  }
  final List<CaresCustomerGiversDataAlert>? alert = jsonConvert
      .convertListNotNull<CaresCustomerGiversDataAlert>(json['alert']);
  if (alert != null) {
    caresCustomerGiversData.alert = alert;
  }
  return caresCustomerGiversData;
}

Map<String, dynamic> $CaresCustomerGiversDataToJson(
    CaresCustomerGiversData entity) {
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
  data['lastUpdateTime'] = entity.lastUpdateTime;
  data['physicalCondition'] = entity.physicalCondition;
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

CaresCustomerGiversDataGps $CaresCustomerGiversDataGpsFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerGiversDataGps caresCustomerGiversDataGps =
      CaresCustomerGiversDataGps();
  final int? batteryPower = jsonConvert.convert<int>(json['batteryPower']);
  if (batteryPower != null) {
    caresCustomerGiversDataGps.batteryPower = batteryPower;
  }
  final String? posTime = jsonConvert.convert<String>(json['posTime']);
  if (posTime != null) {
    caresCustomerGiversDataGps.posTime = posTime;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    caresCustomerGiversDataGps.lat = lat;
  }
  final double? lng = jsonConvert.convert<double>(json['lng']);
  if (lng != null) {
    caresCustomerGiversDataGps.lng = lng;
  }
  final String? pos = jsonConvert.convert<String>(json['pos']);
  if (pos != null) {
    caresCustomerGiversDataGps.pos = pos;
  }
  final bool? fallDetection = jsonConvert.convert<bool>(json['fallDetection']);
  if (fallDetection != null) {
    caresCustomerGiversDataGps.fallDetection = fallDetection;
  }
  return caresCustomerGiversDataGps;
}

Map<String, dynamic> $CaresCustomerGiversDataGpsToJson(
    CaresCustomerGiversDataGps entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['batteryPower'] = entity.batteryPower;
  data['posTime'] = entity.posTime;
  data['lat'] = entity.lat;
  data['lng'] = entity.lng;
  data['pos'] = entity.pos;
  data['fallDetection'] = entity.fallDetection;
  return data;
}

CaresCustomerGiversDataGiver $CaresCustomerGiversDataGiverFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerGiversDataGiver caresCustomerGiversDataGiver =
      CaresCustomerGiversDataGiver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    caresCustomerGiversDataGiver.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    caresCustomerGiversDataGiver.nickname = nickname;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    caresCustomerGiversDataGiver.phone = phone;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    caresCustomerGiversDataGiver.email = email;
  }
  final String? regTime = jsonConvert.convert<String>(json['regTime']);
  if (regTime != null) {
    caresCustomerGiversDataGiver.regTime = regTime;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    caresCustomerGiversDataGiver.icon = icon;
  }
  final int? caresCount = jsonConvert.convert<int>(json['caresCount']);
  if (caresCount != null) {
    caresCustomerGiversDataGiver.caresCount = caresCount;
  }
  return caresCustomerGiversDataGiver;
}

Map<String, dynamic> $CaresCustomerGiversDataGiverToJson(
    CaresCustomerGiversDataGiver entity) {
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

CaresCustomerGiversDataEmergency $CaresCustomerGiversDataEmergencyFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerGiversDataEmergency caresCustomerGiversDataEmergency =
      CaresCustomerGiversDataEmergency();
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    caresCustomerGiversDataEmergency.phone = phone;
  }
  final String? callTime = jsonConvert.convert<String>(json['callTime']);
  if (callTime != null) {
    caresCustomerGiversDataEmergency.callTime = callTime;
  }
  final int? callType = jsonConvert.convert<int>(json['callType']);
  if (callType != null) {
    caresCustomerGiversDataEmergency.callType = callType;
  }
  final int? callStatus = jsonConvert.convert<int>(json['callStatus']);
  if (callStatus != null) {
    caresCustomerGiversDataEmergency.callStatus = callStatus;
  }
  final int? callDuration = jsonConvert.convert<int>(json['callDuration']);
  if (callDuration != null) {
    caresCustomerGiversDataEmergency.callDuration = callDuration;
  }
  final int? callFailReason = jsonConvert.convert<int>(json['callFailReason']);
  if (callFailReason != null) {
    caresCustomerGiversDataEmergency.callFailReason = callFailReason;
  }
  return caresCustomerGiversDataEmergency;
}

Map<String, dynamic> $CaresCustomerGiversDataEmergencyToJson(
    CaresCustomerGiversDataEmergency entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['phone'] = entity.phone;
  data['callTime'] = entity.callTime;
  data['callType'] = entity.callType;
  data['callStatus'] = entity.callStatus;
  data['callDuration'] = entity.callDuration;
  data['callFailReason'] = entity.callFailReason;
  return data;
}

CaresCustomerGiversDataAlert $CaresCustomerGiversDataAlertFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerGiversDataAlert caresCustomerGiversDataAlert =
      CaresCustomerGiversDataAlert();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    caresCustomerGiversDataAlert.id = id;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    caresCustomerGiversDataAlert.deviceId = deviceId;
  }
  final String? orgId = jsonConvert.convert<String>(json['orgId']);
  if (orgId != null) {
    caresCustomerGiversDataAlert.orgId = orgId;
  }
  final String? groupId = jsonConvert.convert<String>(json['groupId']);
  if (groupId != null) {
    caresCustomerGiversDataAlert.groupId = groupId;
  }
  final int? alarmType = jsonConvert.convert<int>(json['alarmType']);
  if (alarmType != null) {
    caresCustomerGiversDataAlert.alarmType = alarmType;
  }
  final String? alarmTime = jsonConvert.convert<String>(json['alarmTime']);
  if (alarmTime != null) {
    caresCustomerGiversDataAlert.alarmTime = alarmTime;
  }
  final int? alarmLevel = jsonConvert.convert<int>(json['alarmLevel']);
  if (alarmLevel != null) {
    caresCustomerGiversDataAlert.alarmLevel = alarmLevel;
  }
  final int? alarmSource = jsonConvert.convert<int>(json['alarmSource']);
  if (alarmSource != null) {
    caresCustomerGiversDataAlert.alarmSource = alarmSource;
  }
  final int? flag = jsonConvert.convert<int>(json['flag']);
  if (flag != null) {
    caresCustomerGiversDataAlert.flag = flag;
  }
  final int? alarmValue = jsonConvert.convert<int>(json['alarmValue']);
  if (alarmValue != null) {
    caresCustomerGiversDataAlert.alarmValue = alarmValue;
  }
  final String? alarmContent =
      jsonConvert.convert<String>(json['alarmContent']);
  if (alarmContent != null) {
    caresCustomerGiversDataAlert.alarmContent = alarmContent;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    caresCustomerGiversDataAlert.status = status;
  }
  final String? refId = jsonConvert.convert<String>(json['refId']);
  if (refId != null) {
    caresCustomerGiversDataAlert.refId = refId;
  }
  final String? alarmTypeName =
      jsonConvert.convert<String>(json['alarmTypeName']);
  if (alarmTypeName != null) {
    caresCustomerGiversDataAlert.alarmTypeName = alarmTypeName;
  }
  return caresCustomerGiversDataAlert;
}

Map<String, dynamic> $CaresCustomerGiversDataAlertToJson(
    CaresCustomerGiversDataAlert entity) {
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
