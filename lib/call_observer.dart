import 'package:call_observer/call_state.dart';
import 'package:flutter/services.dart';

const _eventChannelName = 'platform_channel_events/call_observer';

class CallObserver {
  static const _eventChannel = EventChannel(_eventChannelName);

  static Stream<CallState> get callStateStream {
    return _eventChannel
        .receiveBroadcastStream()
        .distinct()
        .map((dynamic event) => CallState.fromMap(event));
  }
}
