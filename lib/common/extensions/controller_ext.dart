import 'package:flutter/material.dart';

extension ScrollExt on ScrollController {
  void setupScrollListener({Function? onAtTop, Function? onAtBottom}) {
    addListener(() {
      if (position.atEdge) {
        if (position.pixels == 0) {
          onAtTop?.call();
        } else {
          onAtBottom?.call();
        }
      }
    });
  }

  void onTopReached(Function(bool) onReach) {
    addListener(() {
      if (offset <= position.minScrollExtent && !position.outOfRange) {
        onReach.call(true);
      } else {
      }
    });
  }
}
