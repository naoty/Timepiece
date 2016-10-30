//
//  Int+Timepiece.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/15.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Foundation

public extension Int {
    var year: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.year = self
        return dateComponents
    }

    var years: DateComponents {
        return year
    }

    var month: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.month = self
        return dateComponents
    }

    var months: DateComponents {
        return month
    }

    var week: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.day = 7 * self
        return dateComponents
    }

    var weeks: DateComponents {
        return week
    }

    var day: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.day = self
        return dateComponents
    }

    var days: DateComponents {
        return day
    }

    var hour: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.hour = self
        return dateComponents
    }

    var hours: DateComponents {
        return hour
    }

    var minute: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.minute = self
        return dateComponents
    }

    var minutes: DateComponents {
        return minute
    }

    var second: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.second = self
        return dateComponents
    }

    var seconds: DateComponents {
        return second
    }

    var nanosecond: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.nanosecond = self
        return dateComponents
    }

    var nanoseconds: DateComponents {
        return nanosecond
    }
}
