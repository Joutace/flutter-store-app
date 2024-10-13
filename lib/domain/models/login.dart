import 'package:flutter_challange/domain/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  final User data;
  final Support support;

  Login({required this.data, required this.support});

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}

@JsonSerializable()
class Support {
  final String url;
  final String text;

  Support({required this.url, required this.text});

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);
  Map<String, dynamic> toJson() => _$SupportToJson(this);
}
