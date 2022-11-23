import 'package:common_sdk/src/funcs/funcs.dart';
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
        result =
            '${phone.substring(0, 4)}.${phone.substring(4, 7)}.${phone.substring(7, phone.length)}';
      }
      return result;
    } catch (e) {
      logApp(e.toString(), LogEnum.error, 'FormatFuncs.splitPhoneNumber');
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
        return NumberFormat.simpleCurrency(locale: 'vi', decimalDigits: 0)
            .format(price * 1000);
      }
      return '';
    } catch (e) {
      logApp(e.toString(), LogEnum.error, 'FormatFuncs.formatPrice');
      return '';
    }
  }

  /// Format date time with natural language
  static String formatDateNatural(DateTime dateTimeUTC,
      {String splitCharacter = ' - '}) {
    final dateTime = dateTimeUTC.toLocal();
    var result = '';

    final dayOfWeek = DateFormat('EEEE').format(dateTime);
    final monthOfYear = DateFormat('MMM').format(dateTime);

    final difference =
        ToolFuncs.daysBetween(dateTime, DateTime.now().toLocal());

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

  /// Format date time with full natural language
  static String formatFullDateTime(DateTime dt) {
    var result = '';
    const local = 'vi-VN';

    result += DateFormat('HH:mm, ', local).format(dt);
    result += 'ngày ';
    result += DateFormat('d ', local).format(dt);
    result += 'thg ';
    result += DateFormat('M, ', local).format(dt);
    result += DateFormat('y', local).format(dt);

    return result;
  }

  /// Format string to double with 6 decimal places
  /// Example: 1.2345678998674924 -> 1.234567
  double stringToDecimal6(String? str) {
    try {
      if (str != null) {
        final r = double.parse(str);
        return double.parse(r.toStringAsFixed(6));
      }
      return 60;
    } catch (e) {
      logApp(e.toString(), LogEnum.error, 'FormatFuncs.stringToDecimal6');
      return 60;
    }
  }
}
