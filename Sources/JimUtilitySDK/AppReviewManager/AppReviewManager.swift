//
//  AppReviewManager.swift
//  
//
//  Created by James Layton on 7/23/20.
//

import Foundation
import StoreKit

public class AppReviewManager {
    
    public static func checkAppReview() {
        let defaultManager = DefaultManager.shared
        let launchCount = defaultManager.getUserInteger(key: "AppLaunchCount")
        if launchCount == 3 {
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            } else {
                // Don't show
            }
            defaultManager.setUserInteger(value: launchCount + 1, key: "AppLaunchCount")
        } else if launchCount < 3 {
            defaultManager.setUserInteger(value: launchCount + 1, key: "AppLaunchCount")
        }
    }
}
