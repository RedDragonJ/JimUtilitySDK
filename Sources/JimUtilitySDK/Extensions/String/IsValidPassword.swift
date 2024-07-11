//
//  IsValidPassword.swift
//  
//
//  Created by James Layton on 1/17/23.
//

import Foundation

public extension String {
    
    /// Ensure is a valid password
    /// Least 8 characters, Least 1 Uppercase Alphabet, Least 1 Lowercase Alphabet, Least 1 numeric Number, Least 1 Special Character
    /// - Returns: A boolean indicate if the password meet the requirements
    func isValidPassword() -> String? {

        var errorMessage: String?
        
        if self.count < 8 {
            if let errorMsg = errorMessage {
                errorMessage = errorMsg + "• Minimum 8 characters\n"
            } else {
                errorMessage = "• Minimum 8 characters\n"
            }
        }
        
        if !checkRegex(with: self, regex: ".*[A-Z]+.*") {
            if let errorMsg = errorMessage {
                errorMessage = errorMsg + "• 1 Uppercase Alphabet\n"
            } else {
                errorMessage = "• 1 Uppercase Alphabet\n"
            }
        }
        
        if !checkRegex(with: self, regex: ".*[a-z]+.*") {
            if let errorMsg = errorMessage {
                errorMessage = errorMsg + "• 1 Lowercase Alphabet\n"
            } else {
                errorMessage = "• 1 Lowercase Alphabet\n"
            }
        }
            
        if !checkRegex(with: self, regex: ".*[0-9]+.*") {
            if let errorMsg = errorMessage {
                errorMessage = errorMsg + "• 1 Numeric Number\n"
            } else {
                errorMessage = "• 1 Numeric Number\n"
            }
        }
        
        if !checkRegex(with: self, regex: ".*[!&^%$#@()/]+.*") {
            if let errorMsg = errorMessage {
                errorMessage = errorMsg + "• 1 Special Character\n"
            } else {
                errorMessage = "• 1 Special Character\n"
            }
        }
        
        return errorMessage
    }
    
    private func checkRegex(with source: String, regex: String) -> Bool {
        let result = NSPredicate(format: "SELF MATCHES %@", regex)
        return result.evaluate(with: self)
    }
}
