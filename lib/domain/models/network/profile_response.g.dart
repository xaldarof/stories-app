// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      score: json['score'] as int?,
      lastName: json['lastName'] as String?,
      isMe: json['isMe'] as bool?,
      dateJoined: json['dateJoined'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateJoined': instance.dateJoined,
      'score': instance.score,
      'isMe': instance.isMe,
    };
