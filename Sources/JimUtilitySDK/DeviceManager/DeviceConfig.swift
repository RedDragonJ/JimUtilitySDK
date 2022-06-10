//
//  DeviceConfig.swift
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

import SystemConfiguration

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
            case "iPhone7,2":                               return DeviceModel.iPhone6
            case "iPhone7,1":                               return DeviceModel.iPhone6Plus
            case "iPhone8,1":                               return DeviceModel.iPhone6s
            case "iPhone8,2":                               return DeviceModel.iPhone6sPlus
            case "iPhone9,1", "iPhone9,3":                  return DeviceModel.iPhone7
            case "iPhone9,2", "iPhone9,4":                  return DeviceModel.iPhone7Plus
            case "iPhone10,1", "iPhone10,4":                return DeviceModel.iPhone8
            case "iPhone10,2", "iPhone10,5":                return DeviceModel.iPhone8Plus
            case "iPhone10,3", "iPhone10,6":                return DeviceModel.iPhoneX
            case "iPhone11,2":                              return DeviceModel.iPhoneXs
            case "iPhone11,4", "iPhone11,6":                return DeviceModel.iPhoneXsMax
            case "iPhone11,8":                              return DeviceModel.iPhoneXr
            case "iPhone12,1":                              return DeviceModel.iPhone11
            case "iPhone12,3":                              return DeviceModel.iPhone11Pro
            case "iPhone12,5":                              return DeviceModel.iPhone11ProMax
            case "iPhone12,8":                              return DeviceModel.iPhoneSE2
            case "iPhone13,1":                              return DeviceModel.iPhone12mini
            case "iPhone13,2":                              return DeviceModel.iPhone12
            case "iPhone13,3":                              return DeviceModel.iPhone12Pro
            case "iPhone13,4":                              return DeviceModel.iPhone12ProMax
            case "iPhone14,4":                              return DeviceModel.iPhone13mini
            case "iPhone14,5":                              return DeviceModel.iPhone13
            case "iPhone14,2":                              return DeviceModel.iPhone13Pro
            case "iPhone14,3":                              return DeviceModel.iPhone13ProMax
            case "iPhone14,6":                              return DeviceModel.iPhoneSE3
            case "iPad3,1", "iPad3,2", "iPad3,3":           return DeviceModel.iPad
            case "iPad3,4", "iPad3,5", "iPad3,6":           return DeviceModel.iPad
            case "iPad4,1", "iPad4,2", "iPad4,3":           return DeviceModel.iPad
            case "iPad5,3", "iPad5,4":                      return DeviceModel.iPad
            case "iPad11,3", "iPad11,4":                    return DeviceModel.iPad
            case "iPad6,11", "iPad6,12":                    return DeviceModel.iPad
            case "iPad7,5", "iPad7,6":                      return DeviceModel.iPad
            case "iPad7,11", "iPad7,12":                    return DeviceModel.iPad
            case "iPad2,5", "iPad2,6", "iPad2,7":           return DeviceModel.iPad
            case "iPad4,4", "iPad4,5", "iPad4,6":           return DeviceModel.iPad
            case "iPad4,7", "iPad4,8", "iPad4,9":           return DeviceModel.iPad
            case "iPad5,1", "iPad5,2":                      return DeviceModel.iPad
            case "iPad11,1", "iPad11,2":                    return DeviceModel.iPad
            case "iPad6,3", "iPad6,4":                      return DeviceModel.iPad
            case "iPad6,7", "iPad6,8":                      return DeviceModel.iPad
            case "iPad7,1", "iPad7,2":                      return DeviceModel.iPad
            case "iPad7,3", "iPad7,4":                      return DeviceModel.iPad
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return DeviceModel.iPad
            case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return DeviceModel.iPad
            case "iPad8,9", "iPad8,10", "iPad8,11", "iPad8,12":return DeviceModel.iPad
            case "i386", "x86_64":                          return DeviceModel.simulator
            default:                                        return DeviceModel.others
            }
            #endif
        }
        return mapToDevice(identifier: identifier)
    }()
}

