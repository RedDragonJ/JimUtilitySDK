//
//  UIView+addShadow.swift
//  
//
//  Created by James Layton on 7/7/20.
//

import UIKit

public extension UIView {
    func addShadow(offSet: CGSize?, color: UIColor?) {
        layer.shadowOpacity = 1
        layer.shadowRadius = 2.5
        layer.shadowOffset = offSet ?? .zero
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.shadowColor = color?.cgColor ?? UIColor.black.cgColor
    }
}
