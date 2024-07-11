//
//  AppReviewManager.swift
//  
//
//  Created by James Layton on 7/23/20.
//

import Foundation
import StoreKit

public class AppReviewManager {
    /// Checks if the app review request should be presented to the user based on the launch count.
    /// - Parameter frequencyCount: The number of app launches after which the review request should be presented. The default value is 3.
    public static func checkAppReview(frequencyCount: Int = 3) {
        let defaultManager = DefaultManager.shared
        let launchCount = defaultManager.getUserInteger(key: "AppLaunchCount")
        if launchCount == frequencyCount {
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
            defaultManager.setUserInteger(value: 0, key: "AppLaunchCount")
        } else if launchCount < frequencyCount {
            defaultManager.setUserInteger(value: launchCount + 1, key: "AppLaunchCount")
        }
    }
}
