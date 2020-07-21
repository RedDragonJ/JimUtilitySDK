//
//  DefaultManager.swift
//  
//
//  Created by James Layton on 7/20/20.
//

import Foundation

public class DefaultManager {
    
    public static let shared = DefaultManager()
    private let standard = UserDefaults.standard
    private init() {}

    public func setUserInteger(value: Int, key: String) {
        standard.set(value, forKey: key)
    }
    
    public func getUserInteger(key: String) -> Int {
        return standard.integer(forKey: key)
    }
}

// MARK: - Special methods
public extension DefaultManager {
    
    func isFirstTimeLaunch() -> Bool {
        let firstTimeKey = "isFirstTimeLaunch"
        if standard.bool(forKey: firstTimeKey) {
            return false
        } else {
            standard.set(true, forKey: firstTimeKey)
            return true
        }
    }
}
