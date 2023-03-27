//
//  CartoonNetworkResponse.swift
//  SampleWatch
//
//  Created by @karthi on 27/03/23.
//

import Foundation


// MARK: - Element
class CartoonNetworkResponse: Codable, Identifiable {
    let title: String
    let year: Int
    let creator: [String]
    let rating: String
    let genre: [String]
    let runtime_in_minutes, episodes: Int
    let image: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case title, year, creator, rating, genre
        case runtime_in_minutes
        case episodes, image, id
    }
}

typealias CartoonList = [CartoonNetworkResponse]
