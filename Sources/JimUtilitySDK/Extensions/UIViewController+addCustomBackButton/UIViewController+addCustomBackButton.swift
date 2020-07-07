//
//  UIViewController+addCustomBackButton.swift
//  
//
//  Created by James Layton on 7/7/20.
//

import UIKit

public extension UIViewController {
    func addCustomBackButton(imageName: String, title: String?, action: Selector?) {
        let backImage = UIImage(named: imageName)
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: action)
    }
}
