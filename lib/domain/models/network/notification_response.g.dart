// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      id: json['id'] as int,
      content: json['content'] as String,
      isRead: json['isRead'] as bool,
      timeCreate: json['timeCreate'] as String,
    );

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'isRead': instance.isRead,
      'timeCreate': instance.timeCreate,
    };
