//
//  File.swift
//  
//
//  Created by James Layton on 6/25/20.
//

import Foundation

public class CastManager {
    
    public static func forceCast<T>(_ object: Any, to type: T.Type) -> T {
        guard let typedObject = object as? T else {
            fatalError("Expected object: \(object) to be of type: \(type)")
        }
        return typedObject
    }
}
