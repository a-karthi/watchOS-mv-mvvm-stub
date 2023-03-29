//
//  CartoonListView.swift
//  SampleWatch
//
//  Created by @karthi on 27/03/23.
//

import SwiftUI
    

struct CartoonListView: View {
    
    var cartoonList: CartoonList?
    
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
            }
        }
        
    }
}

struct CartoonListView_Previews: PreviewProvider {
    static var previews: some View {
        CartoonListView()
    }
}
