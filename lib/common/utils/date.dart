import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String toDdMm() {
    return "${_convert(day)}.${_convert(month)}.${_convert(year)}";
  }

  String toDdMmHmMm() {
    return "${_convert(day)}.${_convert(month)}.${_convert(year)} ${_convert(hour)}:${_convert(minute)}";
  }

  String _convert(int? num) {
    if (num! < 10 && num >= 0) {
      return "0$num";
    } else {
      return num.toString();
    }
  }
}

extension DateInt on int {
  String toDate() {
    var date = DateTime.fromMillisecondsSinceEpoch(this);
    date = date.copyWith(hour: date.hour + 5);
    return "${date.day}.${date.month}.${date.year} ${date.hour}:${date.minute}:${date.second}";
  }
}

extension DateFormatExt on String {
  String toDate() {
    try {
      DateTime now = DateTime.parse(this);
      now = now.copyWith(hour: now.hour + 5);
      var formatter = DateFormat('dd.MM.yyyy HH:mm');
      var formatted = formatter.format(now);
      return formatted;
    } catch (e) {
      return this;
    }
  }

  DateTime toDateTime() {
    DateTime now = DateTime.parse(this);
    return now;
  }

  String toIso() {
    DateTime date = DateTime.parse(this);
    return date.toIso8601String();
  }

  bool isToday() {
    DateTime date = DateTime.parse(this);
    DateTime today = DateTime.now();
    return "${date.day}${date.month}${date.year}" ==
        "${today.day}${today.month}${today.year}";
  }
}

String today() {
  DateTime today = DateTime.now();
  return "${today.day}${today.month}${today.year}";
}

extension DateTimeExtNullable on DateTime? {
  String? toDDMM() {
    return this == null
        ? null
        : "${(_convert(this?.day))}.${(_convert(this?.month))}.${(_convert(this?.year))}";
  }

  String _convert(int? num) {
    if (num! < 10 && num >= 0) {
      return "0$num";
    } else {
      return num.toString();
    }
  }
}

extension DateTimeExtStrList on List<String> {
  String? lastDate() {
    if (isNotEmpty) {
      try {
        var max = DateFormat("dd-MM-yyyy").parse(this[0]);

        forEach((element) {
          DateTime tempDate = DateFormat("dd-MM-yyyy").parse(element);
          if (tempDate.isAfter(max)) {
            max = tempDate;
          }
        });
        return max.toDdMm();
      } catch (e) {
        try {
          var max = DateTime.parse(this[0]);

          forEach((element) {
            DateTime tempDate = DateTime.parse(element);
            if (tempDate.isAfter(max)) {
              max = tempDate;
            }
          });
          return max.toDdMm();
        } catch (e) {
          return null;
        }
      }
    } else {
      return null;
    }
  }
}
