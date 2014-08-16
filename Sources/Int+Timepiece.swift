//
//  Int+Timepiece.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/15.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Foundation

public extension Int {
    var second: (Int, NSCalendarUnit) {
        return (self, .SecondCalendarUnit)
    }
    var seconds: (Int, NSCalendarUnit) {
        return self.second
    }
    
    var minute: (Int, NSCalendarUnit) {
        return (self, .MinuteCalendarUnit)
    }
    var minutes: (Int, NSCalendarUnit) {
        return self.minute
    }
    
    var hour: (Int, NSCalendarUnit) {
        return (self, .HourCalendarUnit)
    }
    var hours: (Int, NSCalendarUnit) {
        return self.hour
    }
    
    var day: (Int, NSCalendarUnit) {
        return (self, .DayCalendarUnit)
    }
    var days: (Int, NSCalendarUnit) {
        return self.day
    }
    
    var week: (Int, NSCalendarUnit) {
        return (self, .WeekCalendarUnit)
    }
    var weeks: (Int, NSCalendarUnit) {
        return self.week
    }
    
    var month: (Int, NSCalendarUnit) {
        return (self, .MonthCalendarUnit)
    }
    var months: (Int, NSCalendarUnit) {
        return self.month
    }
    
    var year: (Int, NSCalendarUnit) {
        return (self, .YearCalendarUnit)
    }
    var years: (Int, NSCalendarUnit) {
        return self.year
    }
}
