import 'package:flutter_test/flutter_test.dart';
import 'package:syslog/syslog.dart';
import 'package:syslog/syslog_platform_interface.dart';
import 'package:syslog/syslog_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSyslogPlatform
    with MockPlatformInterfaceMixin
    implements SyslogPlatform {

  final messages = <String>[];
  @override
  Future<void> sendLog(String message, LogLevel? level, String? tag) async {
      messages.add(message);
  }
}

void main() {
  final SyslogPlatform initialPlatform = SyslogPlatform.instance;

  test('$MethodChannelSyslog is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSyslog>());
  });

  test('getPlatformVersion', () async {
    Syslog syslogPlugin = Syslog();
    MockSyslogPlatform fakePlatform = MockSyslogPlatform();
    SyslogPlatform.instance = fakePlatform;

    await syslogPlugin.sendLog("test");
    expect(fakePlatform.messages.length, 1);
  });
}
