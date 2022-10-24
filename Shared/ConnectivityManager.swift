//
//  ConnectivityManager.swift
//  MyActivies
//
//  Created by Luca Hummel on 24/10/22.
//

import Foundation
import WatchConnectivity

final class ConnectivityManager: NSObject {
    static let shared = ConnectivityManager()
    
    override private init() {
        super.init()
        start()
    }
    
    func start() {
        guard WCSession.isSupported() else { return }
        
        WCSession.default.delegate = self
        WCSession.default.activate()
    }
    
    func send(activity: Activity) {
        guard WCSession.default.activationState == .activated else { return }
        
#if os(watchOS)
        guard WCSession.default.isCompanionAppInstalled else { return }
#else
        guard WCSession.default.isWatchAppInstalled else { return }
#endif
        
        let userInfo: [String: String] = ["title": activity.title]
        
        WCSession.default.sendMessage(userInfo, replyHandler: nil)
    }
}

extension ConnectivityManager: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    
    
#if !os(watchOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        WCSession.default.activate()
    }
#endif
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        for messageValue in message.values {
            let title = messageValue as! String
            
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: NSNotification.update, object: nil, userInfo: ["title": title])
            }
        }
    }
}
