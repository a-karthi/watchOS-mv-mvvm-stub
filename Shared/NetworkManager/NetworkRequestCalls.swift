//
//  NetworkRequestCalls.swift
//  Smilables
//
//  Created by @karthi on 29/12/21.
//

import Foundation
import UIKit

final class CartoonsGetNetworkRequest: NetworkRequest {
    init() {
        
        super.init(.get, authorizationRequirement: .never)
        
        path = APIConstants.endPointCartoonList
        
    }
}


//final class SamplePostNetworkRequest1: NetworkRequest {
//    init(_ params: Parameter) {
//        
//        super.init(.post, authorizationRequirement: .never)
//        
//        path = APIConstants.endPointCofeeHotList
//        
//        mode = .encodedURL
//        
//        parameter = params
//        
//    }
//}
//
//final class SamplePutNetworkRequest: NetworkRequest {
//    init(_ params: [String: String]) {
//        
//        super.init(.put, authorizationRequirement: .never)
//        
//        path = APIConstants.endPointCofeeHotList
//        
//        parameter = params
//        
//    }
//}
//
//
//final class SamplePostNetworkRequest: NetworkRequest {
//    init(_ params: JSON) {
//        
//        super.init(.post, authorizationRequirement: .required)
//        
//        path = APIConstants.endPointCofeeHotList
//        
//        mode = .encodedJSON
//        
//        if let jsonData = try? JSONSerialization.data(withJSONObject: params, options: []) {
//            parameterData = jsonData
//        }
//        
//    }
//}
//
//
//final class SampleGetNetworkRequest1: NetworkRequest {
//    init(_ params:Parameter) {
//        
//        super.init(.get, authorizationRequirement: .required)
//        
//        path = APIConstants.endPointCofeeHotList
//        
//        mode = .encodedURL
//        
//        parameter = params
//        
//    }
//}
//
//final class SampleDeleteNetworkRequest: NetworkRequest {
//    init(_ params:JSON) {
//        
//        super.init(.delete, authorizationRequirement: .required)
//        
//        path = APIConstants.endPointCofeeHotList
//        
//        mode = .encodedJSON
//        
//        if let jsonData = try? JSONSerialization.data(withJSONObject: params, options: []) {
//            parameterData = jsonData
//        }
//    }
//}
//
//
