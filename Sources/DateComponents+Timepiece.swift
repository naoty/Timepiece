//
//  DateComponents+Timepiece.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 10/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation

public extension DateComponents {
    var ago: Date? {
        return Calendar.current.date(byAdding: -self, to: Date())
    }

    var later: Date? {
        return Calendar.current.date(byAdding: self, to: Date())
    }

    /// Creates inverse `DateComponents`
    ///
    /// - parameter rhs: A `DateComponents`
    ///
    /// - returns: A created inverse `DateComponents`
    static prefix func -(rhs: DateComponents) -> DateComponents {
        var dateComponents = DateComponents()

        if let year = rhs.year {
            dateComponents.year = -year
        }

        if let month = rhs.month {
            dateComponents.month = -month
        }

        if let day = rhs.day {
            dateComponents.day = -day
        }

        if let hour = rhs.hour {
            dateComponents.hour = -hour
        }

        if let minute = rhs.minute {
            dateComponents.minute = -minute
        }

        if let second = rhs.second {
            dateComponents.second = -second
        }

        if let nanosecond = rhs.nanosecond {
            dateComponents.nanosecond = -nanosecond
        }

        return dateComponents
    }
}
