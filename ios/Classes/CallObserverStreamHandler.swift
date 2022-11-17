//
//  CallObserver.swift
//  call_observer
//
//  Created by VS on 11/17/22.
//

import Foundation
import CallKit

class CallObserverStreamHandler: NSObject, CXCallObserverDelegate, FlutterStreamHandler {
    private let callObserver = CXCallObserver()
    private var eventSink: FlutterEventSink?
    
    override init() {
        super.init()
        callObserver.setDelegate(self, queue: nil)
    }
    
    func callObserver(_ callObserver: CXCallObserver, callChanged call: CXCall) {
        let callStateMap: [String: Any] = [
            "uuid": call.uuid.uuidString,
            "isOutgoing": call.isOutgoing,
            "isOnHold": call.isOnHold,
            "hasConnected": call.hasConnected,
            "hasEnded": call.hasEnded,
        ]
        
        eventSink?(callStateMap)
    }
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }
}
