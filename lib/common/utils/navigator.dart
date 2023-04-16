import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension NavigatorCustom<T> on BuildContext {
  void navigateTo(Widget widget, {bool removeStack = false}) {
    Navigator.push(
      this,
      CupertinoPageRoute(builder: (context) => widget),
    );
    if (removeStack) {
      Navigator.of(this).pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => widget), (Route<dynamic> route) => false);
    }
  }

  void goBack() {
    Navigator.pop(this);
  }
}

abstract class NavigationModuleController {
  void navigate(Module module) {}
}

enum Module { home, fullScreenQuotes, publish, myQuotes, profile }
