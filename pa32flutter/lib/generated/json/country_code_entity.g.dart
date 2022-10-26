import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/country_code_entity.dart';

CountryCodeEntity $CountryCodeEntityFromJson(Map<String, dynamic> json) {
  final CountryCodeEntity countryCodeEntity = CountryCodeEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    countryCodeEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    countryCodeEntity.msg = msg;
  }
  final List<CountryCodeData>? data =
      jsonConvert.convertListNotNull<CountryCodeData>(json['data']);
  if (data != null) {
    countryCodeEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    countryCodeEntity.count = count;
  }
  return countryCodeEntity;
}

Map<String, dynamic> $CountryCodeEntityToJson(CountryCodeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['count'] = entity.count;
  return data;
}

CountryCodeData $CountryCodeDataFromJson(Map<String, dynamic> json) {
  final CountryCodeData countryCodeData = CountryCodeData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    countryCodeData.id = id;
  }
  final String? countryName = jsonConvert.convert<String>(json['countryName']);
  if (countryName != null) {
    countryCodeData.countryName = countryName;
  }
  final String? countryCode = jsonConvert.convert<String>(json['countryCode']);
  if (countryCode != null) {
    countryCodeData.countryCode = countryCode;
  }
  return countryCodeData;
}

Map<String, dynamic> $CountryCodeDataToJson(CountryCodeData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['countryName'] = entity.countryName;
  data['countryCode'] = entity.countryCode;
  return data;
}
