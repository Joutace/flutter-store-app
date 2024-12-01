import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String? email;
  final double id;
  String? avatar;
  final String name;
  final String firstName;
  final String lastName;
  final String year;
  final String color;
  final String pantoneValue;

  User(
    this.email,
    this.id,
    this.avatar,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
    this.firstName,
    this.lastName,
  );

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
