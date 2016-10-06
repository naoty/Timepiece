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
        XCTAssertLessThan(Calendar.Component.nanosecond.interval, 1, "")
        XCTAssertEqual(Calendar.Component.second.interval, 1)
        XCTAssertEqual(Calendar.Component.minute.interval, 60)
        XCTAssertEqual(Calendar.Component.hour.interval, 3600)
        XCTAssertEqual(Calendar.Component.day.interval, 24 * 3600)
        XCTAssertEqual(Calendar.Component.weekOfYear.interval, 7 * 24 * 3600)
        XCTAssertEqual(Calendar.Component.month.interval, 30*86400, "")
        XCTAssertEqual(Calendar.Component.quarter.interval, 146097/400/4*86400, "")
        XCTAssertEqual(Calendar.Component.year.interval, 146097/400*86400, "")
        
        // some unsupported calendar units should return 0 as interval
        XCTAssert(Calendar.Component.era.interval == 0)
        XCTAssert(Calendar.Component.calendar.interval == 0)
        XCTAssert(Calendar.Component.timeZone.interval == 0)
    }
}
