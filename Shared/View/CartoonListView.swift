//
//  CartoonListView.swift
//  SampleWatch
//
//  Created by @karthi on 27/03/23.
//

import SwiftUI
    

struct CartoonListView: View {
    @StateObject var viewModel = CartoonListViewModel()
    @State var selectedCartoon: CartoonNetworkResponse?
    var body: some View {
        NavigationStack {
            List(viewModel.cartoonList) { cartoon in
                NavigationLink(destination: CartoonDetailView(cartoon: cartoon)) {
                    HStack {
                        URLImage(urlString: cartoon.image)
                        Text(verbatim: cartoon.title)
                    }
                }
            }
            .navigationTitle("Cartoons")
            .onAppear{
                viewModel.getCartoonListDetails()
            }
        }
    }
}

struct CartoonListView_Previews: PreviewProvider {
    static var previews: some View {
        CartoonListView()
    }
}
