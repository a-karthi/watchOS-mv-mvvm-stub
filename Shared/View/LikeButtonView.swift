//
//  LikeButtonView.swift
//  SampleWatch
//
//  Created by @karthi on 28/03/23.
//
import SwiftUI

struct LikeButtonView: View {
    @State var isLiked = false
    
    let notificationHandler = NotificationHandler()
    
    var body: some View {
        Button(action: {
            self.isLiked.toggle()
            self.request()
        }) {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .foregroundColor(isLiked ? .red : .gray)
        }
        
    }
    
    func request() {
        if isLiked {
            notificationHandler.requestAuthorization()
            notificationHandler.scheduleNotification(title: "CNTV", subtitle: "Liked!", body: "You Liked", date: Date())
        }
    }
}
