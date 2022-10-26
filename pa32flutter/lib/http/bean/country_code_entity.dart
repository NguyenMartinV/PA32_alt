import 'dart:convert';
import 'package:pa32/generated/json/base/json_field.dart';
import 'package:pa32/generated/json/country_code_entity.g.dart';

@JsonSerializable()
class CountryCodeEntity {
  int? code;
  String? msg;
  List<CountryCodeData>? data;
  String? count;

  CountryCodeEntity();

  factory CountryCodeEntity.fromJson(Map<String, dynamic> json) =>
      $CountryCodeEntityFromJson(json);

  Map<String, dynamic> toJson() => $CountryCodeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CountryCodeData {
  String? id;
  String? countryName;
  String? countryCode;

  CountryCodeData();

  factory CountryCodeData.fromJson(Map<String, dynamic> json) =>
      $CountryCodeDataFromJson(json);

  Map<String, dynamic> toJson() => $CountryCodeDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
