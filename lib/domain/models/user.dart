import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String? email;
  final double id;
  String? avatar;
  final String name;
  final String first_name;
  final String last_name;
  final String year;
  final String color;
  final String pantone_value;

  User(
    this.email,
    this.id,
    this.avatar,
    this.name,
    this.year,
    this.color,
    this.pantone_value,
    this.first_name,
    this.last_name,
  );

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
