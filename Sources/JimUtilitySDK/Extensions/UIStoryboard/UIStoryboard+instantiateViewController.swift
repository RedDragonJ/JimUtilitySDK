//
//  UIStoryboard+instantiateViewController.swift
//  
//
//  Created by James Layton on 6/25/20.
//

#if os(Linux)
// Code specific to Linux
#elseif os(macOS)
// Code specific to macOS
#endif

#if canImport(UIKit)
import UIKit
#endif

public extension UIStoryboard {
    
    func instantiateInitialViewController<T>(as type: T.Type) -> T {
        guard let initialViewController = instantiateInitialViewController() else {
            fatalError("Expected initialViewController in storyboard: \(self)")
        }
        return CastManager.forceCast(initialViewController, to: type)
    }
    
    func instantiateViewController<T>(withIdentifier identifier: String, as type: T.Type) -> T {
        return CastManager.forceCast(instantiateViewController(withIdentifier: identifier), to: type)
    }
}
