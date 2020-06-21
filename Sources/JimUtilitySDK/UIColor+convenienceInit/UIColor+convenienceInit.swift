//
//  UIColor+convenienceInit.swift
//  
//
//  Created by James Layton on 6/21/20.
//

#if os(Linux)
// Code specific to Linux
#elseif os(macOS)
// Code specific to macOS
#endif

#if canImport(UIKit)
import UIKit
#endif

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}
