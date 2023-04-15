import 'package:flutter/cupertino.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/fonts.dart';

class StoryCategoryItem extends StatelessWidget {
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, top: 4),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.darkGreen,
      ),
      child: Text(
        value.toLowerCase(),
        style: primaryTextStyle(color: AppColors.white),
      ),
    );
  }

  const StoryCategoryItem({
    super.key,
    required this.value,
  });
}
