import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/customer_list_entity.dart';

CustomerListEntity $CustomerListEntityFromJson(Map<String, dynamic> json) {
  final CustomerListEntity customerListEntity = CustomerListEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    customerListEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    customerListEntity.msg = msg;
  }
  final List<CustomerListData>? data =
      jsonConvert.convertListNotNull<CustomerListData>(json['data']);
  if (data != null) {
    customerListEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    customerListEntity.count = count;
  }
  return customerListEntity;
}

Map<String, dynamic> $CustomerListEntityToJson(CustomerListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['count'] = entity.count;
  return data;
}

CustomerListData $CustomerListDataFromJson(Map<String, dynamic> json) {
  final CustomerListData customerListData = CustomerListData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerListData.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    customerListData.nickname = nickname;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    customerListData.userName = userName;
  }
  final String? firstName = jsonConvert.convert<String>(json['firstName']);
  if (firstName != null) {
    customerListData.firstName = firstName;
  }
  final String? middleName = jsonConvert.convert<String>(json['middleName']);
  if (middleName != null) {
    customerListData.middleName = middleName;
  }
  final String? lastName = jsonConvert.convert<String>(json['lastName']);
  if (lastName != null) {
    customerListData.lastName = lastName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    customerListData.icon = icon;
  }
  final String? birth = jsonConvert.convert<String>(json['birth']);
  if (birth != null) {
    customerListData.birth = birth;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    customerListData.age = age;
  }
  final int? gender = jsonConvert.convert<int>(json['gender']);
  if (gender != null) {
    customerListData.gender = gender;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    customerListData.updateTime = updateTime;
  }
  final String? lastUpdateTime =
      jsonConvert.convert<String>(json['lastUpdateTime']);
  if (lastUpdateTime != null) {
    customerListData.lastUpdateTime = lastUpdateTime;
  }
  final String? physicalCondition =
      jsonConvert.convert<String>(json['physicalCondition']);
  if (physicalCondition != null) {
    customerListData.physicalCondition = physicalCondition;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    customerListData.deviceId = deviceId;
  }
  final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
  if (deviceNo != null) {
    customerListData.deviceNo = deviceNo;
  }
  final int? giversCount = jsonConvert.convert<int>(json['giversCount']);
  if (giversCount != null) {
    customerListData.giversCount = giversCount;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    customerListData.address = address;
  }
  final String? alarmContent =
      jsonConvert.convert<String>(json['alarmContent']);
  if (alarmContent != null) {
    customerListData.alarmContent = alarmContent;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    customerListData.createTime = createTime;
  }
  final List<CustomerListDataGps>? gps =
      jsonConvert.convertListNotNull<CustomerListDataGps>(json['gps']);
  if (gps != null) {
    customerListData.gps = gps;
  }
  final List<CustomerListDataGiver>? giver =
      jsonConvert.convertListNotNull<CustomerListDataGiver>(json['giver']);
  if (giver != null) {
    customerListData.giver = giver;
  }
  final List<dynamic>? emergency =
      jsonConvert.convertListNotNull<dynamic>(json['emergency']);
  if (emergency != null) {
    customerListData.emergency = emergency;
  }
  final List<CustomerListDataAlert>? alert =
      jsonConvert.convertListNotNull<CustomerListDataAlert>(json['alert']);
  if (alert != null) {
    customerListData.alert = alert;
  }
  final String? alertTime = jsonConvert.convert<String>(json['alertTime']);
  if (alertTime != null) {
    customerListData.alertTime = alertTime;
  }
  final String? callTime = jsonConvert.convert<String>(json['callTime']);
  if (callTime != null) {
    customerListData.callTime = callTime;
  }
  final String? gpsTime = jsonConvert.convert<String>(json['gpsTime']);
  if (gpsTime != null) {
    customerListData.gpsTime = gpsTime;
  }
  final int? callType = jsonConvert.convert<int>(json['callType']);
  if (callType != null) {
    customerListData.callType = callType;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    customerListData.phone = phone;
  }
  final String? callOutTime = jsonConvert.convert<String>(json['callOutTime']);
  if (callOutTime != null) {
    customerListData.callOutTime = callOutTime;
  }
  final String? callComeTime =
      jsonConvert.convert<String>(json['callComeTime']);
  if (callComeTime != null) {
    customerListData.callComeTime = callComeTime;
  }
  return customerListData;
}

Map<String, dynamic> $CustomerListDataToJson(CustomerListData entity) {
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

CustomerListDataGps $CustomerListDataGpsFromJson(Map<String, dynamic> json) {
  final CustomerListDataGps customerListDataGps = CustomerListDataGps();
  final int? batteryPower = jsonConvert.convert<int>(json['batteryPower']);
  if (batteryPower != null) {
    customerListDataGps.batteryPower = batteryPower;
  }
  final String? posTime = jsonConvert.convert<String>(json['posTime']);
  if (posTime != null) {
    customerListDataGps.posTime = posTime;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    customerListDataGps.lat = lat;
  }
  final double? lng = jsonConvert.convert<double>(json['lng']);
  if (lng != null) {
    customerListDataGps.lng = lng;
  }
  final String? pos = jsonConvert.convert<String>(json['pos']);
  if (pos != null) {
    customerListDataGps.pos = pos;
  }
  final bool? fallDetection = jsonConvert.convert<bool>(json['fallDetection']);
  if (fallDetection != null) {
    customerListDataGps.fallDetection = fallDetection;
  }
  return customerListDataGps;
}

Map<String, dynamic> $CustomerListDataGpsToJson(CustomerListDataGps entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['batteryPower'] = entity.batteryPower;
  data['posTime'] = entity.posTime;
  data['lat'] = entity.lat;
  data['lng'] = entity.lng;
  data['pos'] = entity.pos;
  data['fallDetection'] = entity.fallDetection;
  return data;
}

CustomerListDataGiver $CustomerListDataGiverFromJson(
    Map<String, dynamic> json) {
  final CustomerListDataGiver customerListDataGiver = CustomerListDataGiver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerListDataGiver.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    customerListDataGiver.nickname = nickname;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    customerListDataGiver.phone = phone;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    customerListDataGiver.email = email;
  }
  final String? regTime = jsonConvert.convert<String>(json['regTime']);
  if (regTime != null) {
    customerListDataGiver.regTime = regTime;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    customerListDataGiver.icon = icon;
  }
  final int? caresCount = jsonConvert.convert<int>(json['caresCount']);
  if (caresCount != null) {
    customerListDataGiver.caresCount = caresCount;
  }
  return customerListDataGiver;
}

Map<String, dynamic> $CustomerListDataGiverToJson(
    CustomerListDataGiver entity) {
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

CustomerListDataAlert $CustomerListDataAlertFromJson(
    Map<String, dynamic> json) {
  final CustomerListDataAlert customerListDataAlert = CustomerListDataAlert();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerListDataAlert.id = id;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    customerListDataAlert.deviceId = deviceId;
  }
  final String? orgId = jsonConvert.convert<String>(json['orgId']);
  if (orgId != null) {
    customerListDataAlert.orgId = orgId;
  }
  final String? groupId = jsonConvert.convert<String>(json['groupId']);
  if (groupId != null) {
    customerListDataAlert.groupId = groupId;
  }
  final int? alarmType = jsonConvert.convert<int>(json['alarmType']);
  if (alarmType != null) {
    customerListDataAlert.alarmType = alarmType;
  }
  final String? alarmTime = jsonConvert.convert<String>(json['alarmTime']);
  if (alarmTime != null) {
    customerListDataAlert.alarmTime = alarmTime;
  }
  final int? alarmLevel = jsonConvert.convert<int>(json['alarmLevel']);
  if (alarmLevel != null) {
    customerListDataAlert.alarmLevel = alarmLevel;
  }
  final int? alarmSource = jsonConvert.convert<int>(json['alarmSource']);
  if (alarmSource != null) {
    customerListDataAlert.alarmSource = alarmSource;
  }
  final int? flag = jsonConvert.convert<int>(json['flag']);
  if (flag != null) {
    customerListDataAlert.flag = flag;
  }
  final int? alarmValue = jsonConvert.convert<int>(json['alarmValue']);
  if (alarmValue != null) {
    customerListDataAlert.alarmValue = alarmValue;
  }
  final String? alarmContent =
      jsonConvert.convert<String>(json['alarmContent']);
  if (alarmContent != null) {
    customerListDataAlert.alarmContent = alarmContent;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    customerListDataAlert.status = status;
  }
  final String? refId = jsonConvert.convert<String>(json['refId']);
  if (refId != null) {
    customerListDataAlert.refId = refId;
  }
  final String? alarmTypeName =
      jsonConvert.convert<String>(json['alarmTypeName']);
  if (alarmTypeName != null) {
    customerListDataAlert.alarmTypeName = alarmTypeName;
  }
  return customerListDataAlert;
}

Map<String, dynamic> $CustomerListDataAlertToJson(
    CustomerListDataAlert entity) {
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
