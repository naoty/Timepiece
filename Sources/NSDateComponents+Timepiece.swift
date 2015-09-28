//
//  NSDateComponents+Timepiece.swift
//  Timepiece
//
//  Created by Mattijs on 25/04/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Foundation

public extension NSDateComponents {
    convenience init(_ duration: Duration) {
        self.init()
        switch duration.unit{
        case NSCalendarUnit.Day:
            day = duration.value
        case NSCalendarUnit.Weekday:
            weekday = duration.value
        case NSCalendarUnit.WeekOfMonth:
            weekOfMonth = duration.value
        case NSCalendarUnit.WeekOfYear:
            weekOfYear = duration.value
        case NSCalendarUnit.Hour:
            hour = duration.value
        case NSCalendarUnit.Minute:
            minute = duration.value
        case NSCalendarUnit.Month:
            month = duration.value
        case NSCalendarUnit.Second:
            second = duration.value
        case NSCalendarUnit.Year:
            year = duration.value
        default:
            () // unsupported / ignore
        }
    }
}
