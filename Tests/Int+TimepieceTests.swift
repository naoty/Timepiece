//
//  Int+TimepieceTests.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/15.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Timepiece
import XCTest

class IntTestCase: XCTestCase {
    func testSecond() {
        let (value, unit) = 1.second
        XCTAssertEqual(value, 1, "")
        XCTAssertEqual(unit, NSCalendarUnit.SecondCalendarUnit, "")
    }
    
    func testSeconds() {
        let (value, unit) = 2.seconds
        XCTAssertEqual(value, 2, "")
        XCTAssertEqual(unit, NSCalendarUnit.SecondCalendarUnit, "")
    }
    
    func testMinute() {
        let (value, unit) = 1.minute
        XCTAssertEqual(value, 1, "")
        XCTAssertEqual(unit, NSCalendarUnit.MinuteCalendarUnit, "")
    }
    
    func testMinutes() {
        let (value, unit) = 2.minutes
        XCTAssertEqual(value, 2, "")
        XCTAssertEqual(unit, NSCalendarUnit.MinuteCalendarUnit, "")
    }
    
    func testHour() {
        let (value, unit) = 1.hour
        XCTAssertEqual(value, 1, "")
        XCTAssertEqual(unit, NSCalendarUnit.HourCalendarUnit, "")
    }
    
    func testHours() {
        let (value, unit) = 2.hours
        XCTAssertEqual(value, 2, "")
        XCTAssertEqual(unit, NSCalendarUnit.HourCalendarUnit, "")
    }
    
    func testDay() {
        let (value, unit) = 1.day
        XCTAssertEqual(value, 1, "")
        XCTAssertEqual(unit, NSCalendarUnit.DayCalendarUnit, "")
    }
    
    func testDays() {
        let (value, unit) = 2.days
        XCTAssertEqual(value, 2, "")
        XCTAssertEqual(unit, NSCalendarUnit.DayCalendarUnit, "")
    }
    
    func testWeek() {
        let (value, unit) = 1.week
        XCTAssertEqual(value, 1, "")
        XCTAssertEqual(unit, NSCalendarUnit.WeekCalendarUnit, "")
    }
    
    func testWeeks() {
        let (value, unit) = 2.weeks
        XCTAssertEqual(value, 2, "")
        XCTAssertEqual(unit, NSCalendarUnit.WeekCalendarUnit, "")
    }
    
    func testMonth() {
        let (value, unit) = 1.month
        XCTAssertEqual(value, 1, "")
        XCTAssertEqual(unit, NSCalendarUnit.MonthCalendarUnit, "")
    }
    
    func testMonths() {
        let (value, unit) = 2.months
        XCTAssertEqual(value, 2, "")
        XCTAssertEqual(unit, NSCalendarUnit.MonthCalendarUnit, "")
    }
    
    func testYear() {
        let (value, unit) = 1.year
        XCTAssertEqual(value, 1, "")
        XCTAssertEqual(unit, NSCalendarUnit.YearCalendarUnit, "")
    }
    
    func testYears() {
        let (value, unit) = 2.years
        XCTAssertEqual(value, 2, "")
        XCTAssertEqual(unit, NSCalendarUnit.YearCalendarUnit, "")
    }
}
