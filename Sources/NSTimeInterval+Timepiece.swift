//
//  NSTimeInterval+Timepiece.swift
//  Timepiece
//
//  Created by Mattijs on 10/05/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Foundation

/**
    This extension is deprecated in 0.4.1 and will be obsoleted in 0.5.0.

    The conversion of Duration into NSTimeInterval is performed under incorrect assumption that 1 month is always equal to 30 days.
    Therefore, The comparison between Duration and NSTimeInterval is also incorrect.
*/

public func < (lhs: NSTimeInterval, rhs: Duration) -> Bool {
    return lhs < rhs.interval
}

public func < (lhs: Duration, rhs: NSTimeInterval) -> Bool {
    return lhs.interval < rhs
}

public func > (lhs: NSTimeInterval, rhs: Duration) -> Bool {
    return lhs > rhs.interval
}

public func > (lhs: Duration, rhs: NSTimeInterval) -> Bool {
    return lhs.interval > rhs
}

public func == (lhs: NSTimeInterval, rhs: Duration) -> Bool {
    return lhs == rhs.interval
}

public func == (lhs: Duration, rhs: NSTimeInterval) -> Bool {
    return lhs.interval == rhs
}

public func >= (lhs: NSTimeInterval, rhs: Duration) -> Bool {
    return lhs >= rhs.interval
}

public func >= (lhs: Duration, rhs: NSTimeInterval) -> Bool {
    return lhs.interval >= rhs
}

public func <= (lhs: NSTimeInterval, rhs: Duration) -> Bool {
    return lhs <= rhs.interval
}

public func <= (lhs: Duration, rhs: NSTimeInterval) -> Bool {
    return lhs.interval <= rhs
}

public func != (lhs: NSTimeInterval, rhs: Duration) -> Bool {
    return lhs != rhs.interval
}

public func != (lhs: Duration, rhs: NSTimeInterval) -> Bool {
    return lhs.interval != rhs
}