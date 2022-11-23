import 'package:intl/intl.dart';

/// Format data
class FormatFuncs {
  /// Format phone number with dot (.)
  /// Example: 0888444333 -> 0888.444.333
  static String splitPhoneNumber(String? phone) {
    var result = '';
    try {
      if (phone == null) {
        return result;
      }
      if (phone.length >= 10) {
        result = '${phone.substring(0, 4)}.${phone.substring(4, 7)}.${phone.substring(7, phone.length)}';
      }
      return result;
    } catch (e) {
      return '';
    }
  }

  /// Format price of product
  static String formatPrice(dynamic price) {
    try {
      if (price != null && price is num) {
        if (price <= 0) {
          return 'Free';
        }
        return NumberFormat.simpleCurrency(locale: 'vi', decimalDigits: 0).format(price * 1000);
      }
      return '';
    } catch (e) {
      return '';
    }
  }

  /// Format date time with natural language
  static String formatDateNatural(DateTime dateTimeUTC, {String splitCharacter = ' - '}) {
    final dateTime = dateTimeUTC.toLocal();
    var result = '';

    final dayOfWeek = DateFormat('EEEE').format(dateTime);
    final monthOfYear = DateFormat('MMM').format(dateTime);

    final difference = daysBetween(dateTime, DateTime.now().toLocal());

    if (difference == 0) {
      result += "Hôm nay ${DateFormat('HH:mm').format(dateTime)}";
    } else if (difference == 1) {
      result += "Hôm qua ${DateFormat('HH:mm').format(dateTime)}";
    } else if (difference > 2 && difference <= 7) {
      switch (dayOfWeek) {
        case 'Monday':
          result += 'Thứ hai';
          break;
        case 'Tuesday':
          result += 'Thứ ba';
          break;
        case 'Wednesday':
          result += 'Thứ tư';
          break;
        case 'Thursday':
          result += 'Thứ năm';
          break;
        case 'Friday':
          result += 'Thứ sáu';
          break;
        case 'Saturday':
          result += 'Thứ bảy';
          break;
        case 'Sunday':
          result += 'Chủ nhật';
          break;
        default:
        // _result += "";
      }
    } else {
      result += DateFormat('d').format(dateTime) + splitCharacter;

      switch (monthOfYear) {
        case 'Jan':
          result += 'thg 1';
          break;
        case 'Feb':
          result += 'thg 2';
          break;
        case 'Mar':
          result += 'thg 3';
          break;
        case 'Apr':
          result += 'thg 4';
          break;
        case 'May':
          result += 'thg 5';
          break;
        case 'Jun':
          result += 'thg 6';
          break;
        case 'Jul':
          result += 'thg 7';
          break;
        case 'Aug':
          result += 'thg 8';
          break;
        case 'Sep':
          result += 'thg 9';
          break;
        case 'Oct':
          result += 'thg 10';
          break;
        case 'Nov':
          result += 'thg 11';
          break;
        case 'Dec':
          result += 'thg 12';
          break;
        default:
      }
    }

    return result;
  }

  /// Caculae days between two date time
  static int daysBetween(DateTime from, DateTime to) {
    final f = DateTime(from.year, from.month, from.day);
    final t = DateTime(to.year, to.month, to.day);
    return (t.difference(f).inHours / 24).round();
  }
}
