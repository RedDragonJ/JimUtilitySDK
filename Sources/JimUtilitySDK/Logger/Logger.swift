//
//  Logger.swift
//
//
//  Created by James Layton on 6/21/20.
//

import Foundation

public class Logger {

    public static func log(_ message: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = K.DateFormat.LongDate
        print(formatter.string(from: Date()), "--->", message)
    }
}
