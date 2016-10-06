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

open class Duration {
    open let value: Int
    open let unit: Calendar.Component
    fileprivate let calendar = Calendar.current
    
    /**
        Initialize a date before a duration.
    */
    open var ago: Date {
        return ago(from: Date())
    }
    
    open func ago(from date: Date) -> Date {
        return calendar.dateByAdding(duration: -self, to: date)!
    }
    
    /**
        Initialize a date after a duration.
    */
    open var later: Date {
        return later(from: Date())
    }
    
    open func later(from date: Date) -> Date {
        return calendar.dateByAdding(duration: self, to: date)!
    }
    
    /**
        This conversion is deprecated in 0.4.1 and will be obsoleted in 0.5.0.
    
        This operation is performed under incorrect assumption that 1 month is always equal to 30 days.
    */
    open lazy var interval: TimeInterval = { [unowned self] in
        return self.unit.interval * TimeInterval(self.value)
    }()
    
    public init(value: Int, unit: Calendar.Component) {
        self.value = value
        self.unit = unit
    }
}
