import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/cares_customer_list_entity.dart';

CaresCustomerListEntity $CaresCustomerListEntityFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerListEntity caresCustomerListEntity =
      CaresCustomerListEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    caresCustomerListEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    caresCustomerListEntity.msg = msg;
  }
  final List<CaresCustomerListData>? data =
      jsonConvert.convertListNotNull<CaresCustomerListData>(json['data']);
  if (data != null) {
    caresCustomerListEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    caresCustomerListEntity.count = count;
  }
  return caresCustomerListEntity;
}

Map<String, dynamic> $CaresCustomerListEntityToJson(
    CaresCustomerListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['count'] = entity.count;
  return data;
}

CaresCustomerListData $CaresCustomerListDataFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerListData caresCustomerListData = CaresCustomerListData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    caresCustomerListData.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    caresCustomerListData.nickname = nickname;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    caresCustomerListData.userName = userName;
  }
  final String? firstName = jsonConvert.convert<String>(json['firstName']);
  if (firstName != null) {
    caresCustomerListData.firstName = firstName;
  }
  final String? middleName = jsonConvert.convert<String>(json['middleName']);
  if (middleName != null) {
    caresCustomerListData.middleName = middleName;
  }
  final String? lastName = jsonConvert.convert<String>(json['lastName']);
  if (lastName != null) {
    caresCustomerListData.lastName = lastName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    caresCustomerListData.icon = icon;
  }
  final String? birth = jsonConvert.convert<String>(json['birth']);
  if (birth != null) {
    caresCustomerListData.birth = birth;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    caresCustomerListData.age = age;
  }
  final int? gender = jsonConvert.convert<int>(json['gender']);
  if (gender != null) {
    caresCustomerListData.gender = gender;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    caresCustomerListData.updateTime = updateTime;
  }
  final String? lastUpdateTime =
      jsonConvert.convert<String>(json['lastUpdateTime']);
  if (lastUpdateTime != null) {
    caresCustomerListData.lastUpdateTime = lastUpdateTime;
  }
  final String? physicalCondition =
      jsonConvert.convert<String>(json['physicalCondition']);
  if (physicalCondition != null) {
    caresCustomerListData.physicalCondition = physicalCondition;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    caresCustomerListData.deviceId = deviceId;
  }
  final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
  if (deviceNo != null) {
    caresCustomerListData.deviceNo = deviceNo;
  }
  final int? giversCount = jsonConvert.convert<int>(json['giversCount']);
  if (giversCount != null) {
    caresCustomerListData.giversCount = giversCount;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    caresCustomerListData.address = address;
  }
  final String? alarmContent =
      jsonConvert.convert<String>(json['alarmContent']);
  if (alarmContent != null) {
    caresCustomerListData.alarmContent = alarmContent;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    caresCustomerListData.createTime = createTime;
  }
  final List<CaresCustomerListDataGps>? gps =
      jsonConvert.convertListNotNull<CaresCustomerListDataGps>(json['gps']);
  if (gps != null) {
    caresCustomerListData.gps = gps;
  }
  final List<CaresCustomerListDataGiver>? giver =
      jsonConvert.convertListNotNull<CaresCustomerListDataGiver>(json['giver']);
  if (giver != null) {
    caresCustomerListData.giver = giver;
  }
  final List<dynamic>? emergency =
      jsonConvert.convertListNotNull<dynamic>(json['emergency']);
  if (emergency != null) {
    caresCustomerListData.emergency = emergency;
  }
  final List<CaresCustomerListDataAlert>? alert =
      jsonConvert.convertListNotNull<CaresCustomerListDataAlert>(json['alert']);
  if (alert != null) {
    caresCustomerListData.alert = alert;
  }
  final String? alertTime = jsonConvert.convert<String>(json['alertTime']);
  if (alertTime != null) {
    caresCustomerListData.alertTime = alertTime;
  }
  final String? callTime = jsonConvert.convert<String>(json['callTime']);
  if (callTime != null) {
    caresCustomerListData.callTime = callTime;
  }
  final String? gpsTime = jsonConvert.convert<String>(json['gpsTime']);
  if (gpsTime != null) {
    caresCustomerListData.gpsTime = gpsTime;
  }
  final int? callType = jsonConvert.convert<int>(json['callType']);
  if (callType != null) {
    caresCustomerListData.callType = callType;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    caresCustomerListData.phone = phone;
  }
  final String? callOutTime = jsonConvert.convert<String>(json['callOutTime']);
  if (callOutTime != null) {
    caresCustomerListData.callOutTime = callOutTime;
  }
  final String? callComeTime =
      jsonConvert.convert<String>(json['callComeTime']);
  if (callComeTime != null) {
    caresCustomerListData.callComeTime = callComeTime;
  }
  return caresCustomerListData;
}

Map<String, dynamic> $CaresCustomerListDataToJson(
    CaresCustomerListData entity) {
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
  data['alarmContent'] = entity.alarmContent;
  data['createTime'] = entity.createTime;
  data['gps'] = entity.gps?.map((v) => v.toJson()).toList();
  data['giver'] = entity.giver?.map((v) => v.toJson()).toList();
  data['emergency'] = entity.emergency;
  data['alert'] = entity.alert?.map((v) => v.toJson()).toList();
  data['alertTime'] = entity.alertTime;
  data['callTime'] = entity.callTime;
  data['gpsTime'] = entity.gpsTime;
  data['callType'] = entity.callType;
  data['phone'] = entity.phone;
  data['callOutTime'] = entity.callOutTime;
  data['callComeTime'] = entity.callComeTime;
  return data;
}

CaresCustomerListDataGps $CaresCustomerListDataGpsFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerListDataGps caresCustomerListDataGps =
      CaresCustomerListDataGps();
  final int? batteryPower = jsonConvert.convert<int>(json['batteryPower']);
  if (batteryPower != null) {
    caresCustomerListDataGps.batteryPower = batteryPower;
  }
  final String? posTime = jsonConvert.convert<String>(json['posTime']);
  if (posTime != null) {
    caresCustomerListDataGps.posTime = posTime;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    caresCustomerListDataGps.lat = lat;
  }
  final double? lng = jsonConvert.convert<double>(json['lng']);
  if (lng != null) {
    caresCustomerListDataGps.lng = lng;
  }
  final String? pos = jsonConvert.convert<String>(json['pos']);
  if (pos != null) {
    caresCustomerListDataGps.pos = pos;
  }
  final bool? fallDetection = jsonConvert.convert<bool>(json['fallDetection']);
  if (fallDetection != null) {
    caresCustomerListDataGps.fallDetection = fallDetection;
  }
  return caresCustomerListDataGps;
}

Map<String, dynamic> $CaresCustomerListDataGpsToJson(
    CaresCustomerListDataGps entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['batteryPower'] = entity.batteryPower;
  data['posTime'] = entity.posTime;
  data['lat'] = entity.lat;
  data['lng'] = entity.lng;
  data['pos'] = entity.pos;
  data['fallDetection'] = entity.fallDetection;
  return data;
}

CaresCustomerListDataGiver $CaresCustomerListDataGiverFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerListDataGiver caresCustomerListDataGiver =
      CaresCustomerListDataGiver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    caresCustomerListDataGiver.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    caresCustomerListDataGiver.nickname = nickname;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    caresCustomerListDataGiver.phone = phone;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    caresCustomerListDataGiver.email = email;
  }
  final String? regTime = jsonConvert.convert<String>(json['regTime']);
  if (regTime != null) {
    caresCustomerListDataGiver.regTime = regTime;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    caresCustomerListDataGiver.icon = icon;
  }
  final int? caresCount = jsonConvert.convert<int>(json['caresCount']);
  if (caresCount != null) {
    caresCustomerListDataGiver.caresCount = caresCount;
  }
  return caresCustomerListDataGiver;
}

Map<String, dynamic> $CaresCustomerListDataGiverToJson(
    CaresCustomerListDataGiver entity) {
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

CaresCustomerListDataAlert $CaresCustomerListDataAlertFromJson(
    Map<String, dynamic> json) {
  final CaresCustomerListDataAlert caresCustomerListDataAlert =
      CaresCustomerListDataAlert();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    caresCustomerListDataAlert.id = id;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    caresCustomerListDataAlert.deviceId = deviceId;
  }
  final String? orgId = jsonConvert.convert<String>(json['orgId']);
  if (orgId != null) {
    caresCustomerListDataAlert.orgId = orgId;
  }
  final String? groupId = jsonConvert.convert<String>(json['groupId']);
  if (groupId != null) {
    caresCustomerListDataAlert.groupId = groupId;
  }
  final int? alarmType = jsonConvert.convert<int>(json['alarmType']);
  if (alarmType != null) {
    caresCustomerListDataAlert.alarmType = alarmType;
  }
  final String? alarmTime = jsonConvert.convert<String>(json['alarmTime']);
  if (alarmTime != null) {
    caresCustomerListDataAlert.alarmTime = alarmTime;
  }
  final int? alarmLevel = jsonConvert.convert<int>(json['alarmLevel']);
  if (alarmLevel != null) {
    caresCustomerListDataAlert.alarmLevel = alarmLevel;
  }
  final int? alarmSource = jsonConvert.convert<int>(json['alarmSource']);
  if (alarmSource != null) {
    caresCustomerListDataAlert.alarmSource = alarmSource;
  }
  final int? flag = jsonConvert.convert<int>(json['flag']);
  if (flag != null) {
    caresCustomerListDataAlert.flag = flag;
  }
  final int? alarmValue = jsonConvert.convert<int>(json['alarmValue']);
  if (alarmValue != null) {
    caresCustomerListDataAlert.alarmValue = alarmValue;
  }
  final String? alarmContent =
      jsonConvert.convert<String>(json['alarmContent']);
  if (alarmContent != null) {
    caresCustomerListDataAlert.alarmContent = alarmContent;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    caresCustomerListDataAlert.status = status;
  }
  final String? refId = jsonConvert.convert<String>(json['refId']);
  if (refId != null) {
    caresCustomerListDataAlert.refId = refId;
  }
  final String? alarmTypeName =
      jsonConvert.convert<String>(json['alarmTypeName']);
  if (alarmTypeName != null) {
    caresCustomerListDataAlert.alarmTypeName = alarmTypeName;
  }
  return caresCustomerListDataAlert;
}

Map<String, dynamic> $CaresCustomerListDataAlertToJson(
    CaresCustomerListDataAlert entity) {
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
