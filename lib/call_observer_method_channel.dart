import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'call_observer_platform_interface.dart';

/// An implementation of [CallObserverPlatform] that uses method channels.
class MethodChannelCallObserver extends CallObserverPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('call_observer');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
