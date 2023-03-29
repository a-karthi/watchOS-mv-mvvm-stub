//
//  LikeButtonView.swift
//  SampleWatch
//
//  Created by @karthi on 28/03/23.
//
import SwiftUI

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
                notificationHandler.triggerNotification()
            }
        }
    }
}
