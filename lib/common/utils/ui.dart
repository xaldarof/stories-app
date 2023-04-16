import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../resource/colors.dart';

void unFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void setNavColor() {
  var mySystemTheme = SystemUiOverlayStyle.light
      .copyWith(systemNavigationBarColor: AppColors.black);
  SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
}
