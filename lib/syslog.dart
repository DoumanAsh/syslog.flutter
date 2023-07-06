import 'syslog_platform_interface.dart';
export 'syslog_platform_interface.dart' show LogLevel;

///Syslog main interface
class Syslog {
  Future<void> sendLog(String message, {LogLevel? level, String? tag}) {
    return SyslogPlatform.instance.sendLog(message, level, tag);
  }
}
