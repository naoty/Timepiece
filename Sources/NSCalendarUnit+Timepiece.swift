//
//  NSCalendarUnit+Timepiece.swift
//  Timepiece
//
//  Created by Mattijs on 13/05/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Foundation

/**
    This extension is deprecated in 0.4.1 and will be obsoleted in 0.5.0.

    The conversion of Duration into NSTimeInterval is performed under incorrect assumption that 1 month is always equal to 30 days.
    Therefore, The comparison between Duration and NSTimeInterval is also incorrect.
*/
public extension Calendar.Component {
    public var interval: TimeInterval {
        switch self {
        case Calendar.Component.nanosecond:     return 1e-9                 // 1e-9 second
        case Calendar.Component.second:     	return 1                    // 1 second
        case Calendar.Component.minute:         return 60                   // 1 minute
        case Calendar.Component.hour:           return 3600                 // 1 hour
        case Calendar.Component.weekday,
             Calendar.Component.weekdayOrdinal,
             Calendar.Component.day:            return 86400                // 1 day
        case Calendar.Component.weekOfYear,
             Calendar.Component.weekOfMonth:    return 604800               // 7 days
        case Calendar.Component.month:          return 2592000              // 30 days
        case Calendar.Component.yearForWeekOfYear,
             Calendar.Component.quarter:        return 146097/400/4*86400   // ~91.31 days
        case Calendar.Component.year:       	return 146097/400*86400     // ~365.25 days
        // 400 years have 146097 days (taking into account leap year rules)
            
        default:
            print("warn: .interval for NSCalendarUnit(\(self)) can't be determined. Returning 0.")
            return 0
        }
    }
}
