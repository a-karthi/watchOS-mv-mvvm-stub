//
//  SampleWatchApp.swift
//  SampleWatch
//
//  Created by @karthi on 27/03/23.
//

import SwiftUI
import WatchConnectivity

@main
struct SampleWatchApp: App {
    
    private var sessionDelegator: SessionDelegator = SessionDelegator()
    
    var body: some Scene {
        WindowGroup {
            CartoonListView()
                .onAppear {
                    self.checkConnectivity()
                }
        }
    }
    
    private func checkConnectivity() {
        // Trigger WCSession activation at the early phase of app launching.
        //
        assert(WCSession.isSupported(), "This sample requires Watch Connectivity support!")
        WCSession.default.delegate = sessionDelegator
        WCSession.default.activate()
    }
}
