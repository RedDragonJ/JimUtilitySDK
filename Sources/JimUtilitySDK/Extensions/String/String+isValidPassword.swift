//
//  File.swift
//  
//
//  Created by James Layton on 1/17/23.
//

import Foundation

public extension String {
    
    /// Ensure is a valid password
    /// Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet and 1 Number
    /// - Returns: A boolean indicate if the password meet the requirements
    func isValidPassword() -> Bool {
        let pwRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        let pwResult = NSPredicate(format:"SELF MATCHES %@", pwRegEx)
        return pwResult.evaluate(with: self)
    }
}
