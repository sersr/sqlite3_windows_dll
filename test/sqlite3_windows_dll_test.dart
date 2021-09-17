import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3_windows_dll/sqlite3_windows_dll.dart';

void main() {
  const MethodChannel channel = MethodChannel('sqlite3_windows_dll');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Sqlite3WindowsDll.platformVersion, '42');
  });
}
