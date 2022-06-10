//
//  ProgressHUB.swift
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

public class ProgressHUB {
    
    private var progressIndicator: UIActivityIndicatorView!
    private var containerView: UIView!
    
    public static let shared = ProgressHUB()
    private init() {}
    
    public func showHUB(view: UIView) {
        containerView = UIView(frame: view.frame)
        containerView.backgroundColor = UIColor(r: 0, g: 0, b: 0, a: 0.5)
        
        progressIndicator = UIActivityIndicatorView(style: .large)
        progressIndicator.color = .white
        progressIndicator.center = containerView.center
        progressIndicator.startAnimating()
        containerView.addSubview(progressIndicator)
        view.addSubview(containerView)
    }
    
    public func hideHUB() {
        progressIndicator.stopAnimating()
        progressIndicator.removeFromSuperview()
        containerView.removeFromSuperview()
    }
}
