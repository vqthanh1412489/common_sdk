import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// Logs a message to the console.
class Logs {
  /// Constructs an instance of [Logs].
  Logs();

  Logs._privateConstructor();
  static final Logs _instance = Logs._privateConstructor();

  /// get instance of Logs
  static Logs get instance => _instance;

  /// Log info message
  void logInfo(String msg) {
    developer.log('\x1B[34m$msg\x1B[0m');
  }

  /// Log success message
  void logSuccess(String msg) {
    developer.log('\x1B[32m$msg\x1B[0m');
  }

  /// Log warning message
  void logWarning(String msg) {
    developer.log('\x1B[33m$msg\x1B[0m');
  }

  /// Log error message
  void logError(String msg) {
    developer.log('\x1B[31m$msg\x1B[0m');
  }
}

/// LogEnum is enum for log
enum LogEnum {
  /// Log info
  info,

  /// Log success
  success,

  /// Log warning
  warning,

  /// Log error
  error
}

/// Log is a class for log
void logApp(dynamic jsonObject,
    [LogEnum? logEnum = LogEnum.info, String? tag]) {
  if (kDebugMode) {
    const encoder = JsonEncoder.withIndent('     ');
    switch (logEnum) {
      case LogEnum.info:
        return Logs.instance.logInfo('$tag: ${encoder.convert(jsonObject)}');
      case LogEnum.success:
        return Logs.instance.logSuccess('$tag: ${encoder.convert(jsonObject)}');
      case LogEnum.warning:
        return Logs.instance.logWarning('$tag: ${encoder.convert(jsonObject)}');
      case LogEnum.error:
        return Logs.instance.logError('$tag: ${encoder.convert(jsonObject)}');
      // ignore: no_default_cases
      default:
        return Logs.instance.logInfo('$tag: ${encoder.convert(jsonObject)}');
    }
  }
}
