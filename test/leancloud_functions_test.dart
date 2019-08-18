import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leancloud_functions/leancloud_functions.dart';

void main() {
  const MethodChannel channel = MethodChannel('leancloud_functions');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    //expect(await LeancloudFunctions.platformVersion, '42');
  });
}
