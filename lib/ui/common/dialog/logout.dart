import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/common/widgets/button.dart';
import 'package:jokes_app/generated/locale_keys.g.dart';

class LogOutContent extends StatelessWidget {
  final Function() onPositive;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color: AppColors.primaryColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(24),
            child: Text(
              Strings.doYouWantLogout,
              style: primaryTextStyle(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Button(
                  height: 42,
                  width: context.width,
                  onTap: () {
                    context.goBack();
                  },
                  text: Strings.no,
                  margin: const EdgeInsets.all(24),
                ),
              ),
              Flexible(
                child: Button(
                  height: 42,
                  width: context.width,
                  onTap: () {
                    onPositive.call();
                  },
                  text: Strings.yes,
                  margin: const EdgeInsets.all(24),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  const LogOutContent({
    super.key,
    required this.onPositive,
  });
}
