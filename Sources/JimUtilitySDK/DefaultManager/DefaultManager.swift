//
//  DefaultManager.swift
//  
//
//  Created by James Layton on 7/20/20.
//

import Foundation

public class DefaultManager {
    
    static let shared = DefaultManager()
    private let standard = UserDefaults.standard
    private init() {}

}

// MARK: - Special methods
public extension DefaultManager {
    
    func isFirstTimeLaunch() -> Bool {
        let firstTimeKey = "isFirstTimeLaunch"
        if standard.bool(forKey: firstTimeKey) {
            return true
        } else {
            standard.set(true, forKey: firstTimeKey)
            return false
        }
    }
}
