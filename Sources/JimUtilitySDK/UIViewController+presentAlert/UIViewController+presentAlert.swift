//
//  UIViewController+presentAlert.swift
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

public extension UIViewController {
    
    /** Alert view with one ok button and no action **/
    func presentAlert(title: String?, message: String?) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: K.Alert.Ok, style: .default, handler: nil))
        present(alertView, animated: true, completion: nil)
    }
    
    /** Alert view with one ok button and closure **/
    func presentAlert(title: String?, message: String?, action: @escaping (()->())) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: K.Alert.Ok, style: .default, handler: {(alertAction) in
            action()
        })
        alertView.addAction(okAction)
        present(alertView, animated: true, completion: nil)
    }
    
    /** Alert view with two buttons same closure **/
    func presentAlert(title: String?, message: String?, cancelAction: @escaping (()->()), okAction: @escaping (()->())) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: K.Alert.Cancel, style: .cancel, handler: {(alertAction) in
            cancelAction()
        })
        let okAction = UIAlertAction(title: K.Alert.Ok, style: .default, handler: {(alertAction) in
            okAction()
        })
        alertView.addAction(cancelAction)
        alertView.addAction(okAction)
        present(alertView, animated: true, completion: nil)
    }
    
    /** Alert view with closure for settings **/
    func presentAlertWithSettings(title: String?, message: String?) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: K.Alert.Settings, style: .cancel) {(alertAction) in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(settingsUrl, completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(settingsUrl)
                }
            }
        }
        alertView.addAction(settingsAction)
        present(alertView, animated: true, completion: nil)
    }
}

