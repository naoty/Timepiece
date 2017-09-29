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

    /// Creates a instance calculated by the addition of `right` and `left`
    ///
    /// - parameter left:  The date components at left side.
    /// - parameter right: The date components at right side.
    ///
    /// - returns: Created `DateComponents` instance.
    static func + (left: DateComponents, right: DateComponents) -> DateComponents {
        var dateComponents = left

        if let year = right.year {
            dateComponents.year = (dateComponents.year ?? 0) + year
        }

        if let month = right.month {
            dateComponents.month = (dateComponents.month ?? 0) + month
        }

        if let day = right.day {
            dateComponents.day = (dateComponents.day ?? 0) + day
        }

        if let hour = right.hour {
            dateComponents.hour = (dateComponents.hour ?? 0) + hour
        }

        if let minute = right.minute {
            dateComponents.minute = (dateComponents.minute ?? 0) + minute
        }

        if let second = right.second {
            dateComponents.second = (dateComponents.second ?? 0) + second
        }

        if let nanosecond = right.nanosecond {
            dateComponents.nanosecond = (dateComponents.nanosecond ?? 0) + nanosecond
        }

        return dateComponents
    }

    /// Creates a instance calculated by the subtraction from `right` to `left`
    ///
    /// - parameter left:  The date components at left side.
    /// - parameter right: The date components at right side.
    ///
    /// - returns: Created `DateComponents` instance.
    static func - (left: DateComponents, right: DateComponents) -> DateComponents {
        return left + (-right)
    }

    /// Creates a `String` instance representing the receiver formatted in given units style.
    ///
    /// - parameter unitsStyle: The units style.
    ///
    /// - returns: The created a `String` instance.
    @available(OSX 10.10, *)
    public func string(in unitsStyle: DateComponentsFormatter.UnitsStyle) -> String? {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.unitsStyle = unitsStyle
        dateComponentsFormatter.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]

        return dateComponentsFormatter.string(from: self)
    }
}
