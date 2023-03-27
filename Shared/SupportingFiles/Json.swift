//
//  Json.swift
//  SampleTv
//
//  Created by @karthi on 20/03/23.
//

import UIKit
import Foundation

public typealias Parameter = [String: String]

public typealias JSON = [String: Any]

extension JSON{
    var statusCode : String{
        return Int(self["status_code"] as? String ?? String())?.description ?? Int().description
    }
    var isSuccess : Bool{
        return statusCode != "0"
    }
    var statusMessage:String {
        if let message =  self["status_message"] as? String, !message.isEmpty{
            return message
        }
        return self["success_message"] as? String ?? String()
        
    }
    func value<T>(forKeyPath path : String) -> T?{
        var keys = path.split(separator: ".")
        var childJSON = self
        let lastKey : String
        if let last = keys.last{
            lastKey = String(last)
        }else{
            lastKey = path
        }
        keys.removeLast()
        for key in keys{
            childJSON = childJSON.json(String(key))
        }
        return childJSON[lastKey] as? T
    }
    func array<T>(_ key : String) -> [T]{
        return self[key] as? [T] ?? [T]()
    }
    func array(_ key : String) -> [JSON]{
        return self[key] as? [JSON] ?? [JSON]()
    }
    func json(_ key : String) -> JSON{
        return self[key] as? JSON ?? JSON()
    }
    
    func string(_ key : String)-> String{
        // return self[key] as? String ?? String()
        let value = self[key]
        if let str = value as? String{
            return str
        }else if let int = value as? Int{
            return int.description
        }else if let double = value as? Double{
            return double.description
        }else{
            return String()
        }
    }
    
    func int(_ key : String)-> Int{
        //return self[key] as? Int ?? Int()
        let value = self[key]
        if let str = value as? String{
            return Int(str) ?? Int()
        }else if let int = value as? Int{
            return int
        }else if let double = value as? Double{
            return Int(double)
        }else{
            return Int()
        }
    }
    func double(_ key : String)-> Double{
        //return self[key] as? Double ?? Double()
        let value = self[key]
        if let str = value as? String{
            return Double(str) ?? Double()
        }else if let int = value as? Int{
            return Double(int)
        }else if let double = value as? Double{
            return double
        }else{
            return Double()
        }
    }
}


