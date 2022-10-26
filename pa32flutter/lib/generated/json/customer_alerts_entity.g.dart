import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/customer_alerts_entity.dart';

CustomerAlertsEntity $CustomerAlertsEntityFromJson(Map<String, dynamic> json) {
  final CustomerAlertsEntity customerAlertsEntity = CustomerAlertsEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    customerAlertsEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    customerAlertsEntity.msg = msg;
  }
  final List<CustomerAlertsData>? data =
      jsonConvert.convertListNotNull<CustomerAlertsData>(json['data']);
  if (data != null) {
    customerAlertsEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    customerAlertsEntity.count = count;
  }
  return customerAlertsEntity;
}

Map<String, dynamic> $CustomerAlertsEntityToJson(CustomerAlertsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['count'] = entity.count;
  return data;
}

CustomerAlertsData $CustomerAlertsDataFromJson(Map<String, dynamic> json) {
  final CustomerAlertsData customerAlertsData = CustomerAlertsData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerAlertsData.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    customerAlertsData.nickname = nickname;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    customerAlertsData.userName = userName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    customerAlertsData.icon = icon;
  }
  final String? birth = jsonConvert.convert<String>(json['birth']);
  if (birth != null) {
    customerAlertsData.birth = birth;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    customerAlertsData.age = age;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    customerAlertsData.updateTime = updateTime;
  }
  final String? lastUpdateTime =
      jsonConvert.convert<String>(json['lastUpdateTime']);
  if (lastUpdateTime != null) {
    customerAlertsData.lastUpdateTime = lastUpdateTime;
  }
  final String? physicalCondition =
      jsonConvert.convert<String>(json['physicalCondition']);
  if (physicalCondition != null) {
    customerAlertsData.physicalCondition = physicalCondition;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    customerAlertsData.deviceId = deviceId;
  }
  final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
  if (deviceNo != null) {
    customerAlertsData.deviceNo = deviceNo;
  }
  final int? giversCount = jsonConvert.convert<int>(json['giversCount']);
  if (giversCount != null) {
    customerAlertsData.giversCount = giversCount;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    customerAlertsData.address = address;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    customerAlertsData.createTime = createTime;
  }
  final List<CustomerAlertsDataGps>? gps =
      jsonConvert.convertListNotNull<CustomerAlertsDataGps>(json['gps']);
  if (gps != null) {
    customerAlertsData.gps = gps;
  }
  final List<CustomerAlertsDataGiver>? giver =
      jsonConvert.convertListNotNull<CustomerAlertsDataGiver>(json['giver']);
  if (giver != null) {
    customerAlertsData.giver = giver;
  }
  final List<dynamic>? emergency =
      jsonConvert.convertListNotNull<dynamic>(json['emergency']);
  if (emergency != null) {
    customerAlertsData.emergency = emergency;
  }
  final List<dynamic>? alert =
      jsonConvert.convertListNotNull<dynamic>(json['alert']);
  if (alert != null) {
    customerAlertsData.alert = alert;
  }
  return customerAlertsData;
}

Map<String, dynamic> $CustomerAlertsDataToJson(CustomerAlertsData entity) {
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
  data['alert'] = entity.alert;
  return data;
}

CustomerAlertsDataGps $CustomerAlertsDataGpsFromJson(
    Map<String, dynamic> json) {
  final CustomerAlertsDataGps customerAlertsDataGps = CustomerAlertsDataGps();
  final int? batteryPower = jsonConvert.convert<int>(json['batteryPower']);
  if (batteryPower != null) {
    customerAlertsDataGps.batteryPower = batteryPower;
  }
  final String? posTime = jsonConvert.convert<String>(json['posTime']);
  if (posTime != null) {
    customerAlertsDataGps.posTime = posTime;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    customerAlertsDataGps.lat = lat;
  }
  final double? lng = jsonConvert.convert<double>(json['lng']);
  if (lng != null) {
    customerAlertsDataGps.lng = lng;
  }
  final String? pos = jsonConvert.convert<String>(json['pos']);
  if (pos != null) {
    customerAlertsDataGps.pos = pos;
  }
  final bool? fallDetection = jsonConvert.convert<bool>(json['fallDetection']);
  if (fallDetection != null) {
    customerAlertsDataGps.fallDetection = fallDetection;
  }
  return customerAlertsDataGps;
}

Map<String, dynamic> $CustomerAlertsDataGpsToJson(
    CustomerAlertsDataGps entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['batteryPower'] = entity.batteryPower;
  data['posTime'] = entity.posTime;
  data['lat'] = entity.lat;
  data['lng'] = entity.lng;
  data['pos'] = entity.pos;
  data['fallDetection'] = entity.fallDetection;
  return data;
}

CustomerAlertsDataGiver $CustomerAlertsDataGiverFromJson(
    Map<String, dynamic> json) {
  final CustomerAlertsDataGiver customerAlertsDataGiver =
      CustomerAlertsDataGiver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerAlertsDataGiver.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    customerAlertsDataGiver.nickname = nickname;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    customerAlertsDataGiver.phone = phone;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    customerAlertsDataGiver.email = email;
  }
  final String? regTime = jsonConvert.convert<String>(json['regTime']);
  if (regTime != null) {
    customerAlertsDataGiver.regTime = regTime;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    customerAlertsDataGiver.icon = icon;
  }
  final int? caresCount = jsonConvert.convert<int>(json['caresCount']);
  if (caresCount != null) {
    customerAlertsDataGiver.caresCount = caresCount;
  }
  return customerAlertsDataGiver;
}

Map<String, dynamic> $CustomerAlertsDataGiverToJson(
    CustomerAlertsDataGiver entity) {
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
