//
//  FormattedDecimalNumber.swift
//
//
//  Created by James Layton on 7/11/24.
//

import Foundation

public extension String {
    func FormattedDecimalNumber(_ maximumFractionDigits: Int = 0) -> String? {
        guard let number = Double(self) else { return nil }

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = maximumFractionDigits  // Optional: Adjust if you want to show decimals

        return formatter.string(from: NSNumber(value: number))
    }
}

