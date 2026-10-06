//
//  DeviceConfig.swift
//
//
//  Created by James Layton on 6/21/20.
//

#if canImport(UIKit)
import UIKit
#endif

public extension UIDevice {

    static let modelName: DeviceModel = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        func mapToDevice(identifier: String) -> DeviceModel {
            #if os(iOS)
            switch identifier {
            // iPhone XS / XR (oldest iOS 18 supported)
            case "iPhone11,2":                                  return .iPhoneXs
            case "iPhone11,4", "iPhone11,6":                    return .iPhoneXsMax
            case "iPhone11,8":                                  return .iPhoneXr
            // iPhone 11
            case "iPhone12,1":                                  return .iPhone11
            case "iPhone12,3":                                  return .iPhone11Pro
            case "iPhone12,5":                                  return .iPhone11ProMax
            // iPhone SE 2nd gen
            case "iPhone12,8":                                  return .iPhoneSE2
            // iPhone 12
            case "iPhone13,1":                                  return .iPhone12mini
            case "iPhone13,2":                                  return .iPhone12
            case "iPhone13,3":                                  return .iPhone12Pro
            case "iPhone13,4":                                  return .iPhone12ProMax
            // iPhone 13
            case "iPhone14,4":                                  return .iPhone13mini
            case "iPhone14,5":                                  return .iPhone13
            case "iPhone14,2":                                  return .iPhone13Pro
            case "iPhone14,3":                                  return .iPhone13ProMax
            // iPhone SE 3rd gen
            case "iPhone14,6":                                  return .iPhoneSE3
            // iPhone 14
            case "iPhone14,7":                                  return .iPhone14
            case "iPhone14,8":                                  return .iPhone14Plus
            case "iPhone15,2":                                  return .iPhone14Pro
            case "iPhone15,3":                                  return .iPhone14ProMax
            // iPhone 15
            case "iPhone15,4":                                  return .iPhone15
            case "iPhone15,5":                                  return .iPhone15Plus
            case "iPhone16,1":                                  return .iPhone15Pro
            case "iPhone16,2":                                  return .iPhone15ProMax
            // iPhone 16
            case "iPhone17,3":                                  return .iPhone16
            case "iPhone17,4":                                  return .iPhone16Plus
            case "iPhone17,1":                                  return .iPhone16Pro
            case "iPhone17,2":                                  return .iPhone16ProMax
            // iPhone SE 4th gen
            case "iPhone17,5":                                  return .iPhoneSE4
            // iPad
            case let id where id.hasPrefix("iPad"):             return .iPad
            // Simulator
            case "i386", "x86_64", "arm64":                    return .simulator
            default:                                            return .others
            }
            #endif
        }
        return mapToDevice(identifier: identifier)
    }()
}
