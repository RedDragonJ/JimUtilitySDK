//
//  CastManager.swift
//  
//
//  Created by James Layton on 6/25/20.
//

import Foundation

public class CastManager {
    /// Forces the casting of an object to a specified type.
    /// - Parameters:
    ///   - object: The object to be cast.
    ///   - type: The type to which the object should be cast.
    /// - Returns: The object cast to the specified type.
    /// - Note: This method will cause a runtime crash if the object cannot be cast to the specified type.
    public static func forceCast<T>(_ object: Any, to type: T.Type) -> T {
        guard let typedObject = object as? T else {
            fatalError("Expected object: \(object) to be of type: \(type)")
        }
        return typedObject
    }
}
