//
//  NSTimeInterval+Timepiece.swift
//  Timepiece
//
//  Created by Mattijs on 10/05/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Foundation

private let secondsPerUnitMap: [UInt: NSTimeInterval] = [
    NSCalendarUnit.CalendarUnitSecond.rawValue:1,
    NSCalendarUnit.CalendarUnitMinute.rawValue:60,
    NSCalendarUnit.CalendarUnitHour.rawValue:3600,
    NSCalendarUnit.CalendarUnitDay.rawValue:86400,
    NSCalendarUnit.CalendarUnitWeekOfYear.rawValue:604800]


public func < (lhs: NSTimeInterval, rhs: Duration) -> Bool {
    return compare(lhs, rhs) == .OrderedAscending
}

public func > (lhs: NSTimeInterval, rhs: Duration) -> Bool {
    return compare(lhs, rhs) == .OrderedDescending
}

public func == (lhs: NSTimeInterval, rhs: Duration) -> Bool {
    return compare(lhs, rhs) == .OrderedSame
}

public func != (lhs: NSTimeInterval, rhs: Duration) -> Bool {
    return compare(lhs, rhs) != .OrderedSame
}

private func compare(lhs: NSTimeInterval, rhs: Duration) -> NSComparisonResult {
    if let secondsPerUnit = secondsPerUnitMap[rhs.unit.rawValue] {
        let duration = secondsPerUnit * NSTimeInterval(rhs.value)
        return lhs > duration ? .OrderedDescending : lhs < duration ? .OrderedAscending : .OrderedSame
    }
    else {
        // Unsupperted duration unit (e.g. we can't compare month,year with NSTimeInterval since they are varying units
        fatalError("Can't compare NSTimeInterval with varying Duration unit \(rhs.unit). Only Duration of type seconds, minutes, hours, weeks are comparable.")
    }
}