//
//  DateManager.swift
//  
//
//  Created by James Layton on 6/21/20.
//

import Foundation

public class DateManager {
    
    /** Convert the date to string **/
    public static func convertToString(_ date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    /** Convert the string to date with current time zone **/
    public static func convertToDate(_ str: String, format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone.current
        guard let formattedDate = formatter.date(from: str) else {
            print("ERROR: The date is nil")
            return nil
        }
        return formattedDate
    }
}
