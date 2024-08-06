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
    private static let lastReviewPromptDateKey = "LastReviewPromptDate"
    private static let hasReviewedKey = "HasReviewed"
    private static let reviewPromptInterval: TimeInterval = 72 * 60 * 60 // 72 hours in seconds

    // FOR UIKit
    /// Checks if the app review request should be presented to the user based on the review status and time interval.
    public static func checkAppReview() {
        let userDefaults = UserDefaults.standard
        let hasReviewed = userDefaults.bool(forKey: hasReviewedKey)
        let lastPromptDate = (userDefaults.object(forKey: lastReviewPromptDateKey) as? Date) ?? Date.distantPast
        let currentDate = Date()

        // Check if the user has already reviewed the app
        if hasReviewed {
            return
        }

        // Check if it's been 72 hours since the last review prompt
        let timeSinceLastPrompt = currentDate.timeIntervalSince(lastPromptDate)
        if timeSinceLastPrompt < reviewPromptInterval {
            return
        }

        // Prompt for review if criteria are met
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
            userDefaults.set(true, forKey: hasReviewedKey)
            userDefaults.set(currentDate, forKey: lastReviewPromptDateKey)
        }
    }

    // FOR SWIFTUI
    /// Checks if the app review request should be presented to the user based on the review status and time interval.
    public static func checkAppReview(completion: @escaping (Bool) -> Void) {
        let userDefaults = UserDefaults.standard
        let hasReviewed = userDefaults.bool(forKey: hasReviewedKey)
        let lastPromptDate = (userDefaults.object(forKey: lastReviewPromptDateKey) as? Date) ?? Date.distantPast
        let currentDate = Date()

        // Check if the user has already reviewed the app
        if hasReviewed {
            completion(false)
            return
        }

        // Check if it's been 72 hours since the last review prompt
        let timeSinceLastPrompt = currentDate.timeIntervalSince(lastPromptDate)
        if timeSinceLastPrompt < reviewPromptInterval {
            completion(false)
            return
        }

        // Update user defaults and call completion to request a review
        userDefaults.set(true, forKey: hasReviewedKey)
        userDefaults.set(currentDate, forKey: lastReviewPromptDateKey)
        completion(true)
    }
}
