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
public extension NSCalendarUnit {
    public var interval: NSTimeInterval {
        switch self {
        case NSCalendarUnit.Nanosecond:     return 1e-9                 // 1e-9 second
        case NSCalendarUnit.Second:     	return 1                    // 1 second
        case NSCalendarUnit.Minute:         return 60                   // 1 minute
        case NSCalendarUnit.Hour:           return 3600                 // 1 hour
        case NSCalendarUnit.Weekday,
             NSCalendarUnit.WeekdayOrdinal,
             NSCalendarUnit.Day:            return 86400                // 1 day
        case NSCalendarUnit.WeekOfYear,
             NSCalendarUnit.WeekOfMonth:    return 604800               // 7 days
        case NSCalendarUnit.Month:          return 2592000              // 30 days
        case NSCalendarUnit.YearForWeekOfYear,
             NSCalendarUnit.Quarter:        return 146097/400/4*86400   // ~91.31 days
        case NSCalendarUnit.Year:       	return 146097/400*86400     // ~365.25 days
        // 400 years have 146097 days (taking into account leap year rules)
            
        default:
            print("warn: .interval for NSCalendarUnit(\(self.rawValue)) can't be determined. Returning 0.")
            return 0
        }
    }
}
