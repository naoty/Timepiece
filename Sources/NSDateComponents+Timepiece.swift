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
        case NSCalendarUnit.CalendarUnitDay:
            day = duration.value
        case NSCalendarUnit.CalendarUnitWeekday:
            weekday = duration.value
        case NSCalendarUnit.CalendarUnitWeekOfMonth:
            weekOfMonth = duration.value
        case NSCalendarUnit.CalendarUnitWeekOfYear:
            weekOfYear = duration.value
        case NSCalendarUnit.CalendarUnitHour:
            hour = duration.value
        case NSCalendarUnit.CalendarUnitMinute:
            minute = duration.value
        case NSCalendarUnit.CalendarUnitMonth:
            month = duration.value
        case NSCalendarUnit.CalendarUnitSecond:
            second = duration.value
        case NSCalendarUnit.CalendarUnitYear:
            year = duration.value
        default:
            () // unsupported / ignore
        }
    }
}
