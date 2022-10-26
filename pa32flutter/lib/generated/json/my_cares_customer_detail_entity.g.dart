import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/my_cares_customer_detail_entity.dart';

MyCaresCustomerDetailEntity $MyCaresCustomerDetailEntityFromJson(
    Map<String, dynamic> json) {
  final MyCaresCustomerDetailEntity myCaresCustomerDetailEntity =
      MyCaresCustomerDetailEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    myCaresCustomerDetailEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    myCaresCustomerDetailEntity.msg = msg;
  }
  final MyCaresCustomerDetailData? data =
      jsonConvert.convert<MyCaresCustomerDetailData>(json['data']);
  if (data != null) {
    myCaresCustomerDetailEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    myCaresCustomerDetailEntity.count = count;
  }
  return myCaresCustomerDetailEntity;
}

Map<String, dynamic> $MyCaresCustomerDetailEntityToJson(
    MyCaresCustomerDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  data['count'] = entity.count;
  return data;
}

MyCaresCustomerDetailData $MyCaresCustomerDetailDataFromJson(
    Map<String, dynamic> json) {
  final MyCaresCustomerDetailData myCaresCustomerDetailData =
      MyCaresCustomerDetailData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    myCaresCustomerDetailData.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    myCaresCustomerDetailData.nickname = nickname;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    myCaresCustomerDetailData.userName = userName;
  }
  final String? firstName = jsonConvert.convert<String>(json['firstName']);
  if (firstName != null) {
    myCaresCustomerDetailData.firstName = firstName;
  }
  final String? middleName = jsonConvert.convert<String>(json['middleName']);
  if (middleName != null) {
    myCaresCustomerDetailData.middleName = middleName;
  }
  final String? lastName = jsonConvert.convert<String>(json['lastName']);
  if (lastName != null) {
    myCaresCustomerDetailData.lastName = lastName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    myCaresCustomerDetailData.icon = icon;
  }
  final String? birth = jsonConvert.convert<String>(json['birth']);
  if (birth != null) {
    myCaresCustomerDetailData.birth = birth;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    myCaresCustomerDetailData.age = age;
  }
  final int? gender = jsonConvert.convert<int>(json['gender']);
  if (gender != null) {
    myCaresCustomerDetailData.gender = gender;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    myCaresCustomerDetailData.updateTime = updateTime;
  }
  final String? alertTime = jsonConvert.convert<String>(json['alertTime']);
  if (alertTime != null) {
    myCaresCustomerDetailData.alertTime = alertTime;
  }
  final String? callTime = jsonConvert.convert<String>(json['callTime']);
  if (callTime != null) {
    myCaresCustomerDetailData.callTime = callTime;
  }
  final String? gpsTime = jsonConvert.convert<String>(json['gpsTime']);
  if (gpsTime != null) {
    myCaresCustomerDetailData.gpsTime = gpsTime;
  }
  final String? lastUpdateTime =
      jsonConvert.convert<String>(json['lastUpdateTime']);
  if (lastUpdateTime != null) {
    myCaresCustomerDetailData.lastUpdateTime = lastUpdateTime;
  }
  final String? physicalCondition =
      jsonConvert.convert<String>(json['physicalCondition']);
  if (physicalCondition != null) {
    myCaresCustomerDetailData.physicalCondition = physicalCondition;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    myCaresCustomerDetailData.deviceId = deviceId;
  }
  final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
  if (deviceNo != null) {
    myCaresCustomerDetailData.deviceNo = deviceNo;
  }
  final int? giversCount = jsonConvert.convert<int>(json['giversCount']);
  if (giversCount != null) {
    myCaresCustomerDetailData.giversCount = giversCount;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    myCaresCustomerDetailData.address = address;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    myCaresCustomerDetailData.createTime = createTime;
  }
  final String? callOutTime = jsonConvert.convert<String>(json['callOutTime']);
  if (callOutTime != null) {
    myCaresCustomerDetailData.callOutTime = callOutTime;
  }
  final String? callComeTime =
      jsonConvert.convert<String>(json['callComeTime']);
  if (callComeTime != null) {
    myCaresCustomerDetailData.callComeTime = callComeTime;
  }
  final List<MyCaresCustomerDetailDataGps>? gps =
      jsonConvert.convertListNotNull<MyCaresCustomerDetailDataGps>(json['gps']);
  if (gps != null) {
    myCaresCustomerDetailData.gps = gps;
  }
  final List<MyCaresCustomerDetailDataGiver>? giver = jsonConvert
      .convertListNotNull<MyCaresCustomerDetailDataGiver>(json['giver']);
  if (giver != null) {
    myCaresCustomerDetailData.giver = giver;
  }
  final List<MyCaresCustomerDetailDataEmergency>? emergency =
      jsonConvert.convertListNotNull<MyCaresCustomerDetailDataEmergency>(
          json['emergency']);
  if (emergency != null) {
    myCaresCustomerDetailData.emergency = emergency;
  }
  final List<MyCaresCustomerDetailDataAlert>? alert = jsonConvert
      .convertListNotNull<MyCaresCustomerDetailDataAlert>(json['alert']);
  if (alert != null) {
    myCaresCustomerDetailData.alert = alert;
  }
  return myCaresCustomerDetailData;
}

Map<String, dynamic> $MyCaresCustomerDetailDataToJson(
    MyCaresCustomerDetailData entity) {
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
  data['callOutTime'] = entity.callOutTime;
  data['callComeTime'] = entity.callComeTime;
  data['gps'] = entity.gps?.map((v) => v.toJson()).toList();
  data['giver'] = entity.giver?.map((v) => v.toJson()).toList();
  data['emergency'] = entity.emergency?.map((v) => v.toJson()).toList();
  data['alert'] = entity.alert?.map((v) => v.toJson()).toList();
  return data;
}

MyCaresCustomerDetailDataGps $MyCaresCustomerDetailDataGpsFromJson(
    Map<String, dynamic> json) {
  final MyCaresCustomerDetailDataGps myCaresCustomerDetailDataGps =
      MyCaresCustomerDetailDataGps();
  final int? batteryPower = jsonConvert.convert<int>(json['batteryPower']);
  if (batteryPower != null) {
    myCaresCustomerDetailDataGps.batteryPower = batteryPower;
  }
  final String? posTime = jsonConvert.convert<String>(json['posTime']);
  if (posTime != null) {
    myCaresCustomerDetailDataGps.posTime = posTime;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    myCaresCustomerDetailDataGps.lat = lat;
  }
  final double? lng = jsonConvert.convert<double>(json['lng']);
  if (lng != null) {
    myCaresCustomerDetailDataGps.lng = lng;
  }
  final String? pos = jsonConvert.convert<String>(json['pos']);
  if (pos != null) {
    myCaresCustomerDetailDataGps.pos = pos;
  }
  final bool? fallDetection = jsonConvert.convert<bool>(json['fallDetection']);
  if (fallDetection != null) {
    myCaresCustomerDetailDataGps.fallDetection = fallDetection;
  }
  return myCaresCustomerDetailDataGps;
}

Map<String, dynamic> $MyCaresCustomerDetailDataGpsToJson(
    MyCaresCustomerDetailDataGps entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['batteryPower'] = entity.batteryPower;
  data['posTime'] = entity.posTime;
  data['lat'] = entity.lat;
  data['lng'] = entity.lng;
  data['pos'] = entity.pos;
  data['fallDetection'] = entity.fallDetection;
  return data;
}

MyCaresCustomerDetailDataGiver $MyCaresCustomerDetailDataGiverFromJson(
    Map<String, dynamic> json) {
  final MyCaresCustomerDetailDataGiver myCaresCustomerDetailDataGiver =
      MyCaresCustomerDetailDataGiver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    myCaresCustomerDetailDataGiver.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    myCaresCustomerDetailDataGiver.nickname = nickname;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    myCaresCustomerDetailDataGiver.phone = phone;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    myCaresCustomerDetailDataGiver.email = email;
  }
  final String? regTime = jsonConvert.convert<String>(json['regTime']);
  if (regTime != null) {
    myCaresCustomerDetailDataGiver.regTime = regTime;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    myCaresCustomerDetailDataGiver.icon = icon;
  }
  final int? caresCount = jsonConvert.convert<int>(json['caresCount']);
  if (caresCount != null) {
    myCaresCustomerDetailDataGiver.caresCount = caresCount;
  }
  return myCaresCustomerDetailDataGiver;
}

Map<String, dynamic> $MyCaresCustomerDetailDataGiverToJson(
    MyCaresCustomerDetailDataGiver entity) {
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

MyCaresCustomerDetailDataEmergency $MyCaresCustomerDetailDataEmergencyFromJson(
    Map<String, dynamic> json) {
  final MyCaresCustomerDetailDataEmergency myCaresCustomerDetailDataEmergency =
      MyCaresCustomerDetailDataEmergency();
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    myCaresCustomerDetailDataEmergency.phone = phone;
  }
  final String? callTime = jsonConvert.convert<String>(json['callTime']);
  if (callTime != null) {
    myCaresCustomerDetailDataEmergency.callTime = callTime;
  }
  final int? callType = jsonConvert.convert<int>(json['callType']);
  if (callType != null) {
    myCaresCustomerDetailDataEmergency.callType = callType;
  }
  final int? callStatus = jsonConvert.convert<int>(json['callStatus']);
  if (callStatus != null) {
    myCaresCustomerDetailDataEmergency.callStatus = callStatus;
  }
  final int? callDuration = jsonConvert.convert<int>(json['callDuration']);
  if (callDuration != null) {
    myCaresCustomerDetailDataEmergency.callDuration = callDuration;
  }
  final int? callFailReason = jsonConvert.convert<int>(json['callFailReason']);
  if (callFailReason != null) {
    myCaresCustomerDetailDataEmergency.callFailReason = callFailReason;
  }
  return myCaresCustomerDetailDataEmergency;
}

Map<String, dynamic> $MyCaresCustomerDetailDataEmergencyToJson(
    MyCaresCustomerDetailDataEmergency entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['phone'] = entity.phone;
  data['callTime'] = entity.callTime;
  data['callType'] = entity.callType;
  data['callStatus'] = entity.callStatus;
  data['callDuration'] = entity.callDuration;
  data['callFailReason'] = entity.callFailReason;
  return data;
}

MyCaresCustomerDetailDataAlert $MyCaresCustomerDetailDataAlertFromJson(
    Map<String, dynamic> json) {
  final MyCaresCustomerDetailDataAlert myCaresCustomerDetailDataAlert =
      MyCaresCustomerDetailDataAlert();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    myCaresCustomerDetailDataAlert.id = id;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    myCaresCustomerDetailDataAlert.deviceId = deviceId;
  }
  final String? orgId = jsonConvert.convert<String>(json['orgId']);
  if (orgId != null) {
    myCaresCustomerDetailDataAlert.orgId = orgId;
  }
  final String? groupId = jsonConvert.convert<String>(json['groupId']);
  if (groupId != null) {
    myCaresCustomerDetailDataAlert.groupId = groupId;
  }
  final int? alarmType = jsonConvert.convert<int>(json['alarmType']);
  if (alarmType != null) {
    myCaresCustomerDetailDataAlert.alarmType = alarmType;
  }
  final String? alarmTime = jsonConvert.convert<String>(json['alarmTime']);
  if (alarmTime != null) {
    myCaresCustomerDetailDataAlert.alarmTime = alarmTime;
  }
  final int? alarmLevel = jsonConvert.convert<int>(json['alarmLevel']);
  if (alarmLevel != null) {
    myCaresCustomerDetailDataAlert.alarmLevel = alarmLevel;
  }
  final int? alarmSource = jsonConvert.convert<int>(json['alarmSource']);
  if (alarmSource != null) {
    myCaresCustomerDetailDataAlert.alarmSource = alarmSource;
  }
  final int? flag = jsonConvert.convert<int>(json['flag']);
  if (flag != null) {
    myCaresCustomerDetailDataAlert.flag = flag;
  }
  final int? alarmValue = jsonConvert.convert<int>(json['alarmValue']);
  if (alarmValue != null) {
    myCaresCustomerDetailDataAlert.alarmValue = alarmValue;
  }
  final String? alarmContent =
      jsonConvert.convert<String>(json['alarmContent']);
  if (alarmContent != null) {
    myCaresCustomerDetailDataAlert.alarmContent = alarmContent;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    myCaresCustomerDetailDataAlert.status = status;
  }
  final double? lng = jsonConvert.convert<double>(json['lng']);
  if (lng != null) {
    myCaresCustomerDetailDataAlert.lng = lng;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    myCaresCustomerDetailDataAlert.lat = lat;
  }
  final String? refId = jsonConvert.convert<String>(json['refId']);
  if (refId != null) {
    myCaresCustomerDetailDataAlert.refId = refId;
  }
  final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
  if (deviceNo != null) {
    myCaresCustomerDetailDataAlert.deviceNo = deviceNo;
  }
  final String? alarmTypeName =
      jsonConvert.convert<String>(json['alarmTypeName']);
  if (alarmTypeName != null) {
    myCaresCustomerDetailDataAlert.alarmTypeName = alarmTypeName;
  }
  return myCaresCustomerDetailDataAlert;
}

Map<String, dynamic> $MyCaresCustomerDetailDataAlertToJson(
    MyCaresCustomerDetailDataAlert entity) {
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
