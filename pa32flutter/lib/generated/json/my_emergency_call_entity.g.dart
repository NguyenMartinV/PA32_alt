import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/my_emergency_call_entity.dart';

MyEmergencyCallEntity $MyEmergencyCallEntityFromJson(
    Map<String, dynamic> json) {
  final MyEmergencyCallEntity myEmergencyCallEntity = MyEmergencyCallEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    myEmergencyCallEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    myEmergencyCallEntity.msg = msg;
  }
  final List<MyEmergencyCallData>? data =
      jsonConvert.convertListNotNull<MyEmergencyCallData>(json['data']);
  if (data != null) {
    myEmergencyCallEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    myEmergencyCallEntity.count = count;
  }
  return myEmergencyCallEntity;
}

Map<String, dynamic> $MyEmergencyCallEntityToJson(
    MyEmergencyCallEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['count'] = entity.count;
  return data;
}

MyEmergencyCallData $MyEmergencyCallDataFromJson(Map<String, dynamic> json) {
  final MyEmergencyCallData myEmergencyCallData = MyEmergencyCallData();
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    myEmergencyCallData.phone = phone;
  }
  final String? callTime = jsonConvert.convert<String>(json['callTime']);
  if (callTime != null) {
    myEmergencyCallData.callTime = callTime;
  }
  final int? callType = jsonConvert.convert<int>(json['callType']);
  if (callType != null) {
    myEmergencyCallData.callType = callType;
  }
  final int? callStatus = jsonConvert.convert<int>(json['callStatus']);
  if (callStatus != null) {
    myEmergencyCallData.callStatus = callStatus;
  }
  final int? callDuration = jsonConvert.convert<int>(json['callDuration']);
  if (callDuration != null) {
    myEmergencyCallData.callDuration = callDuration;
  }
  final int? callFailReason = jsonConvert.convert<int>(json['callFailReason']);
  if (callFailReason != null) {
    myEmergencyCallData.callFailReason = callFailReason;
  }
  return myEmergencyCallData;
}

Map<String, dynamic> $MyEmergencyCallDataToJson(MyEmergencyCallData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['phone'] = entity.phone;
  data['callTime'] = entity.callTime;
  data['callType'] = entity.callType;
  data['callStatus'] = entity.callStatus;
  data['callDuration'] = entity.callDuration;
  data['callFailReason'] = entity.callFailReason;
  return data;
}
