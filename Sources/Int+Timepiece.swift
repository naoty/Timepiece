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
        return Duration(value: self, unit: .year)
    }
    var years: Duration {
        return year
    }
    
    var month: Duration {
        return Duration(value: self, unit: .month)
    }
    var months: Duration {
        return month
    }
    
    var week: Duration {
        return Duration(value: self, unit: .weekOfYear)
    }
    var weeks: Duration {
        return week
    }
    
    var day: Duration {
        return Duration(value: self, unit: .day)
    }
    var days: Duration {
        return day
    }
    
    var hour: Duration {
        return Duration(value: self, unit: .hour)
    }
    var hours: Duration {
        return hour
    }
    
    var minute: Duration {
        return Duration(value: self, unit: .minute)
    }
    var minutes: Duration {
        return minute
    }
    
    var second: Duration {
        return Duration(value: self, unit: .second)
    }
    var seconds: Duration {
        return second
    }
}
