import 'package:flutter_test/flutter_test.dart';
import 'package:call_observer/call_observer.dart';
import 'package:call_observer/call_observer_platform_interface.dart';
import 'package:call_observer/call_observer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCallObserverPlatform
    with MockPlatformInterfaceMixin
    implements CallObserverPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CallObserverPlatform initialPlatform = CallObserverPlatform.instance;

  test('$MethodChannelCallObserver is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCallObserver>());
  });

  test('getPlatformVersion', () async {
    CallObserver callObserverPlugin = CallObserver();
    MockCallObserverPlatform fakePlatform = MockCallObserverPlatform();
    CallObserverPlatform.instance = fakePlatform;

    expect(await callObserverPlugin.getPlatformVersion(), '42');
  });
}
