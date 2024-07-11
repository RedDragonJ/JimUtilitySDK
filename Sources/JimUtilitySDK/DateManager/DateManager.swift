//
//  DateManager.swift
//  
//
//  Created by James Layton on 6/21/20.
//

import Foundation

public class DateManager {
    /// Converts a `Date` object to a string using the specified format.
    /// - Parameters:
    ///   - date: The `Date` object to be formatted.
    ///   - format: The format string used to format the date.
    /// - Returns: A string representation of the date in the specified format.
    public static func dateString(from date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }

    /// Converts a date string to a `Date` object using the specified format.
    /// - Parameters:
    ///   - dateString: The date string to be converted.
    ///   - format: The format string used to parse the date.
    /// - Returns: A `Date` object if the parsing is successful, otherwise `nil`.
    public static func date(from dateString: String, format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: dateString)
    }

    /// Converts a `Date` object to an ISO 8601 string.
    /// - Parameter date: The `Date` object to be formatted.
    /// - Returns: A string representation of the date in ISO 8601 format.
    public static func iso8601String(from date: Date) -> String {
        let formatter = ISO8601DateFormatter()
        return formatter.string(from: date)
    }

    /// Converts an ISO 8601 string to a `Date` object.
    /// - Parameter dateString: The ISO 8601 string to be converted.
    /// - Returns: A `Date` object if the parsing is successful, otherwise `nil`.
    public static func date(fromISO8601String dateString: String) -> Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: dateString)
    }

    /// Converts a date string from one format to another format.
    /// - Parameters:
    ///   - dateString: The date string to be converted.
    ///   - fromFormat: The format string used to parse the original date string.
    ///   - toFormat: The format string used to format the resulting date string.
    /// - Returns: A string representation of the date in the new format if the parsing is successful, otherwise `nil`.
    public static func formattedDateString(from dateString: String, fromFormat: String, toFormat: String) -> String? {
        guard let date = DateManager.date(from: dateString, format: fromFormat) else {
            return nil
        }
        return DateManager.dateString(from: date, format: toFormat)
    }

    // MARK: -  Commonly used date formats

    /// Converts a `Date` object to a short date string (e.g., "MM/dd/yyyy").
    /// - Parameter date: The `Date` object to be formatted.
    /// - Returns: A string representation of the date in "MM/dd/yyyy" format.
    public static func shortDateString(from date: Date) -> String {
        return dateString(from: date, format: "MM/dd/yyyy") // Ex: 01/16/2023
    }

    /// Converts a `Date` object to a full date string (e.g., "EEEE, MMM d, yyyy").
    /// - Parameter date: The `Date` object to be formatted.
    /// - Returns: A string representation of the date in "EEEE, MMM d, yyyy" format.
    public static func fullDateString(from date: Date) -> String {
        return dateString(from: date, format: "EEEE, MMM d, yyyy") // Ex: Monday, Jan 16, 2023
    }

    /// Converts a `Date` object to a time string (e.g., "h:mm a").
    /// - Parameter date: The `Date` object to be formatted.
    /// - Returns: A string representation of the time in "h:mm a" format.
    public static func timeString(from date: Date) -> String {
        return dateString(from: date, format: "h:mm a") // Ex: 3:45 PM
    }

    /// Converts a `Date` object to a date and time string (e.g., "MM/dd/yyyy h:mm a").
    /// - Parameter date: The `Date` object to be formatted.
    /// - Returns: A string representation of the date and time in "MM/dd/yyyy h:mm a" format.
    public static func dateTimeString(from date: Date) -> String {
        return dateString(from: date, format: "MM/dd/yyyy h:mm a") // Ex: 01/16/2023 3:45 PM
    }

    /// Converts a `Date` object to a short time string (e.g., "HH:mm").
    /// - Parameter date: The `Date` object to be formatted.
    /// - Returns: A string representation of the time in "HH:mm" format.
    public static func shortTimeString(from date: Date) -> String {
        return dateString(from: date, format: "HH:mm") // Ex: 15:45
    }

    /// Converts a `Date` object to a month, day, and year string (e.g., "MMM d, yyyy").
    /// - Parameter date: The `Date` object to be formatted.
    /// - Returns: A string representation of the date in "MMM d, yyyy" format.
    public static func monthDayYearString(from date: Date) -> String {
        return dateString(from: date, format: "MMM d, yyyy") // Ex: Jan 16, 2023
    }
}
