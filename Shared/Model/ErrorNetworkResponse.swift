//
//  ErrorResponseModel.swift
//  Smilables
//
//  Created by @karthi on 28/12/21.
//
import Foundation

class ErrorStatusResponse: Codable {
    let status: Int?
    let msg: String?

    enum CodingKeys: String, CodingKey {
        case status
        case msg
    }
}

class ErrorResponse: Codable {
    let status: ErrorStatusResponse?

    enum CodingKeys: String, CodingKey {
        case status
    }
}
