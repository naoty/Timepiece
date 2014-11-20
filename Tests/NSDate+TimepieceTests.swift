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
    var birthday: NSDate! {
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
        let tomorrow = calendar.dateByAddingUnit(.CalendarUnitDay, value: 1, toDate: now, options: .SearchBackwards)!
        XCTAssertEqual(now + 1.day, tomorrow, "")
    }
    
    func testMinus() {
        let yesterday = calendar.dateByAddingUnit(.CalendarUnitDay, value: -1, toDate: now, options: .SearchBackwards)!
        XCTAssertEqual(now - 1.day, yesterday, "")
    }
    
    func testYear() {
        XCTAssertEqual(birthday.year, 1987, "")
    }
    
    func testMonth() {
        XCTAssertEqual(birthday.month, 6, "")
    }
    
    func testDay() {
        XCTAssertEqual(birthday.day, 2, "")
    }
    
    func testHour() {
        XCTAssertEqual(birthday.hour, 0, "")
    }
    
    func testMinute() {
        XCTAssertEqual(birthday.minute, 0, "")
    }
    
    func testSecond() {
        XCTAssertEqual(birthday.second, 0, "")
    }
    
    func testDateWithYearAndMonthAndDayAndHourAndMinuteAndSecond() {
        XCTAssertEqual(NSDate.date(year: 1987, month: 6, day: 2), birthday, "")
    }
    
    func testToday() {
        let components = calendar.components(.YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit | .HourCalendarUnit | .MinuteCalendarUnit | .SecondCalendarUnit, fromDate: now)
        components.hour = 0
        components.minute = 0
        components.second = 0
        let today = calendar.dateFromComponents(components)
        XCTAssertEqual(NSDate.today(), today!, "")
    }
    
    func testYesterday() {
        let components = calendar.components(.YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit | .HourCalendarUnit | .MinuteCalendarUnit | .SecondCalendarUnit, fromDate: now)
        components.day = now.day - 1
        components.hour = 0
        components.minute = 0
        components.second = 0
        let yesterday = calendar.dateFromComponents(components)
        XCTAssertEqual(NSDate.yesterday(), yesterday!, "")
    }
    
    func testTomorrow() {
        let components = calendar.components(.YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit | .HourCalendarUnit | .MinuteCalendarUnit | .SecondCalendarUnit, fromDate: now)
        components.day = now.day + 1
        components.hour = 0
        components.minute = 0
        components.second = 0
        let tomorrow = calendar.dateFromComponents(components)
        XCTAssertEqual(NSDate.tomorrow(), tomorrow!, "")
    }
    
    func testChange() {
        XCTAssertEqual(now.change(year: 2000).year, 2000, "")
        XCTAssertEqual(now.change(month: 6).month, 6, "")
        XCTAssertEqual(now.change(day: 15).day, 15, "")
        XCTAssertEqual(now.change(hour: 9).hour, 9, "")
        XCTAssertEqual(now.change(minute: 30).minute, 30, "")
        XCTAssertEqual(now.change(second: 45).second, 45, "")
    }
    
    func testChangeWeekday() {
        XCTAssertEqual(now.change(weekday: 1).weekday, 1, "")
    }
    
    func testBeginningOf() {
        XCTAssertEqual(now.beginningOfYear.month, 1, "")
        XCTAssertEqual(now.beginningOfMonth.day, 1, "")
        XCTAssertEqual(now.beginningOfDay.hour, 0, "")
        XCTAssertEqual(now.beginningOfHour.minute, 0, "")
        XCTAssertEqual(now.beginningOfMinute.second, 0, "")
    }
    
    func testEndOf() {
        XCTAssertEqual(now.endOfYear.month, 12, "")
        XCTAssertEqual(now.endOfDay.hour, 23, "")
        XCTAssertEqual(now.endOfHour.minute, 59, "")
        XCTAssertEqual(now.endOfMinute.second, 59, "")
    }
    
    func testEndOfMonth() {
        // Leap year
        let date = NSDate.date(year: 2012, month: 2, day: 1)
        XCTAssertEqual(date.endOfMonth.day, 29, "")
    }
}
