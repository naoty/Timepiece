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
        XCTAssertLessThan(NSCalendarUnit.CalendarUnitNanosecond.interval, 1, "")
        XCTAssertEqual(NSCalendarUnit.CalendarUnitSecond.interval, 1)
        XCTAssertEqual(NSCalendarUnit.CalendarUnitMinute.interval, 60)
        XCTAssertEqual(NSCalendarUnit.CalendarUnitHour.interval, 3600)
        XCTAssertEqual(NSCalendarUnit.CalendarUnitDay.interval, 24 * 3600)
        XCTAssertEqual(NSCalendarUnit.CalendarUnitWeekOfYear.interval, 7 * 24 * 3600)
        XCTAssertEqual(NSCalendarUnit.CalendarUnitMonth.interval, 30*86400, "")
        XCTAssertEqual(NSCalendarUnit.CalendarUnitQuarter.interval, 146097/400/4*86400, "")
        XCTAssertEqual(NSCalendarUnit.CalendarUnitYear.interval, 146097/400*86400, "")
        
        // some unsupported calendar units should return 0 as interval
        XCTAssert(NSCalendarUnit.CalendarUnitEra.interval == 0)
        XCTAssert(NSCalendarUnit.CalendarUnitCalendar.interval == 0)
        XCTAssert(NSCalendarUnit.CalendarUnitTimeZone.interval == 0)
    }
}
