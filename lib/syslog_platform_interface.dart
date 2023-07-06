import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'syslog_method_channel.dart';

/// Possible log levels
enum LogLevel {
  /// Verbose
  verbose,

  /// Debug
  debug,

  /// Info
  info,

  /// Warn
  warn,

  /// Error
  error,
}

abstract class SyslogPlatform extends PlatformInterface {
  /// Constructs a SyslogPlatform.
  SyslogPlatform() : super(token: _token);

  static final Object _token = Object();

  static SyslogPlatform _instance = MethodChannelSyslog();

  /// The default instance of [SyslogPlatform] to use.
  ///
  /// Defaults to [MethodChannelSyslog].
  static SyslogPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SyslogPlatform] when
  /// they register themselves.
  static set instance(SyslogPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> sendLog(String message, LogLevel? level, String? tag) {
    throw UnimplementedError('sendLog() has not been implemented.');
  }
}
