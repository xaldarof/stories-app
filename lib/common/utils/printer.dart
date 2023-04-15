import 'package:flutter/foundation.dart';

void printMessage(dynamic message) {
  if (kDebugMode) {
    print(message);
  }
}
