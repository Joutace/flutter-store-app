// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      data: User.fromJson(json['data'] as Map<String, dynamic>),
      support: Support.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'data': instance.data,
      'support': instance.support,
    };

Support _$SupportFromJson(Map<String, dynamic> json) => Support(
      url: json['url'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$SupportToJson(Support instance) => <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };
