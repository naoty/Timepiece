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
    func testYear() {
        XCTAssertEqual(1.year.value, 1, "")
        XCTAssertEqual(1.year.unit, NSCalendarUnit.CalendarUnitYear, "")
    }
    
    func testYears() {
        XCTAssertEqual(2.years.value, 2, "")
        XCTAssertEqual(2.years.unit, NSCalendarUnit.CalendarUnitYear, "")
    }
    
    func testMonth() {
        XCTAssertEqual(1.month.value, 1, "")
        XCTAssertEqual(1.month.unit, NSCalendarUnit.CalendarUnitMonth, "")
    }
    
    func testMonths() {
        XCTAssertEqual(2.months.value, 2, "")
        XCTAssertEqual(2.months.unit, NSCalendarUnit.CalendarUnitMonth, "")
    }
    
    func testWeek() {
        XCTAssertEqual(1.week.value, 1, "")
        XCTAssertEqual(1.week.unit, NSCalendarUnit.CalendarUnitWeekOfYear, "")
    }
    func testWeeks() {
        XCTAssertEqual(2.weeks.value, 2, "")
        XCTAssertEqual(2.weeks.unit, NSCalendarUnit.CalendarUnitWeekOfYear, "")
    }
    
    func testDay() {
        XCTAssertEqual(1.day.value, 1, "")
        XCTAssertEqual(1.day.unit, NSCalendarUnit.CalendarUnitDay, "")
    }
    
    func testDays() {
        XCTAssertEqual(2.days.value, 2, "")
        XCTAssertEqual(2.days.unit, NSCalendarUnit.CalendarUnitDay, "")
    }
    
    func testHour() {
        XCTAssertEqual(1.hour.value, 1, "")
        XCTAssertEqual(1.hour.unit, NSCalendarUnit.CalendarUnitHour, "")
    }
    
    func testHours() {
        XCTAssertEqual(2.hours.value, 2, "")
        XCTAssertEqual(2.hours.unit, NSCalendarUnit.CalendarUnitHour, "")
    }
    
    func testMinute() {
        XCTAssertEqual(1.minute.value, 1, "")
        XCTAssertEqual(1.minute.unit, NSCalendarUnit.CalendarUnitMinute, "")
    }
    
    func testMinutes() {
        XCTAssertEqual(2.minutes.value, 2, "")
        XCTAssertEqual(2.minutes.unit, NSCalendarUnit.CalendarUnitMinute, "")
    }
    
    func testSecond() {
        XCTAssertEqual(1.second.value, 1, "")
        XCTAssertEqual(1.second.unit, NSCalendarUnit.CalendarUnitSecond, "")
    }
    
    func testSeconds() {
        XCTAssertEqual(2.seconds.value, 2, "")
        XCTAssertEqual(2.seconds.unit, NSCalendarUnit.CalendarUnitSecond, "")
    }
}
