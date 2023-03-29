//
//  CartoonListView.swift
//  SampleWatch
//
//  Created by @karthi on 27/03/23.
//

import SwiftUI
    

struct CartoonListView: View {
    
    var cartoonList: CartoonList?
    
    let notificationHandler = NotificationHandler()
    
    @StateObject var notificationObserver = NotificationObserver()
    
    @State var selectedCartoon: CartoonNetworkResponse?
    
    var body: some View {
        NavigationStack {
            if let list = cartoonList {
                List(list) { cartoon in
                    NavigationLink(destination: CartoonDetailView(cartoon: cartoon)) {
                        HStack {
                            URLImage(urlString: cartoon.image)
                            Text(verbatim: cartoon.title)
                        }
                    }
                }
                .navigationTitle("Cartoons")
                .onChange(of: notificationObserver.payLoad) { payLoad in
                    if payLoad != nil {
                        print("***---> Connectivity Communication <---*** \(String(describing: payLoad?.payload?.message))")
                        if let title = payLoad?.payload?.title,
                           let msg = payLoad?.payload?.message {
                            self.notificationHandler.triggerNotification(title, msg)
                        }
                    }
                }
            }
        }
        
    }
}

struct CartoonListView_Previews: PreviewProvider {
    static var previews: some View {
        CartoonListView()
    }
}
