// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['email'] as String?,
      (json['id'] as num).toDouble(),
      json['avatar'] as String?,
      json['name'] as String,
      json['year'] as String,
      json['color'] as String,
      json['pantone_value'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'year': instance.year,
      'color': instance.color,
      'pantone_value': instance.pantone_value,
    };
