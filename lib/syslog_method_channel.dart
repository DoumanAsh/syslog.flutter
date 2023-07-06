import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'syslog_platform_interface.dart';

///Platform specific extension
extension Platform on LogLevel {
  /// Conversion to system log level
  int get toSysLevel {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        switch (this) {
          case LogLevel.error:
            return 6;
          case LogLevel.warn:
            return 5;
          case LogLevel.info:
            return 4;
          case LogLevel.debug:
            return 3;
          case LogLevel.verbose:
            return 2;
        }
      default:
        return 0;
    }
  }
}

/// An implementation of [SyslogPlatform] that uses method channels.
class MethodChannelSyslog extends SyslogPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.douman.syslog');

  @override
  Future<void> sendLog(String message, LogLevel? level, String? tag) async {
    final args = {'msg': message, if (level != null) 'lvl': level.toSysLevel, if (tag != null) 'tag': tag};
    await methodChannel.invokeMethod<String>('send_log', args);
  }
}
