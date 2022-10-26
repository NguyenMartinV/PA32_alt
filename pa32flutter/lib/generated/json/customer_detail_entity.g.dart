import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/customer_detail_entity.dart';

CustomerDetailEntity $CustomerDetailEntityFromJson(Map<String, dynamic> json) {
  final CustomerDetailEntity customerDetailEntity = CustomerDetailEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    customerDetailEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    customerDetailEntity.msg = msg;
  }
  final CustomerDetailData? data =
      jsonConvert.convert<CustomerDetailData>(json['data']);
  if (data != null) {
    customerDetailEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    customerDetailEntity.count = count;
  }
  return customerDetailEntity;
}

Map<String, dynamic> $CustomerDetailEntityToJson(CustomerDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  data['count'] = entity.count;
  return data;
}

CustomerDetailData $CustomerDetailDataFromJson(Map<String, dynamic> json) {
  final CustomerDetailData customerDetailData = CustomerDetailData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerDetailData.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    customerDetailData.nickname = nickname;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    customerDetailData.userName = userName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    customerDetailData.icon = icon;
  }
  final String? birth = jsonConvert.convert<String>(json['birth']);
  if (birth != null) {
    customerDetailData.birth = birth;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    customerDetailData.age = age;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    customerDetailData.email = email;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    customerDetailData.updateTime = updateTime;
  }
  final String? alertTime = jsonConvert.convert<String>(json['alertTime']);
  if (alertTime != null) {
    customerDetailData.alertTime = alertTime;
  }
  final String? callTime = jsonConvert.convert<String>(json['callTime']);
  if (callTime != null) {
    customerDetailData.callTime = callTime;
  }
  final String? gpsTime = jsonConvert.convert<String>(json['gpsTime']);
  if (gpsTime != null) {
    customerDetailData.gpsTime = gpsTime;
  }
  final String? lastUpdateTime =
      jsonConvert.convert<String>(json['lastUpdateTime']);
  if (lastUpdateTime != null) {
    customerDetailData.lastUpdateTime = lastUpdateTime;
  }
  final String? physicalCondition =
      jsonConvert.convert<String>(json['physicalCondition']);
  if (physicalCondition != null) {
    customerDetailData.physicalCondition = physicalCondition;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    customerDetailData.deviceId = deviceId;
  }
  final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
  if (deviceNo != null) {
    customerDetailData.deviceNo = deviceNo;
  }
  final int? giversCount = jsonConvert.convert<int>(json['giversCount']);
  if (giversCount != null) {
    customerDetailData.giversCount = giversCount;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    customerDetailData.address = address;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    customerDetailData.createTime = createTime;
  }
  final List<CustomerDetailDataGps>? gps =
      jsonConvert.convertListNotNull<CustomerDetailDataGps>(json['gps']);
  if (gps != null) {
    customerDetailData.gps = gps;
  }
  final List<CustomerDetailDataGiver>? giver =
      jsonConvert.convertListNotNull<CustomerDetailDataGiver>(json['giver']);
  if (giver != null) {
    customerDetailData.giver = giver;
  }
  return customerDetailData;
}

Map<String, dynamic> $CustomerDetailDataToJson(CustomerDetailData entity) {
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
  data['gps'] = entity.gps?.map((v) => v.toJson()).toList();
  data['giver'] = entity.giver?.map((v) => v.toJson()).toList();
  return data;
}

CustomerDetailDataGps $CustomerDetailDataGpsFromJson(
    Map<String, dynamic> json) {
  final CustomerDetailDataGps customerDetailDataGps = CustomerDetailDataGps();
  final int? batteryPower = jsonConvert.convert<int>(json['batteryPower']);
  if (batteryPower != null) {
    customerDetailDataGps.batteryPower = batteryPower;
  }
  final String? posTime = jsonConvert.convert<String>(json['posTime']);
  if (posTime != null) {
    customerDetailDataGps.posTime = posTime;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    customerDetailDataGps.lat = lat;
  }
  final double? lng = jsonConvert.convert<double>(json['lng']);
  if (lng != null) {
    customerDetailDataGps.lng = lng;
  }
  final String? pos = jsonConvert.convert<String>(json['pos']);
  if (pos != null) {
    customerDetailDataGps.pos = pos;
  }
  final bool? fallDetection = jsonConvert.convert<bool>(json['fallDetection']);
  if (fallDetection != null) {
    customerDetailDataGps.fallDetection = fallDetection;
  }
  return customerDetailDataGps;
}

Map<String, dynamic> $CustomerDetailDataGpsToJson(
    CustomerDetailDataGps entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['batteryPower'] = entity.batteryPower;
  data['posTime'] = entity.posTime;
  data['lat'] = entity.lat;
  data['lng'] = entity.lng;
  data['pos'] = entity.pos;
  data['fallDetection'] = entity.fallDetection;
  return data;
}

CustomerDetailDataGiver $CustomerDetailDataGiverFromJson(
    Map<String, dynamic> json) {
  final CustomerDetailDataGiver customerDetailDataGiver =
      CustomerDetailDataGiver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerDetailDataGiver.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    customerDetailDataGiver.nickname = nickname;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    customerDetailDataGiver.phone = phone;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    customerDetailDataGiver.email = email;
  }
  final String? regTime = jsonConvert.convert<String>(json['regTime']);
  if (regTime != null) {
    customerDetailDataGiver.regTime = regTime;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    customerDetailDataGiver.icon = icon;
  }
  final int? caresCount = jsonConvert.convert<int>(json['caresCount']);
  if (caresCount != null) {
    customerDetailDataGiver.caresCount = caresCount;
  }
  return customerDetailDataGiver;
}

Map<String, dynamic> $CustomerDetailDataGiverToJson(
    CustomerDetailDataGiver entity) {
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
