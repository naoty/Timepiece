//
//  NSDate+Timepiece.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/16.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Foundation

public func + (lhs: NSDate, rhs: Duration) -> NSDate {
    return NSCalendar.currentCalendar().dateByAddingUnit(rhs.unit, value: rhs.value, toDate: lhs, options: .SearchBackwards)
}

public func - (lhs: NSDate, rhs: Duration) -> NSDate {
    return NSCalendar.currentCalendar().dateByAddingUnit(rhs.unit, value: -rhs.value, toDate: lhs, options: .SearchBackwards)
}

public extension NSDate {
    var year: Int {
        return components.year
    }
    
    var month: Int {
        return components.month
    }
    
    var day: Int {
        return components.day
    }
    
    var hour: Int {
        return components.hour
    }
    
    var minute: Int {
        return components.minute
    }
    
    var second: Int {
        return components.second
    }
    
    private var components: NSDateComponents {
        return calendar.components(.YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit | .HourCalendarUnit | .MinuteCalendarUnit | .SecondCalendarUnit, fromDate: self)
    }
    
    private var calendar: NSCalendar {
        return NSCalendar.currentCalendar()
    }
    
    // MARK: - Initialize
    
    class func date(#year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) -> NSDate {
        let now = NSDate()
        let components = now.components
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        return now.calendar.dateFromComponents(components)
    }
    
    class func today() -> NSDate {
        let now = NSDate()
        return NSDate.date(year: now.year, month: now.month, day: now.day)
    }
    
    class func yesterday() -> NSDate {
        return today() - 1.day
    }
    
    class func tomorrow() -> NSDate {
        return today() + 1.day
    }
}