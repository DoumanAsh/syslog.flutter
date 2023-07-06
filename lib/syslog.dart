import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

import 'syslog_platform_interface.dart';
export 'syslog_platform_interface.dart' show LogLevel;

///Syslog main interface
class Syslog {
  ///Checks whether this platform is supported (i.e. `sendLog` can be used)
  static bool get isSupported {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return true;
      default:
        return false;
    }
  }

  ///Sends log
  Future<void> sendLog(String message, {LogLevel? level, String? tag}) {
    return SyslogPlatform.instance.sendLog(message, level, tag);
  }
}
