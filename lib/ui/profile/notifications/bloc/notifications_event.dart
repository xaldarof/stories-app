part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsEvent {}

class GetNotifications extends NotificationsEvent {}

class SetRead extends NotificationsEvent {
  final int id;

  SetRead({
    required this.id,
  });
}
