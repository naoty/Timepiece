//
//  NSDate+Timepiece.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/16.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Foundation

public func + (left: NSDate, right: (value: Int, unit: NSCalendarUnit)) -> NSDate {
    return NSCalendar.currentCalendar().dateByAddingUnit(right.unit, value: right.value, toDate: left, options: .SearchBackwards)
}

public func - (left: NSDate, right: (value: Int, unit: NSCalendarUnit)) -> NSDate {
    return NSCalendar.currentCalendar().dateByAddingUnit(right.unit, value: -right.value, toDate: left, options: .SearchBackwards)
}

public extension NSDate {
    var second: Int {
        return components.second
    }
    
    var minute: Int {
        return components.minute
    }
    
    var hour: Int {
        return components.hour
    }
    
    var day: Int {
        return components.day
    }
    
    var month: Int {
        return components.month
    }
    
    var year: Int {
        return components.year
    }
    
    private var components: NSDateComponents {
        return calendar.components(.YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit | .HourCalendarUnit | .MinuteCalendarUnit | .SecondCalendarUnit, fromDate: self)
    }
    
    private var calendar: NSCalendar {
        return NSCalendar.currentCalendar()
    }
    
    class func today() -> NSDate {
        let now = NSDate()
        let components = now.components
        components.hour = 0
        components.minute = 0
        components.second = 0
        return now.calendar.dateFromComponents(components)
    }
    
    class func yesterday() -> NSDate {
        return today() - 1.day
    }
    
    class func tomorrow() -> NSDate {
        return today() + 1.day
    }
}