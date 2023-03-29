//
//  LikedListView.swift
//  SampleWatch
//
//  Created by @karthi on 29/03/23.
//

import SwiftUI

struct LikedListView: View {
    
    var cartoonList: CartoonList?
    
    @State var likedList = CartoonList()
    
    var body: some View {
        NavigationStack {
            List(likedList) { cartoon in
                NavigationLink(destination: CartoonDetailView(cartoon: cartoon)) {
                    HStack {
                        URLImage(urlString: cartoon.image)
                        Text(verbatim: cartoon.title)
                    }
                }
            }
            .navigationTitle("Liked Cartoons")
            .onAppear {
                if let cartoons = cartoonList {
                    self.likedList = cartoons.filter({$0.isLiked == true})
                }
            }
        }
    }
}

struct LikedListView_Previews: PreviewProvider {
    static var previews: some View {
        LikedListView()
    }
}
