//
//  String+isValidEmail.swift
//  
//
//  Created by James Layton on 6/21/20.
//

import Foundation

public extension String {
    
    /// Ensure is a valid email
    /// - Returns: A boolean indicate if the email is real
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTestResult = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTestResult.evaluate(with: self)
    }
}
