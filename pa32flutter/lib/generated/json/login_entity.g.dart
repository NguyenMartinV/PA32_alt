import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/login_entity.dart';

LoginEntity $LoginEntityFromJson(Map<String, dynamic> json) {
  final LoginEntity loginEntity = LoginEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    loginEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    loginEntity.msg = msg;
  }
  final LoginData? data = jsonConvert.convert<LoginData>(json['data']);
  if (data != null) {
    loginEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    loginEntity.count = count;
  }
  return loginEntity;
}

Map<String, dynamic> $LoginEntityToJson(LoginEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  data['count'] = entity.count;
  return data;
}

LoginData $LoginDataFromJson(Map<String, dynamic> json) {
  final LoginData loginData = LoginData();
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    loginData.token = token;
  }
  return loginData;
}

Map<String, dynamic> $LoginDataToJson(LoginData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['token'] = entity.token;
  return data;
}
