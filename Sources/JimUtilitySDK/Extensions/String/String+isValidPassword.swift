//
//  File.swift
//  
//
//  Created by James Layton on 1/17/23.
//

import Foundation

public extension String {
    
    /// Ensure is a valid password
    /// Least 8 characters, Least 1 Uppercase Alphabet, Least 1 Lowercase Alphabet, Least 1 numeric Number, Least 1 Special Character
    /// - Returns: A boolean indicate if the password meet the requirements
    func isValidPassword() -> Bool {
        let pwRegEx =
            // Least 8 characters
            #"(?=.{8,})"# +

            // Least 1 Uppercase Alphabet
            #"(?=.*[A-Z])"# +
                
            // Least 1 Lowercase Alphabet
            #"(?=.*[a-z])"# +
                
            // Least 1 numeric Number
            #"(?=.*\d)"# +
                
            // Least 1 Special Character
            #"(?=.*[ !$%&?._-])"#
        
        let pwResult = NSPredicate(format:"SELF MATCHES %@", pwRegEx)
        return pwResult.evaluate(with: self)
    }
}
