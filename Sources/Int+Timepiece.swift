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
        return Duration(value: self, unit: .Year)
    }
    var years: Duration {
        return year
    }
    
    var month: Duration {
        return Duration(value: self, unit: .Month)
    }
    var months: Duration {
        return month
    }
    
    var week: Duration {
        return Duration(value: self, unit: .WeekOfYear)
    }
    var weeks: Duration {
        return week
    }
    
    var day: Duration {
        return Duration(value: self, unit: .Day)
    }
    var days: Duration {
        return day
    }
    
    var hour: Duration {
        return Duration(value: self, unit: .Hour)
    }
    var hours: Duration {
        return hour
    }
    
    var minute: Duration {
        return Duration(value: self, unit: .Minute)
    }
    var minutes: Duration {
        return minute
    }
    
    var second: Duration {
        return Duration(value: self, unit: .Second)
    }
    var seconds: Duration {
        return second
    }
}
