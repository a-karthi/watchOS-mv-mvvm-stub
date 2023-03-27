//
//  WatchReachability.swift
//  SampleWatch
//
//  Created by @karthi on 27/03/23.
//

import Foundation
import WatchConnectivity
class WatchReachability {
    static func isConnectedToNetwork() -> Bool {
        if WCSession.isSupported() {
            let session = WCSession.default
            return session.isReachable
        } else {
           return false
        }
 }
}
