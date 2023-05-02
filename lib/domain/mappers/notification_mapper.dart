import 'package:jokes_app/common/utils/date.dart';
import 'package:jokes_app/domain/mappers/base_mapper.dart';
import 'package:jokes_app/domain/models/network/notification_response.dart';
import 'package:jokes_app/domain/models/ui/notification.dart';

class NotificationMapper
    extends Mapper<NotificationResponse, UserNotification> {
  @override
  UserNotification map(NotificationResponse data) {
    return UserNotification(
      id: data.id,
      content: data.content,
      isRead: data.isRead,
      timeCreate: data.timeCreate.toDate(),
    );
  }
}
