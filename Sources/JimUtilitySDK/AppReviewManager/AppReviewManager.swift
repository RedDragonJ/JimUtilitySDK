//
//  AppReviewManager.swift
//
//
//  Created by James Layton on 7/23/20.
//

import Foundation
import StoreKit
import UIKit

@MainActor
public class AppReviewManager {
    private static let hasLaunchedKey = "HasLaunched"
    private static let visitCountKey = "VisitCount"
    private static let reviewPromptThreshold = 5

    // FOR UIKit
    public static func checkAppReview() {
        let userDefaults = UserDefaults.standard

        if !userDefaults.bool(forKey: hasLaunchedKey) {
            userDefaults.set(true, forKey: hasLaunchedKey)
            return
        }

        var visitCount = userDefaults.integer(forKey: visitCountKey)
        visitCount += 1
        userDefaults.set(visitCount, forKey: visitCountKey)

        if visitCount > reviewPromptThreshold {
            userDefaults.set(0, forKey: visitCountKey)
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                AppStore.requestReview(in: scene)
            }
        }
    }

    // FOR SWIFTUI
    public static func checkAppReview() async -> Bool {
        let userDefaults = UserDefaults.standard

        if !userDefaults.bool(forKey: hasLaunchedKey) {
            userDefaults.set(true, forKey: hasLaunchedKey)
            return false
        }

        var visitCount = userDefaults.integer(forKey: visitCountKey)
        visitCount += 1
        userDefaults.set(visitCount, forKey: visitCountKey)

        if visitCount > reviewPromptThreshold {
            userDefaults.set(0, forKey: visitCountKey)
            return true
        }
        return false
    }

    @available(*, deprecated, message: "Use async/await version: await checkAppReview()")
    public static func checkAppReview(completion: @escaping @Sendable (Bool) -> Void) {
        Task { completion(await checkAppReview()) }
    }
}
