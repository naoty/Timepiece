//
//  NSDate+TimepieceTests.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/16.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Timepiece
import XCTest

class NSDateTestCase: XCTestCase {
    let now = NSDate()
    let calendar = NSCalendar.currentCalendar()
    var birthday: NSDate {
        let components = NSDateComponents()
        components.year = 1987
        components.month = 6
        components.day = 2
        components.hour = 0
        components.minute = 0
        components.second = 0
        return calendar.dateFromComponents(components)
    }
    
    func testPlus() {
        let tomorrow = calendar.dateByAddingUnit(.CalendarUnitDay, value: 1, toDate: now, options: .SearchBackwards)
        XCTAssertEqual(now + 1.day, tomorrow, "")
    }
    
    func testMinus() {
        let yesterday = calendar.dateByAddingUnit(.CalendarUnitDay, value: -1, toDate: now, options: .SearchBackwards)
        XCTAssertEqual(now - 1.day, yesterday, "")
    }
    
    func testSecond() {
        XCTAssertEqual(birthday.second, 0, "")
    }
    
    func testMinute() {
        XCTAssertEqual(birthday.minute, 0, "")
    }
    
    func testHour() {
        XCTAssertEqual(birthday.hour, 0, "")
    }
    
    func testDay() {
        XCTAssertEqual(birthday.day, 2, "")
    }
    
    func testMonth() {
        XCTAssertEqual(birthday.month, 6, "")
    }
    
    func testYear() {
        XCTAssertEqual(birthday.year, 1987, "")
    }
    
    func testToday() {
        let components = calendar.components(.YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit | .HourCalendarUnit | .MinuteCalendarUnit | .SecondCalendarUnit, fromDate: now)
        components.hour = 0
        components.minute = 0
        components.second = 0
        let today = calendar.dateFromComponents(components)
        XCTAssertEqual(NSDate.today(), today, "")
    }
    
    func testYesterday() {
        let components = calendar.components(.YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit | .HourCalendarUnit | .MinuteCalendarUnit | .SecondCalendarUnit, fromDate: now)
        components.day = now.day - 1
        components.hour = 0
        components.minute = 0
        components.second = 0
        let yesterday = calendar.dateFromComponents(components)
        XCTAssertEqual(NSDate.yesterday(), yesterday, "")
    }
    
    func testTomorrow() {
        let components = calendar.components(.YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit | .HourCalendarUnit | .MinuteCalendarUnit | .SecondCalendarUnit, fromDate: now)
        components.day = now.day + 1
        components.hour = 0
        components.minute = 0
        components.second = 0
        let tomorrow = calendar.dateFromComponents(components)
        XCTAssertEqual(NSDate.tomorrow(), tomorrow, "")
    }
}
