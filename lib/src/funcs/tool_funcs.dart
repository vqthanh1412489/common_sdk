/// Some tools for working with functions.
class ToolFuncs {
  /// Caculae days between two date time
  static int daysBetween(DateTime from, DateTime to) {
    final f = DateTime(from.year, from.month, from.day);
    final t = DateTime(to.year, to.month, to.day);
    return (t.difference(f).inHours / 24).round();
  }

  /// Format date time with natural language
  static String distanceBetweenTowDate(DateTime from, DateTime to) {
    var result = '';

    try {
      final difference = daysBetween(from, to);

      if (difference == 0) {
        result = 'Hôm nay';
      } else {
        result = '$difference ngày trước';
      }

      return result;
    } catch (e) {
      return result;
    }
  }
}
