import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/customer_alerts_detail_entity.dart';

CustomerAlertsDetailEntity $CustomerAlertsDetailEntityFromJson(
    Map<String, dynamic> json) {
  final CustomerAlertsDetailEntity customerAlertsDetailEntity =
      CustomerAlertsDetailEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    customerAlertsDetailEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    customerAlertsDetailEntity.msg = msg;
  }
  final CustomerAlertsDetailData? data =
      jsonConvert.convert<CustomerAlertsDetailData>(json['data']);
  if (data != null) {
    customerAlertsDetailEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    customerAlertsDetailEntity.count = count;
  }
  return customerAlertsDetailEntity;
}

Map<String, dynamic> $CustomerAlertsDetailEntityToJson(
    CustomerAlertsDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  data['count'] = entity.count;
  return data;
}

CustomerAlertsDetailData $CustomerAlertsDetailDataFromJson(
    Map<String, dynamic> json) {
  final CustomerAlertsDetailData customerAlertsDetailData =
      CustomerAlertsDetailData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerAlertsDetailData.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    customerAlertsDetailData.nickname = nickname;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    customerAlertsDetailData.userName = userName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    customerAlertsDetailData.icon = icon;
  }
  final String? birth = jsonConvert.convert<String>(json['birth']);
  if (birth != null) {
    customerAlertsDetailData.birth = birth;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    customerAlertsDetailData.age = age;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    customerAlertsDetailData.updateTime = updateTime;
  }
  final String? lastUpdateTime =
      jsonConvert.convert<String>(json['lastUpdateTime']);
  if (lastUpdateTime != null) {
    customerAlertsDetailData.lastUpdateTime = lastUpdateTime;
  }
  final String? physicalCondition =
      jsonConvert.convert<String>(json['physicalCondition']);
  if (physicalCondition != null) {
    customerAlertsDetailData.physicalCondition = physicalCondition;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    customerAlertsDetailData.deviceId = deviceId;
  }
  final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
  if (deviceNo != null) {
    customerAlertsDetailData.deviceNo = deviceNo;
  }
  final int? giversCount = jsonConvert.convert<int>(json['giversCount']);
  if (giversCount != null) {
    customerAlertsDetailData.giversCount = giversCount;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    customerAlertsDetailData.address = address;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    customerAlertsDetailData.createTime = createTime;
  }
  final List<CustomerAlertsDetailDataGps>? gps =
      jsonConvert.convertListNotNull<CustomerAlertsDetailDataGps>(json['gps']);
  if (gps != null) {
    customerAlertsDetailData.gps = gps;
  }
  final List<CustomerAlertsDetailDataGiver>? giver = jsonConvert
      .convertListNotNull<CustomerAlertsDetailDataGiver>(json['giver']);
  if (giver != null) {
    customerAlertsDetailData.giver = giver;
  }
  final List<dynamic>? emergency =
      jsonConvert.convertListNotNull<dynamic>(json['emergency']);
  if (emergency != null) {
    customerAlertsDetailData.emergency = emergency;
  }
  final List<CustomerAlertsDetailDataAlert>? alert = jsonConvert
      .convertListNotNull<CustomerAlertsDetailDataAlert>(json['alert']);
  if (alert != null) {
    customerAlertsDetailData.alert = alert;
  }
  return customerAlertsDetailData;
}

Map<String, dynamic> $CustomerAlertsDetailDataToJson(
    CustomerAlertsDetailData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['nickname'] = entity.nickname;
  data['userName'] = entity.userName;
  data['icon'] = entity.icon;
  data['birth'] = entity.birth;
  data['age'] = entity.age;
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
  data['emergency'] = entity.emergency;
  data['alert'] = entity.alert?.map((v) => v.toJson()).toList();
  return data;
}

CustomerAlertsDetailDataGps $CustomerAlertsDetailDataGpsFromJson(
    Map<String, dynamic> json) {
  final CustomerAlertsDetailDataGps customerAlertsDetailDataGps =
      CustomerAlertsDetailDataGps();
  final int? batteryPower = jsonConvert.convert<int>(json['batteryPower']);
  if (batteryPower != null) {
    customerAlertsDetailDataGps.batteryPower = batteryPower;
  }
  final String? posTime = jsonConvert.convert<String>(json['posTime']);
  if (posTime != null) {
    customerAlertsDetailDataGps.posTime = posTime;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    customerAlertsDetailDataGps.lat = lat;
  }
  final double? lng = jsonConvert.convert<double>(json['lng']);
  if (lng != null) {
    customerAlertsDetailDataGps.lng = lng;
  }
  final String? pos = jsonConvert.convert<String>(json['pos']);
  if (pos != null) {
    customerAlertsDetailDataGps.pos = pos;
  }
  final bool? fallDetection = jsonConvert.convert<bool>(json['fallDetection']);
  if (fallDetection != null) {
    customerAlertsDetailDataGps.fallDetection = fallDetection;
  }
  return customerAlertsDetailDataGps;
}

Map<String, dynamic> $CustomerAlertsDetailDataGpsToJson(
    CustomerAlertsDetailDataGps entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['batteryPower'] = entity.batteryPower;
  data['posTime'] = entity.posTime;
  data['lat'] = entity.lat;
  data['lng'] = entity.lng;
  data['pos'] = entity.pos;
  data['fallDetection'] = entity.fallDetection;
  return data;
}

CustomerAlertsDetailDataGiver $CustomerAlertsDetailDataGiverFromJson(
    Map<String, dynamic> json) {
  final CustomerAlertsDetailDataGiver customerAlertsDetailDataGiver =
      CustomerAlertsDetailDataGiver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerAlertsDetailDataGiver.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    customerAlertsDetailDataGiver.nickname = nickname;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    customerAlertsDetailDataGiver.phone = phone;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    customerAlertsDetailDataGiver.email = email;
  }
  final String? regTime = jsonConvert.convert<String>(json['regTime']);
  if (regTime != null) {
    customerAlertsDetailDataGiver.regTime = regTime;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    customerAlertsDetailDataGiver.icon = icon;
  }
  final int? caresCount = jsonConvert.convert<int>(json['caresCount']);
  if (caresCount != null) {
    customerAlertsDetailDataGiver.caresCount = caresCount;
  }
  return customerAlertsDetailDataGiver;
}

Map<String, dynamic> $CustomerAlertsDetailDataGiverToJson(
    CustomerAlertsDetailDataGiver entity) {
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

CustomerAlertsDetailDataAlert $CustomerAlertsDetailDataAlertFromJson(
    Map<String, dynamic> json) {
  final CustomerAlertsDetailDataAlert customerAlertsDetailDataAlert =
      CustomerAlertsDetailDataAlert();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerAlertsDetailDataAlert.id = id;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    customerAlertsDetailDataAlert.deviceId = deviceId;
  }
  final String? orgId = jsonConvert.convert<String>(json['orgId']);
  if (orgId != null) {
    customerAlertsDetailDataAlert.orgId = orgId;
  }
  final String? groupId = jsonConvert.convert<String>(json['groupId']);
  if (groupId != null) {
    customerAlertsDetailDataAlert.groupId = groupId;
  }
  final int? alarmType = jsonConvert.convert<int>(json['alarmType']);
  if (alarmType != null) {
    customerAlertsDetailDataAlert.alarmType = alarmType;
  }
  final String? alarmTime = jsonConvert.convert<String>(json['alarmTime']);
  if (alarmTime != null) {
    customerAlertsDetailDataAlert.alarmTime = alarmTime;
  }
  final int? alarmLevel = jsonConvert.convert<int>(json['alarmLevel']);
  if (alarmLevel != null) {
    customerAlertsDetailDataAlert.alarmLevel = alarmLevel;
  }
  final int? alarmSource = jsonConvert.convert<int>(json['alarmSource']);
  if (alarmSource != null) {
    customerAlertsDetailDataAlert.alarmSource = alarmSource;
  }
  final int? flag = jsonConvert.convert<int>(json['flag']);
  if (flag != null) {
    customerAlertsDetailDataAlert.flag = flag;
  }
  final int? alarmValue = jsonConvert.convert<int>(json['alarmValue']);
  if (alarmValue != null) {
    customerAlertsDetailDataAlert.alarmValue = alarmValue;
  }
  final String? alarmContent =
      jsonConvert.convert<String>(json['alarmContent']);
  if (alarmContent != null) {
    customerAlertsDetailDataAlert.alarmContent = alarmContent;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    customerAlertsDetailDataAlert.status = status;
  }
  final String? refId = jsonConvert.convert<String>(json['refId']);
  if (refId != null) {
    customerAlertsDetailDataAlert.refId = refId;
  }
  final String? alarmTypeName =
      jsonConvert.convert<String>(json['alarmTypeName']);
  if (alarmTypeName != null) {
    customerAlertsDetailDataAlert.alarmTypeName = alarmTypeName;
  }
  return customerAlertsDetailDataAlert;
}

Map<String, dynamic> $CustomerAlertsDetailDataAlertToJson(
    CustomerAlertsDetailDataAlert entity) {
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
