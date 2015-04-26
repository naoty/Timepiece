//
//  NSCalendar+Timepiece.swift
//  Timepiece
//
//  Created by Mattijs on 25/04/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Foundation

private let supportsDateByAddingUnit = NSCalendar.currentCalendar().respondsToSelector("dateByAddingUnit:value:toDate:options:")

extension NSCalendar {
    func dateByAddingDuration(duration: Duration, toDate date: NSDate, options opts: NSCalendarOptions) -> NSDate? {
        if supportsDateByAddingUnit {
            return dateByAddingUnit(duration.unit, value: duration.value, toDate: date, options: .SearchBackwards)!
        }
        else {
            // otherwise fallback to NSDateComponents
            return dateByAddingComponents(NSDateComponents(duration), toDate: date, options: .SearchBackwards)!
        }
    }
}
