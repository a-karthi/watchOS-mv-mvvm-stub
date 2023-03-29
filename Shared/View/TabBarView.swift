//
//  TabBarView.swift
//  SampleWatch
//
//  Created by @karthi on 29/03/23.
//

import SwiftUI

struct TabBarView: View {
    
    let notificationHandler = NotificationHandler()
    
    @StateObject var viewModel = CartoonListViewModel()
    
    var body: some View {
        TabView {
            CartoonListView(cartoonList: viewModel.cartoonList)
                        .tabItem {
                            Image(systemName: "list.bullet")
                        }
           LikedListView(cartoonList: viewModel.cartoonList)
                        .tabItem {
                            Image(systemName: "heart.fill")
                        }
        }
        .onAppear{
            if viewModel.cartoonList.isEmpty {
                viewModel.getCartoonListDetails()
            }
            notificationHandler.requestAuthorization()
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
