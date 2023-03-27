//
//  String.swift
//  SampleTv
//
//  Created by @karthi on 20/03/23.
//

import Foundation
import UIKit

extension String {
    
    /// Converting the html string to attributed string to display
    var htmlToAttributedString: NSAttributedString? {
        guard
            let data = self.data(using: .utf8)
        else { return nil }
        do {
            return try NSAttributedString(data: data, options: [
                NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
                NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue
            ], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    
    /// Converting html string to string to display
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    /// Removing the tags from the Strig to display
    var htmlStripped : String {
        return self.replacingOccurrences(of: " <[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
    ///Checks whether the string is empty or with space values.
    var isReallyEmpty: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

/// Email validation
/// - Parameter email: Email given by the user
/// - Returns: Returns true if the given email is valid otherwise false
public func isValidEmail(email: String) -> Bool {

    let emailRegExpression = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
    let predicateValue = NSPredicate(format: "SELF MATCHES %@", emailRegExpression)
    return predicateValue.evaluate(with: email)

}

public func attributedFontText(_ originalString:String,_ wantedString:String,_ wantedFont:UIFont,_ regularFont:UIFont) -> NSMutableAttributedString{

    let longestWordRange = (originalString as NSString).range(of: wantedString)

    let attributedString = NSMutableAttributedString(string: originalString, attributes: [NSAttributedString.Key.font : regularFont])

    attributedString.setAttributes([NSAttributedString.Key.font : wantedFont], range: longestWordRange)
    
    return attributedString
}

extension String {

    // .*[!&^%$#@()/]+.*
    // .*[!&^%$#@()/_*+-]+.*

    /// Determining whether the given string contains special character.
    /// Returns true if it contais otherwise returns false
    var containsSpecialCharacter: Bool {
        let regex = ".*[:}?{!&>|=<^%$#@()./_*+-]+.*"
        let testString = NSPredicate(format: "SELF MATCHES %@", regex)
        return testString.evaluate(with: self)
    }

    /// Determining whether the given string contains upper case character.
    /// Returns true if it contais otherwise returns false
    var containsUpperCaseCharacter: Bool {
        let regex = ".*[A-Z]+.*"
        let testString = NSPredicate(format: "SELF MATCHES %@", regex)
        return testString.evaluate(with: self)
    }

    /// Determining whether the given string contains lower case character.
    /// Returns true if it contais otherwise returns false
    var containsLowerCaseCharacter: Bool {
        let regex = ".*[a-z]+.*"
        let testString = NSPredicate(format: "SELF MATCHES %@", regex)
        return testString.evaluate(with: self)
    }

    /// Determining whether the given string contains number character.
    /// Returns true if it contais otherwise returns false
    var containsNumberCharacter: Bool {
        let regex = ".*[0-9]+.*"
        let testString = NSPredicate(format: "SELF MATCHES %@", regex)
        return testString.evaluate(with: self)
    }

}

extension String {

    /// Characters which are alloweed to form url encoded string
    static let formUrlencodedAllowedCharacters =
        CharacterSet(charactersIn: "0123456789" +
                        "abcdefghijklmnopqrstuvwxyz" +
                        "ABCDEFGHIJKLMNOPQRSTUVWXYZ" +
                        "-._* ")

    /// Forming url encode string with the above characters
    /// - Returns: Returns a url encoded string
    public func formUrlencoded() -> String {
        let encoded = addingPercentEncoding(withAllowedCharacters: String.formUrlencodedAllowedCharacters)
        return encoded?.replacingOccurrences(of: " ", with: "+") ?? ""
    }
}

extension String {
    func removingWhitespaces() -> String {
            return components(separatedBy: .whitespaces).joined()
    }
}
