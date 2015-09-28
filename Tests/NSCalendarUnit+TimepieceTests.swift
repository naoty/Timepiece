//
//  NSCalendarUnit+TimepieceTests.swift
//  Timepiece
//
//  Created by Mattijs on 13/05/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Timepiece
import XCTest

class NSCalendarUnitTestCase: XCTestCase {
    func testCalendarUnitIntervals() {
        // some sanity checks
        XCTAssertLessThan(NSCalendarUnit.Nanosecond.interval, 1, "")
        XCTAssertEqual(NSCalendarUnit.Second.interval, 1)
        XCTAssertEqual(NSCalendarUnit.Minute.interval, 60)
        XCTAssertEqual(NSCalendarUnit.Hour.interval, 3600)
        XCTAssertEqual(NSCalendarUnit.Day.interval, 24 * 3600)
        XCTAssertEqual(NSCalendarUnit.WeekOfYear.interval, 7 * 24 * 3600)
        XCTAssertEqual(NSCalendarUnit.Month.interval, 30*86400, "")
        XCTAssertEqual(NSCalendarUnit.Quarter.interval, 146097/400/4*86400, "")
        XCTAssertEqual(NSCalendarUnit.Year.interval, 146097/400*86400, "")
        
        // some unsupported calendar units should return 0 as interval
        XCTAssert(NSCalendarUnit.Era.interval == 0)
        XCTAssert(NSCalendarUnit.Calendar.interval == 0)
        XCTAssert(NSCalendarUnit.TimeZone.interval == 0)
    }
}
