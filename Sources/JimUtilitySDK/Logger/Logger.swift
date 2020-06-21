//
//  Logger.swift
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

public class Logger {
    
    /** Custom logging method */
    public static func log(_ message: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = K.DateFormat.LongDate
        print(formatter.string(from: Date()), "--->", message)
    }
}
