//
//  AppReviewManager.swift
//
//
//  Created by James Layton on 7/23/20.
//

import Foundation
import StoreKit
import UIKit

public class AppReviewManager {
    private static let hasLaunchedKey = "HasLaunched"
    private static let visitCountKey = "VisitCount"
    private static let reviewPromptThreshold = 5 // Number of visits before prompting for review

    // FOR UIKit
    /// Checks if the app review request should be presented to the user based on the review status and time interval.
    public static func checkAppReview() {
        let userDefaults = UserDefaults.standard

        // Check if this is the first launch
        if !userDefaults.bool(forKey: hasLaunchedKey) {
            userDefaults.set(true, forKey: hasLaunchedKey)
            return
        }

        var visitCount = userDefaults.integer(forKey: visitCountKey)

        // Increment the visit count
        visitCount += 1
        userDefaults.set(visitCount, forKey: visitCountKey)

        // Check if the visit count has reached the threshold
        if visitCount > reviewPromptThreshold {
            // Reset the visit count after prompting for review
            userDefaults.set(0, forKey: visitCountKey)
            
            // Prompt for review if criteria are met
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
    }

    // FOR SWIFTUI
    /// Checks if the app review request should be presented to the user based on the review status and time interval.
    public static func checkAppReview(completion: @escaping (Bool) -> Void) {
        let userDefaults = UserDefaults.standard

        // Check if this is the first launch
        if !userDefaults.bool(forKey: hasLaunchedKey) {
            userDefaults.set(true, forKey: hasLaunchedKey)
            completion(false)
            return
        }

        var visitCount = userDefaults.integer(forKey: visitCountKey)

        // Increment the visit count
        visitCount += 1
        userDefaults.set(visitCount, forKey: visitCountKey)

        // Check if the visit count has reached the threshold
        if visitCount > reviewPromptThreshold {
            // Reset the visit count after prompting for review
            userDefaults.set(0, forKey: visitCountKey)
            completion(true)
        } else {
            completion(false)
        }
    }
}
