//
//  CartoonListViewModel.swift
//  SampleWatch
//
//  Created by @karthi on 27/03/23.
//

import Foundation

class CartoonListViewModel: ObservableObject {
    
    @Published var cartoonList = CartoonList()

    // MARK: - Network Request
     func getCartoonListDetails() {
        let request = CartoonsGetNetworkRequest.init()
        NetworkManager.execute(request: request, responseType: CartoonList.self) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                self.cartoonList = data
            }
        }
    }
}
