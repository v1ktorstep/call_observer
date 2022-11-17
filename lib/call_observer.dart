
import 'call_observer_platform_interface.dart';

class CallObserver {
  Future<String?> getPlatformVersion() {
    return CallObserverPlatform.instance.getPlatformVersion();
  }
}
