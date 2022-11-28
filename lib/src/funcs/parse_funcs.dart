import 'package:common_sdk/src/funcs/funcs.dart';

/// Support parse functions.
class ParseFuncs {
  /// Parses a dynamic into a [int].
  static bool parseIntToBool(dynamic value) {
    if (value is int) {
      return value == 1;
    } else if (value is String) {
      return value == '1';
    }

    return false;
  }

  /// Parses a dynamic into a [double] with [defaultData].
  static double parseToDoubleSafety(dynamic data, double defaultData) {
    try {
      if (data != null) {
        return double.parse(data.toString());
      } else {
        return defaultData;
      }
    } catch (e) {
      logApp(e.toString(), LogEnum.error, 'FormatFuncs.parseToDoubleSafety');
      return defaultData;
    }
  }

  /// Parses a dynamic into a [DateTime] with default data is [DateTime.now()].
  static DateTime parseToDateTimeSafety(dynamic data) {
    try {
      if (data != null) {
        return DateTime.parse(data.toString());
      } else {
        return DateTime.now();
      }
    } catch (e) {
      logApp(e.toString(), LogEnum.error, 'FormatFuncs.parseToDateTimeSafety');
      return DateTime.now();
    }
  }
}
