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
