import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final String email;
  final double id;
  final String first_name;
  final String last_name;
  String? avatar;

  User(
    this.email,
    this.id,
    this.first_name,
    this.last_name,
    this.avatar,
  );

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
