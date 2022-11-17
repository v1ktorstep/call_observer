class CallState {
  final String uuid;
  final bool isOutgoing;
  final bool isOnHold;
  final bool hasConnected;
  final bool hasEnded;

  CallState({
    required this.uuid,
    required this.isOutgoing,
    required this.isOnHold,
    required this.hasConnected,
    required this.hasEnded,
  });

  factory CallState.fromMap(Map<dynamic, dynamic> map) {
    return CallState(
      uuid: map['uuid'] as String,
      isOutgoing: map['isOutgoing'] as bool,
      isOnHold: map['isOnHold'] as bool,
      hasConnected: map['hasConnected'] as bool,
      hasEnded: map['hasEnded'] as bool,
    );
  }
}
