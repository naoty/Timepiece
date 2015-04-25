//
//  Int+Timepiece.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/15.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Foundation

public extension Int {
    var year: Duration {
        return Duration(value: self, unit: .CalendarUnitYear)
    }
    var years: Duration {
        return year
    }
    
    var month: Duration {
        return Duration(value: self, unit: .CalendarUnitMonth)
    }
    var months: Duration {
        return month
    }
    
    var week: Duration {
        return Duration(value: self, unit: .CalendarUnitWeekOfYear)
    }
    var weeks: Duration {
        return week
    }
    
    var day: Duration {
        return Duration(value: self, unit: .CalendarUnitDay)
    }
    var days: Duration {
        return day
    }
    
    var hour: Duration {
        return Duration(value: self, unit: .CalendarUnitHour)
    }
    var hours: Duration {
        return hour
    }
    
    var minute: Duration {
        return Duration(value: self, unit: .CalendarUnitMinute)
    }
    var minutes: Duration {
        return minute
    }
    
    var second: Duration {
        return Duration(value: self, unit: .CalendarUnitSecond)
    }
    var seconds: Duration {
        return second
    }
}
