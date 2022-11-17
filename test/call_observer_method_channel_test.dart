import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:call_observer/call_observer_method_channel.dart';

void main() {
  MethodChannelCallObserver platform = MethodChannelCallObserver();
  const MethodChannel channel = MethodChannel('call_observer');

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
    expect(await platform.getPlatformVersion(), '42');
  });
}
