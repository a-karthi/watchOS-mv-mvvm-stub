//
//  CartoonDetailView.swift
//  SampleWatch
//
//  Created by @karthi on 27/03/23.
//

import SwiftUI

struct CartoonDetailView: View {
    
    let cartoon: CartoonNetworkResponse?
    
    @State var data: Data?
    
    var body: some View {
        ScrollView {
            VStack {
                if let cart = cartoon,
                   let imageData = data,
                   let uiImage = UIImage(data: imageData){
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("\(cart.title) - \(cart.year)")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .multilineTextAlignment(.leading)
                        .padding(.leading,0)
                        .padding(.trailing,0)
                    Text(cart.genre.joined(separator: ","))
                        .fontWeight(.regular)
                        .font(.subheadline)
                        .padding(.leading,0)
                        .padding(.trailing,0)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    LikeButtonView(isLiked: cart.isLiked)
                } else {
                    ProgressView()
                        .onAppear {
                            self.fetchData(cartoon?.image ?? "")
                        }
                }
            }
        }
    }
    
    private func fetchData(_ urlString:String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

struct CartoonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CartoonDetailView(cartoon: nil)
    }
}
