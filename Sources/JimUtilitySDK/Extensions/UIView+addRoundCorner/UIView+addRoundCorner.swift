//
//  UIView+addRoundCorner.swift
//  
//
//  Created by James Layton on 7/9/20.
//

#if os(Linux)
// Code specific to Linux
#elseif os(macOS)
// Code specific to macOS
#endif

#if canImport(UIKit)
import UIKit
#endif

public extension UIView {
    func addRoundCorner(radius: CGFloat, by: CGFloat, isClipsToBound: Bool = false) {
        clipsToBounds = isClipsToBound
        layer.cornerRadius = radius / by
    }
}
