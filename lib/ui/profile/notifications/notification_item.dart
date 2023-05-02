import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/common/widgets/scale_tap.dart';
import 'package:jokes_app/common/widgets/story_owner.dart';
import 'package:jokes_app/domain/models/ui/notification.dart';
import 'package:jokes_app/generated/locale_keys.g.dart';

class NotificationItem extends StatelessWidget {
  final UserNotification notification;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {
        onTap.call();
      },
      child: Opacity(
        opacity: notification.isRead ? 0.5 : 1,
        child: Container(
          alignment: Alignment.centerLeft,
          padding:
              const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 24),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.whiteAlpha52),
            color: AppColors.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                notification.content,
                style: primaryTextStyle(),
              ),
              const Padding(
                padding: EdgeInsets.all(24),
              ),
              Row(
                children: [
                  if (!notification.isRead)
                    Flexible(
                      child: Text(
                        Strings.tapToMarkAsRead,
                        style: primaryTextStyle(
                          color: AppColors.white.withAlpha(152),
                        ),
                      ),
                    ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: Text(
                      notification.timeCreate,
                      style: primaryTextStyle(
                        color: AppColors.white.withAlpha(152),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  const NotificationItem({
    super.key,
    required this.notification,
    required this.onTap,
  });
}
