//
//  NSDateComponents+Timepiece.swift
//  Timepiece
//
//  Created by Mattijs on 25/04/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Foundation

public extension DateComponents {
    init(_ duration: Duration) {
        self.init()
        switch duration.unit{
        case Calendar.Component.day:
            day = duration.value
        case Calendar.Component.weekday:
            weekday = duration.value
        case Calendar.Component.weekOfMonth:
            weekOfMonth = duration.value
        case Calendar.Component.weekOfYear:
            weekOfYear = duration.value
        case Calendar.Component.hour:
            hour = duration.value
        case Calendar.Component.minute:
            minute = duration.value
        case Calendar.Component.month:
            month = duration.value
        case Calendar.Component.second:
            second = duration.value
        case Calendar.Component.year:
            year = duration.value
        default:
            () // unsupported / ignore
        }
    }
}
