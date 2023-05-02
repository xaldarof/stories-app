import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:meta/meta.dart';

import '../../../../domain/models/ui/notification.dart';
import '../../../../domain/repositories/profile_repository.dart';

part 'notifications_event.dart';

part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final ProfileRepository _repository;

  NotificationsBloc(
    this._repository,
  ) : super(const NotificationsState()) {
    on<GetNotifications>(_getNotifications);
    on<SetRead>(_setRead);
  }

  Future<void> _getNotifications(
      GetNotifications event, Emitter emitter) async {
    return emitter.forEach(
      _repository.getNotifications(),
      onData: (data) {
        if (data is DomainLoading) {
          return state.copyWith(notificationStatus: NotificationStatus.loading);
        }
        if (data is DomainFail) {
          return state.copyWith(notificationStatus: NotificationStatus.fail);
        }
        if (data is DomainSuccess<List<UserNotification>>) {
          return state.copyWith(
              notificationStatus: NotificationStatus.success,
              notifications: data.data);
        }
        return state;
      },
    );
  }

  Future<void> _setRead(SetRead event, Emitter emitter) async {
    return emitter.forEach(
      _repository.setNotificationRead(event.id),
      onData: (data) {
        if (data is DomainLoading) {
          return state;
        }
        if (data is DomainFail) {
          return state;
        }
        if (data is DomainSuccess) {
          add(GetNotifications());
          return state;
        }
        return state;
      },
    );
  }
}
