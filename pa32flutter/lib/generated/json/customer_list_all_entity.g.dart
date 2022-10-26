import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/customer_list_all_entity.dart';

CustomerListAllEntity $CustomerListAllEntityFromJson(
    Map<String, dynamic> json) {
  final CustomerListAllEntity customerListAllEntity = CustomerListAllEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    customerListAllEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    customerListAllEntity.msg = msg;
  }
  final List<CustomerListAllData>? data =
      jsonConvert.convertListNotNull<CustomerListAllData>(json['data']);
  if (data != null) {
    customerListAllEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    customerListAllEntity.count = count;
  }
  return customerListAllEntity;
}

Map<String, dynamic> $CustomerListAllEntityToJson(
    CustomerListAllEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['count'] = entity.count;
  return data;
}

CustomerListAllData $CustomerListAllDataFromJson(Map<String, dynamic> json) {
  final CustomerListAllData customerListAllData = CustomerListAllData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerListAllData.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    customerListAllData.nickname = nickname;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    customerListAllData.userName = userName;
  }
  final String? firstName = jsonConvert.convert<String>(json['firstName']);
  if (firstName != null) {
    customerListAllData.firstName = firstName;
  }
  final String? middleName = jsonConvert.convert<String>(json['middleName']);
  if (middleName != null) {
    customerListAllData.middleName = middleName;
  }
  final String? lastName = jsonConvert.convert<String>(json['lastName']);
  if (lastName != null) {
    customerListAllData.lastName = lastName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    customerListAllData.icon = icon;
  }
  final String? birth = jsonConvert.convert<String>(json['birth']);
  if (birth != null) {
    customerListAllData.birth = birth;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    customerListAllData.age = age;
  }
  final int? gender = jsonConvert.convert<int>(json['gender']);
  if (gender != null) {
    customerListAllData.gender = gender;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    customerListAllData.updateTime = updateTime;
  }
  final String? alertTime = jsonConvert.convert<String>(json['alertTime']);
  if (alertTime != null) {
    customerListAllData.alertTime = alertTime;
  }
  final String? callTime = jsonConvert.convert<String>(json['callTime']);
  if (callTime != null) {
    customerListAllData.callTime = callTime;
  }
  final String? gpsTime = jsonConvert.convert<String>(json['gpsTime']);
  if (gpsTime != null) {
    customerListAllData.gpsTime = gpsTime;
  }
  final String? lastUpdateTime =
      jsonConvert.convert<String>(json['lastUpdateTime']);
  if (lastUpdateTime != null) {
    customerListAllData.lastUpdateTime = lastUpdateTime;
  }
  final String? physicalCondition =
      jsonConvert.convert<String>(json['physicalCondition']);
  if (physicalCondition != null) {
    customerListAllData.physicalCondition = physicalCondition;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    customerListAllData.deviceId = deviceId;
  }
  final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
  if (deviceNo != null) {
    customerListAllData.deviceNo = deviceNo;
  }
  final int? giversCount = jsonConvert.convert<int>(json['giversCount']);
  if (giversCount != null) {
    customerListAllData.giversCount = giversCount;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    customerListAllData.address = address;
  }
  final int? callType = jsonConvert.convert<int>(json['callType']);
  if (callType != null) {
    customerListAllData.callType = callType;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    customerListAllData.phone = phone;
  }
  final String? alarmContent =
      jsonConvert.convert<String>(json['alarmContent']);
  if (alarmContent != null) {
    customerListAllData.alarmContent = alarmContent;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    customerListAllData.createTime = createTime;
  }
  final String? callOutTime = jsonConvert.convert<String>(json['callOutTime']);
  if (callOutTime != null) {
    customerListAllData.callOutTime = callOutTime;
  } else {
    customerListAllData.callOutTime = '';
  }
  final String? callComeTime =
      jsonConvert.convert<String>(json['callComeTime']);
  if (callComeTime != null) {
    customerListAllData.callComeTime = callComeTime;
  } else {
    customerListAllData.callComeTime = '';
  }
  final List<CustomerListAllDataGps>? gps =
      jsonConvert.convertListNotNull<CustomerListAllDataGps>(json['gps']);
  if (gps != null) {
    customerListAllData.gps = gps;
  }
  final List<CustomerListAllDataGiver>? giver =
      jsonConvert.convertListNotNull<CustomerListAllDataGiver>(json['giver']);
  if (giver != null) {
    customerListAllData.giver = giver;
  }
  final List<CustomerListAllDataEmergency>? emergency = jsonConvert
      .convertListNotNull<CustomerListAllDataEmergency>(json['emergency']);
  if (emergency != null) {
    customerListAllData.emergency = emergency;
  }
  final List<CustomerListAllDataAlert>? alert =
      jsonConvert.convertListNotNull<CustomerListAllDataAlert>(json['alert']);
  if (alert != null) {
    customerListAllData.alert = alert;
  }
  return customerListAllData;
}

Map<String, dynamic> $CustomerListAllDataToJson(CustomerListAllData entity) {
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
  data['callType'] = entity.callType;
  data['phone'] = entity.phone;
  data['alarmContent'] = entity.alarmContent;
  data['createTime'] = entity.createTime;
  data['callOutTime'] = entity.callOutTime;
  data['callComeTime'] = entity.callComeTime;
  data['gps'] = entity.gps?.map((v) => v.toJson()).toList();
  data['giver'] = entity.giver?.map((v) => v.toJson()).toList();
  data['emergency'] = entity.emergency?.map((v) => v.toJson()).toList();
  data['alert'] = entity.alert?.map((v) => v.toJson()).toList();
  return data;
}

CustomerListAllDataGps $CustomerListAllDataGpsFromJson(
    Map<String, dynamic> json) {
  final CustomerListAllDataGps customerListAllDataGps =
      CustomerListAllDataGps();
  final int? batteryPower = jsonConvert.convert<int>(json['batteryPower']);
  if (batteryPower != null) {
    customerListAllDataGps.batteryPower = batteryPower;
  }
  final String? posTime = jsonConvert.convert<String>(json['posTime']);
  if (posTime != null) {
    customerListAllDataGps.posTime = posTime;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    customerListAllDataGps.lat = lat;
  }
  final double? lng = jsonConvert.convert<double>(json['lng']);
  if (lng != null) {
    customerListAllDataGps.lng = lng;
  }
  final String? pos = jsonConvert.convert<String>(json['pos']);
  if (pos != null) {
    customerListAllDataGps.pos = pos;
  }
  final bool? fallDetection = jsonConvert.convert<bool>(json['fallDetection']);
  if (fallDetection != null) {
    customerListAllDataGps.fallDetection = fallDetection;
  }
  return customerListAllDataGps;
}

Map<String, dynamic> $CustomerListAllDataGpsToJson(
    CustomerListAllDataGps entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['batteryPower'] = entity.batteryPower;
  data['posTime'] = entity.posTime;
  data['lat'] = entity.lat;
  data['lng'] = entity.lng;
  data['pos'] = entity.pos;
  data['fallDetection'] = entity.fallDetection;
  return data;
}

CustomerListAllDataGiver $CustomerListAllDataGiverFromJson(
    Map<String, dynamic> json) {
  final CustomerListAllDataGiver customerListAllDataGiver =
      CustomerListAllDataGiver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerListAllDataGiver.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    customerListAllDataGiver.nickname = nickname;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    customerListAllDataGiver.phone = phone;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    customerListAllDataGiver.email = email;
  }
  final String? regTime = jsonConvert.convert<String>(json['regTime']);
  if (regTime != null) {
    customerListAllDataGiver.regTime = regTime;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    customerListAllDataGiver.icon = icon;
  }
  final int? caresCount = jsonConvert.convert<int>(json['caresCount']);
  if (caresCount != null) {
    customerListAllDataGiver.caresCount = caresCount;
  }
  return customerListAllDataGiver;
}

Map<String, dynamic> $CustomerListAllDataGiverToJson(
    CustomerListAllDataGiver entity) {
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

CustomerListAllDataEmergency $CustomerListAllDataEmergencyFromJson(
    Map<String, dynamic> json) {
  final CustomerListAllDataEmergency customerListAllDataEmergency =
      CustomerListAllDataEmergency();
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    customerListAllDataEmergency.phone = phone;
  }
  final String? callTime = jsonConvert.convert<String>(json['callTime']);
  if (callTime != null) {
    customerListAllDataEmergency.callTime = callTime;
  }
  final int? callType = jsonConvert.convert<int>(json['callType']);
  if (callType != null) {
    customerListAllDataEmergency.callType = callType;
  }
  final int? callStatus = jsonConvert.convert<int>(json['callStatus']);
  if (callStatus != null) {
    customerListAllDataEmergency.callStatus = callStatus;
  }
  final int? callDuration = jsonConvert.convert<int>(json['callDuration']);
  if (callDuration != null) {
    customerListAllDataEmergency.callDuration = callDuration;
  }
  final int? callFailReason = jsonConvert.convert<int>(json['callFailReason']);
  if (callFailReason != null) {
    customerListAllDataEmergency.callFailReason = callFailReason;
  }
  return customerListAllDataEmergency;
}

Map<String, dynamic> $CustomerListAllDataEmergencyToJson(
    CustomerListAllDataEmergency entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['phone'] = entity.phone;
  data['callTime'] = entity.callTime;
  data['callType'] = entity.callType;
  data['callStatus'] = entity.callStatus;
  data['callDuration'] = entity.callDuration;
  data['callFailReason'] = entity.callFailReason;
  return data;
}

CustomerListAllDataAlert $CustomerListAllDataAlertFromJson(
    Map<String, dynamic> json) {
  final CustomerListAllDataAlert customerListAllDataAlert =
      CustomerListAllDataAlert();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerListAllDataAlert.id = id;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    customerListAllDataAlert.deviceId = deviceId;
  }
  final String? orgId = jsonConvert.convert<String>(json['orgId']);
  if (orgId != null) {
    customerListAllDataAlert.orgId = orgId;
  }
  final String? groupId = jsonConvert.convert<String>(json['groupId']);
  if (groupId != null) {
    customerListAllDataAlert.groupId = groupId;
  }
  final int? alarmType = jsonConvert.convert<int>(json['alarmType']);
  if (alarmType != null) {
    customerListAllDataAlert.alarmType = alarmType;
  }
  final String? alarmTime = jsonConvert.convert<String>(json['alarmTime']);
  if (alarmTime != null) {
    customerListAllDataAlert.alarmTime = alarmTime;
  }
  final int? alarmLevel = jsonConvert.convert<int>(json['alarmLevel']);
  if (alarmLevel != null) {
    customerListAllDataAlert.alarmLevel = alarmLevel;
  }
  final int? alarmSource = jsonConvert.convert<int>(json['alarmSource']);
  if (alarmSource != null) {
    customerListAllDataAlert.alarmSource = alarmSource;
  }
  final int? flag = jsonConvert.convert<int>(json['flag']);
  if (flag != null) {
    customerListAllDataAlert.flag = flag;
  }
  final int? alarmValue = jsonConvert.convert<int>(json['alarmValue']);
  if (alarmValue != null) {
    customerListAllDataAlert.alarmValue = alarmValue;
  }
  final String? alarmContent =
      jsonConvert.convert<String>(json['alarmContent']);
  if (alarmContent != null) {
    customerListAllDataAlert.alarmContent = alarmContent;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    customerListAllDataAlert.status = status;
  }
  final double? lng = jsonConvert.convert<double>(json['lng']);
  if (lng != null) {
    customerListAllDataAlert.lng = lng;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    customerListAllDataAlert.lat = lat;
  }
  final String? refId = jsonConvert.convert<String>(json['refId']);
  if (refId != null) {
    customerListAllDataAlert.refId = refId;
  }
  final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
  if (deviceNo != null) {
    customerListAllDataAlert.deviceNo = deviceNo;
  }
  final String? alarmTypeName =
      jsonConvert.convert<String>(json['alarmTypeName']);
  if (alarmTypeName != null) {
    customerListAllDataAlert.alarmTypeName = alarmTypeName;
  }
  return customerListAllDataAlert;
}

Map<String, dynamic> $CustomerListAllDataAlertToJson(
    CustomerListAllDataAlert entity) {
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
  data['lng'] = entity.lng;
  data['lat'] = entity.lat;
  data['refId'] = entity.refId;
  data['deviceNo'] = entity.deviceNo;
  data['alarmTypeName'] = entity.alarmTypeName;
  return data;
}
