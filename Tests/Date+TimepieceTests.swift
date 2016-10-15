//
//  Date+TimepieceTests.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 10/15/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Timepiece
import XCTest

class DateTests: XCTestCase {
    private var sample: Date {
        return Date(year: 2014, month: 8, day: 15, hour: 20, minute: 25, second: 43)
    }
    
    func testYear() {
        XCTAssertEqual(sample.year, 2014)
    }

    func testMonth() {
        XCTAssertEqual(sample.month, 8)
    }

    func testDay() {
        XCTAssertEqual(sample.day, 15)
    }

    func testHour() {
        XCTAssertEqual(sample.hour, 20)
    }

    func testMinute() {
        XCTAssertEqual(sample.minute, 25)
    }

    func testSecond() {
        XCTAssertEqual(sample.second, 43)
    }

    func testNanosecond() {
        XCTAssertEqual(sample.nanosecond, 0)
    }

    func testWeekday() {
        XCTAssertEqual(sample.weekday, 6)
    }

    func testInit() {
        let heisei = 235
        var japaneseCalendar = Calendar(identifier: .japanese)
        japaneseCalendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!
        let date = Date(era: heisei, year: 26, month: 8, day: 15, hour: 20, minute: 25, second: 43, nanosecond: 0, on: japaneseCalendar)

        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "GMT")!
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond, .weekday], from: date)
        XCTAssertEqual(dateComponents.year, 2014)
        XCTAssertEqual(dateComponents.month, 8)
        XCTAssertEqual(dateComponents.day, 15)
        XCTAssertEqual(dateComponents.hour, 11)
        XCTAssertEqual(dateComponents.minute, 25)
        XCTAssertEqual(dateComponents.second, 43)
        XCTAssertEqual(dateComponents.nanosecond, 0)
        XCTAssertEqual(dateComponents.weekday, 6)
    }

    func testInitForTime() {
        let date = Date(year: 2014, month: 8, day: 15, hour: 20, minute: 25, second: 43)

        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond, .weekday], from: date)
        XCTAssertEqual(dateComponents.year, 2014)
        XCTAssertEqual(dateComponents.month, 8)
        XCTAssertEqual(dateComponents.day, 15)
        XCTAssertEqual(dateComponents.hour, 20)
        XCTAssertEqual(dateComponents.minute, 25)
        XCTAssertEqual(dateComponents.second, 43)
        XCTAssertEqual(dateComponents.nanosecond, 0)
        XCTAssertEqual(dateComponents.weekday, 6)
    }

    func testInitForDate() {
        let date = Date(year: 2014, month: 8, day: 15)

        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond, .weekday], from: date)
        XCTAssertEqual(dateComponents.year, 2014)
        XCTAssertEqual(dateComponents.month, 8)
        XCTAssertEqual(dateComponents.day, 15)
        XCTAssertEqual(dateComponents.weekday, 6)
    }
}
