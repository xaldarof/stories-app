import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/decorations.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/common/widgets/loading.dart';
import 'package:jokes_app/common/widgets/not_found.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/ui/profile/notifications/bloc/notifications_bloc.dart';
import 'package:jokes_app/ui/profile/notifications/notification_item.dart';

import '../../../common/resource/fonts.dart';
import '../../../generated/locale_keys.g.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationsBloc(injector.get())
        ..add(
          GetNotifications(),
        ),
      child: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: AppColors.primaryColorBlack,
                title: Text(Strings.notifications,
                    style: primaryTextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold))),
            body: Container(
              width: context.width,
              height: context.height,
              decoration: const DefaultBackgroundDecoration(),
              child: state.notifications.isEmpty
                  ? state.notificationStatus == NotificationStatus.success
                      ? const NotFound()
                      : const Loading()
                  : ListView.builder(
                      itemCount: state.notifications.length,
                      itemBuilder: (e, i) {
                        return NotificationItem(
                          notification: state.notifications[i],
                          onTap: () {
                            if (!state.notifications[i].isRead) {
                              context
                                  .read<NotificationsBloc>()
                                  .add(SetRead(id: state.notifications[i].id));
                            }
                          },
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
