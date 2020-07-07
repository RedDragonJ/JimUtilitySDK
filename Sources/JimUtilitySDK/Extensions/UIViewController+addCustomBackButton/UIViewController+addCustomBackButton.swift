//
//  UIViewController+addCustomBackButton.swift
//  
//
//  Created by James Layton on 7/7/20.
//

import UIKit

public extension UIViewController {
    func addCustomBarButton(imageName: String, direction: BarButtonDirection, action: Selector) {
        let customImage = UIImage(named: imageName)
        switch direction {
        case .left:
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: customImage, style: .plain, target: self, action: action)
        case .right:
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: customImage, style: .plain, target: self, action: action)
        }
    }
    
    func addCustomBarButton(title: String, direction: BarButtonDirection, action: Selector) {
        switch direction {
        case .left:
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: action)
        case .right:
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: action)
        }
    }
}
