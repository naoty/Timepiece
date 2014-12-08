//
//  Duration.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/17.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Foundation

public class Duration {
    public let value: Int
    public let unit: NSCalendarUnit
    private let calendar = NSCalendar.currentCalendar()
    
    /**
        Initialize a date before a duration.
    */
    public var ago: NSDate {
        return calendar.dateByAddingUnit(unit, value: -value, toDate: NSDate(), options: .SearchBackwards)!
    }
    
    /**
        Initialize a date after a duration.
    */
    public var later: NSDate {
        return calendar.dateByAddingUnit(unit, value: value, toDate: NSDate(), options: .SearchBackwards)!
    }
    
    public init(value: Int, unit: NSCalendarUnit) {
        self.value = value
        self.unit = unit
    }
}
