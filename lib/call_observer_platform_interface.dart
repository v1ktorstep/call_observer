import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'call_observer_method_channel.dart';

abstract class CallObserverPlatform extends PlatformInterface {
  /// Constructs a CallObserverPlatform.
  CallObserverPlatform() : super(token: _token);

  static final Object _token = Object();

  static CallObserverPlatform _instance = MethodChannelCallObserver();

  /// The default instance of [CallObserverPlatform] to use.
  ///
  /// Defaults to [MethodChannelCallObserver].
  static CallObserverPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CallObserverPlatform] when
  /// they register themselves.
  static set instance(CallObserverPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
