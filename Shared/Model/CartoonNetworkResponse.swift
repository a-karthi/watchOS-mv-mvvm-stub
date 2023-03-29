//
//  CartoonNetworkResponse.swift
//  SampleWatch
//
//  Created by @karthi on 27/03/23.
//

import Foundation


// MARK: - CartoonNetworkResponse
class CartoonNetworkResponse: Codable, Identifiable {
    let title: String
    let year: Int
    let creator: Creator
    let rating: String
    let genre: [String]
    let runtime_in_minutes, episodes: Int
    let image: String
    let id: Int
    var isLiked = false

    enum CodingKeys: String, CodingKey {
        case title, year, creator, rating, genre
        case runtime_in_minutes
        case episodes, image, id
    }
}

enum Creator: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Creator.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Creator"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}


typealias CartoonList = [CartoonNetworkResponse]
