//
//  NSTimeInterval+Timepiece.swift
//  Timepiece
//
//  Created by Mattijs on 10/05/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Foundation

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