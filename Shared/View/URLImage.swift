//
//  URLImage.swift
//  SampleWatch
//
//  Created by @karthi on 27/03/23.
//

import SwiftUI

struct URLImage: View {
    
    @State var data: Data?
    let urlString: String
    
    var body: some View {
        if let data = data, let image = UIImage(data: data) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.accentColor)
        } else {
            ProgressView()
                .onAppear {
                    self.fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}
