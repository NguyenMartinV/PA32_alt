import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/customer_info_detail_entity.dart';

CustomerInfoDetailEntity $CustomerInfoDetailEntityFromJson(
    Map<String, dynamic> json) {
  final CustomerInfoDetailEntity customerInfoDetailEntity =
      CustomerInfoDetailEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    customerInfoDetailEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    customerInfoDetailEntity.msg = msg;
  }
  final CustomerInfoDetailData? data =
      jsonConvert.convert<CustomerInfoDetailData>(json['data']);
  if (data != null) {
    customerInfoDetailEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    customerInfoDetailEntity.count = count;
  }
  return customerInfoDetailEntity;
}

Map<String, dynamic> $CustomerInfoDetailEntityToJson(
    CustomerInfoDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  data['count'] = entity.count;
  return data;
}

CustomerInfoDetailData $CustomerInfoDetailDataFromJson(
    Map<String, dynamic> json) {
  final CustomerInfoDetailData customerInfoDetailData =
      CustomerInfoDetailData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerInfoDetailData.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    customerInfoDetailData.nickname = nickname;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    customerInfoDetailData.userName = userName;
  }
  final String? firstName = jsonConvert.convert<String>(json['firstName']);
  if (firstName != null) {
    customerInfoDetailData.firstName = firstName;
  }
  final String? middleName = jsonConvert.convert<String>(json['middleName']);
  if (middleName != null) {
    customerInfoDetailData.middleName = middleName;
  }
  final String? lastName = jsonConvert.convert<String>(json['lastName']);
  if (lastName != null) {
    customerInfoDetailData.lastName = lastName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    customerInfoDetailData.icon = icon;
  } else {
    customerInfoDetailData.icon = '';
  }
  final String? birth = jsonConvert.convert<String>(json['birth']);
  if (birth != null) {
    customerInfoDetailData.birth = birth;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    customerInfoDetailData.age = age;
  }
  final int? gender = jsonConvert.convert<int>(json['gender']);
  if (gender != null) {
    customerInfoDetailData.gender = gender;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    customerInfoDetailData.updateTime = updateTime;
  }
  final String? lastUpdateTime =
      jsonConvert.convert<String>(json['lastUpdateTime']);
  if (lastUpdateTime != null) {
    customerInfoDetailData.lastUpdateTime = lastUpdateTime;
  }
  final String? physicalCondition =
      jsonConvert.convert<String>(json['physicalCondition']);
  if (physicalCondition != null) {
    customerInfoDetailData.physicalCondition = physicalCondition;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    customerInfoDetailData.deviceId = deviceId;
  }
  final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
  if (deviceNo != null) {
    customerInfoDetailData.deviceNo = deviceNo;
  }
  final int? giversCount = jsonConvert.convert<int>(json['giversCount']);
  if (giversCount != null) {
    customerInfoDetailData.giversCount = giversCount;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    customerInfoDetailData.address = address;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    customerInfoDetailData.createTime = createTime;
  }
  final List<dynamic>? gps =
      jsonConvert.convertListNotNull<dynamic>(json['gps']);
  if (gps != null) {
    customerInfoDetailData.gps = gps;
  }
  final List<CustomerInfoDetailDataGiver>? giver = jsonConvert
      .convertListNotNull<CustomerInfoDetailDataGiver>(json['giver']);
  if (giver != null) {
    customerInfoDetailData.giver = giver;
  }
  final List<dynamic>? emergency =
      jsonConvert.convertListNotNull<dynamic>(json['emergency']);
  if (emergency != null) {
    customerInfoDetailData.emergency = emergency;
  }
  final List<dynamic>? alert =
      jsonConvert.convertListNotNull<dynamic>(json['alert']);
  if (alert != null) {
    customerInfoDetailData.alert = alert;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (createTime != null) {
    customerInfoDetailData.state = state;
  }

  final String? detailAddress = jsonConvert.convert<String>(json['detailAddress']);
  if (detailAddress != null) {
    customerInfoDetailData.detailAddress = detailAddress;
  }

  final String? zipCode = jsonConvert.convert<String>(json['zipCode']);
  if (zipCode != null) {
    customerInfoDetailData.zipCode = zipCode;
  }
  return customerInfoDetailData;
}

Map<String, dynamic> $CustomerInfoDetailDataToJson(
    CustomerInfoDetailData entity) {
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
  data['gps'] = entity.gps;
  data['giver'] = entity.giver?.map((v) => v.toJson()).toList();
  data['emergency'] = entity.emergency;
  data['alert'] = entity.alert;
  return data;
}

CustomerInfoDetailDataGiver $CustomerInfoDetailDataGiverFromJson(
    Map<String, dynamic> json) {
  final CustomerInfoDetailDataGiver customerInfoDetailDataGiver =
      CustomerInfoDetailDataGiver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    customerInfoDetailDataGiver.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    customerInfoDetailDataGiver.nickname = nickname;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    customerInfoDetailDataGiver.phone = phone;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    customerInfoDetailDataGiver.email = email;
  }
  final String? regTime = jsonConvert.convert<String>(json['regTime']);
  if (regTime != null) {
    customerInfoDetailDataGiver.regTime = regTime;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    customerInfoDetailDataGiver.icon = icon;
  }
  final int? caresCount = jsonConvert.convert<int>(json['caresCount']);
  if (caresCount != null) {
    customerInfoDetailDataGiver.caresCount = caresCount;
  }
  return customerInfoDetailDataGiver;
}

Map<String, dynamic> $CustomerInfoDetailDataGiverToJson(
    CustomerInfoDetailDataGiver entity) {
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
