//
//  LikeButtonView.swift
//  SampleWatch
//
//  Created by @karthi on 28/03/23.
//
import SwiftUI
import WatchConnectivity

struct LikeButtonView: View {
    var cartoon: CartoonNetworkResponse?
    
    let notificationHandler = NotificationHandler()
    
    @State var isLiked = false
    
    var body: some View {
        Button(action: {
            self.request()
        }) {
            Image(systemName: self.isLiked ? "heart.fill" : "heart")
                .foregroundColor(self.isLiked ? .red : .gray)
        }
        .onAppear {
            if let cart = cartoon {
                self.isLiked = cart.isLiked
            }
        }
    }
    
    func request() {
        if let cart = cartoon {
            cart.isLiked = !cart.isLiked
            self.isLiked = cart.isLiked
            if cart.isLiked {
                let title = "CNTV"
                let message = "\(cart.title) is liked"
                notificationHandler.triggerNotification(title, message )
                self.sendMessage(["title":title,
                                  "msg":message])
            } else {
                let title = "CNTV"
                let message = "\(cart.title) is Disliked"
                notificationHandler.triggerNotification(title, message)
                self.sendMessage(["title":title,
                                  "msg":message])
            }
        }
       
    }
    
    func sendMessage(_ message: [String: Any]) {
        guard WCSession.default.activationState == .activated else {
            print("Connection Disconnected")
            return
        }
        // A reply handler block runs asynchronously on a background thread and should return quickly.
        WCSession.default.sendMessage(message, replyHandler: { replyMessage in
            print(message)
        }, errorHandler: { error in
            print(error)
        })
    }
}
