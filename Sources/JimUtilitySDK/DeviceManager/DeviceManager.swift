//
//  DeviceManager.swift
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

public class DeviceManager {
    
    /** Find the current device type **/
    public static func currentDeviceType() -> DeviceType {
        let deviceID = UIDevice.current.userInterfaceIdiom
        switch deviceID {
        case .phone:
            return DeviceType.phone
        case .pad:
            return DeviceType.pad
        default:
            return DeviceType.unKnown
        }
    }
    
    /** Find out if the iphone device is older than iphoneX or not **/
    public static func phoneAgeType() -> DevicePhoneAge {
        let deviceName = UIDevice.modelName
        switch deviceName {
        case .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus,
             .iPhone7, .iPhone7Plus,
             .iPhone8, .iPhone8Plus:
            return .old
        case .iPhoneX, .iPhoneXr, .iPhoneXs, .iPhoneXsMax, .iPhone11, .iPhone11Pro, .iPhone11ProMax:
            return .new
        default:
            return .other
        }
    }
}
