//
//  DeviceManager.swift
//
//
//  Created by James Layton on 6/21/20.
//

#if canImport(UIKit)
import UIKit
#endif

public class DeviceManager {

    @MainActor
    public static func currentDeviceType() -> DeviceType {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone: return .phone
        case .pad:   return .pad
        default:     return .unKnown
        }
    }

    @available(*, deprecated, message: "phoneAgeType() is irrelevant for iOS 18+ — all supported devices (iPhone XS and later) have Face ID or modern form factors.")
    public static func phoneAgeType() -> DevicePhoneAge {
        return .other
    }
}
