/// Support parse functions.
class ParseFunc {
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
      return defaultData;
    }
  }
}
