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
      json['pantoneValue'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'year': instance.year,
      'color': instance.color,
      'pantoneValue': instance.pantoneValue,
    };
