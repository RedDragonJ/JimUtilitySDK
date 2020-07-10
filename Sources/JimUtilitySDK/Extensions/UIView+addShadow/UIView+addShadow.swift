//
//  UIView+addShadow.swift
//  
//
//  Created by James Layton on 7/7/20.
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
    func addShadow(color: UIColor?, offSet: CGSize = .zero, radius: CGFloat = 10, opacity: Float = 1) {
        layer.masksToBounds = false
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowColor = color
    }
}
