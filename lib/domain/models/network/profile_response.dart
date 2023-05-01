import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class UserResponse {
  final int id;

  final String username;

  final String? email;

  final String? firstName;

  final String? lastName;

  final String dateJoined;
  final int? score;

  const UserResponse({
    required this.id,
    required this.username,
    this.email,
    this.firstName,
    this.score,
    this.lastName,
    required this.dateJoined,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
