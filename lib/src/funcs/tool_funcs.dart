import 'dart:io';

import 'package:common_sdk/src/funcs/funcs.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

/// Some tools for working with functions.
class ToolFuncs {
  /// Caculae days between two date time
  /// Input [from] is UTC time
  /// Input [to] is UTC time
  /// Output is [int] distance between [from] and [to]
  static int daysBetween(DateTime from, DateTime to) {
    final f = DateTime(from.year, from.month, from.day);
    final t = DateTime(to.year, to.month, to.day);
    return (t.difference(f).inHours / 24).round();
  }

  /// Format date time with natural language
  /// Input [from] is UTC time
  /// Input [to] is UTC time
  /// Output is [String] distance between [from] and [to]
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
      logApp(e.toString(), LogEnum.error, 'FormatFuncs.distanceBetweenTowDate');
      return result;
    }
  }

  /// Compress file
  /// Input is [File]
  /// Output is [File] was compressed
  static Future<File> compressFile(File file) async {
    try {
      final filePath = file.absolute.path;

      // Create output file path
      // eg:- "Volume/VM/abcd_out.jpeg"
      // ignore: unnecessary_raw_strings
      final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
      final splitted = filePath.substring(0, lastIndex);
      final outPath = '${splitted}_out${filePath.substring(lastIndex)}';
      final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        outPath,
        quality: 30,
      );

      // debugPrint(file.lengthSync());
      // debugPrint(result.lengthSync());

      return result ?? file;
    } catch (e) {
      logApp(e.toString(), LogEnum.error, 'ToolFuncs.compressFile');
      return file;
    }
  }
}
