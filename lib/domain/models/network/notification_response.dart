import 'package:json_annotation/json_annotation.dart';

part 'notification_response.g.dart';

@JsonSerializable()
class NotificationResponse {
  final int id;
  final String content;
  final bool isRead;
  final String timeCreate;

  const NotificationResponse({
    required this.id,
    required this.content,
    required this.isRead,
    required this.timeCreate,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
}
