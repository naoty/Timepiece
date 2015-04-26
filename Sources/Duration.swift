//
//  Duration.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/17.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Foundation

prefix func - (duration: Duration) -> (Duration) {
    return Duration(value: -duration.value, unit: duration.unit)
}

public class Duration {
    public let value: Int
    public let unit: NSCalendarUnit
    private let calendar = NSCalendar.currentCalendar()
    
    /**
        Initialize a date before a duration.
    */
    public var ago: NSDate {
        return calendar.dateByAddingDuration(-self, toDate: NSDate(), options: .SearchBackwards)!
    }
    
    /**
        Initialize a date after a duration.
    */
    public var later: NSDate {
        return calendar.dateByAddingDuration(self, toDate: NSDate(), options: .SearchBackwards)!
    }
    
    public init(value: Int, unit: NSCalendarUnit) {
        self.value = value
        self.unit = unit
    }
}
