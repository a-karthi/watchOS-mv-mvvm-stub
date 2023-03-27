//
//  ImageDownloader.swift
//  SampleTv
//
//  Created by @karthi on 21/03/23.
//

import Foundation
import UIKit

class ImageDownloader {
    class func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(UIImage(data: data))
            }
        }.resume()
    }
}
