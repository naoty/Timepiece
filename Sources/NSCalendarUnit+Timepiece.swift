//
//  NSCalendarUnit+Timepiece.swift
//  Timepiece
//
//  Created by Mattijs on 13/05/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Foundation

public extension NSCalendarUnit {
    public var interval: NSTimeInterval {
        switch self {
        case NSCalendarUnit.CalendarUnitNanosecond:     return 1e-9                 // 1e-9 second
        case NSCalendarUnit.CalendarUnitSecond:     	return 1                    // 1 second
        case NSCalendarUnit.CalendarUnitMinute:         return 60                   // 1 minute
        case NSCalendarUnit.CalendarUnitHour:           return 3600                 // 1 hour
        case NSCalendarUnit.CalendarUnitWeekday,
             NSCalendarUnit.CalendarUnitWeekdayOrdinal,
             NSCalendarUnit.CalendarUnitDay:            return 86400                // 1 day
        case NSCalendarUnit.CalendarUnitWeekOfYear,
             NSCalendarUnit.CalendarUnitWeekOfMonth:    return 604800               // 7 days
        case NSCalendarUnit.CalendarUnitMonth:          return 2592000              // 30 days
        case NSCalendarUnit.CalendarUnitYearForWeekOfYear,
             NSCalendarUnit.CalendarUnitQuarter:        return 146097/400/4*86400   // ~91.31 days
        case NSCalendarUnit.CalendarUnitYear:       	return 146097/400*86400     // ~365.25 days
        // 400 years have 146097 days (taking into account leap year rules)
            
        default:
            println("warn: .interval for NSCalendarUnit(\(self.rawValue)) can't be determined. Returning 0.")
            return 0
        }
    }
}
