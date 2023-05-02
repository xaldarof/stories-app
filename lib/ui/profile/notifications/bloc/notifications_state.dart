part of 'notifications_bloc.dart';

enum NotificationStatus {
  loading,
  success,
  fail,
}

@immutable
class NotificationsState extends Equatable {
  final NotificationStatus? notificationStatus;
  final List<UserNotification> notifications;

  @override
  List<Object?> get props => [
        notificationStatus,
        notifications,
      ];

  const NotificationsState({
    this.notificationStatus,
    this.notifications = const [],
  });

  NotificationsState copyWith({
    NotificationStatus? notificationStatus,
    List<UserNotification>? notifications,
  }) {
    return NotificationsState(
      notificationStatus: notificationStatus ?? this.notificationStatus,
      notifications: notifications ?? this.notifications,
    );
  }
}
