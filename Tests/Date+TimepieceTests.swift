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

    func testToday() {
        let today = Date.today()
        let now = Date()

        XCTAssertEqual(today.year, now.year)
        XCTAssertEqual(today.month, now.month)
        XCTAssertEqual(today.day, now.day)
        XCTAssertEqual(today.hour, 0)
        XCTAssertEqual(today.minute, 0)
        XCTAssertEqual(today.second, 0)
    }

    func testYesterday() {
        let yesterday = Date.yesterday()
        let date = Date() - 1.day

        XCTAssertEqual(yesterday.year, date?.year)
        XCTAssertEqual(yesterday.month, date?.month)
        XCTAssertEqual(yesterday.day, date?.day)
        XCTAssertEqual(yesterday.hour, 0)
        XCTAssertEqual(yesterday.minute, 0)
        XCTAssertEqual(yesterday.second, 0)
    }

    func testTomorrow() {
        let tomorrow = Date.tomorrow()
        let date = Date() + 1.day

        XCTAssertEqual(tomorrow.year, date?.year)
        XCTAssertEqual(tomorrow.month, date?.month)
        XCTAssertEqual(tomorrow.day, date?.day)
        XCTAssertEqual(tomorrow.hour, 0)
        XCTAssertEqual(tomorrow.minute, 0)
        XCTAssertEqual(tomorrow.second, 0)
    }

    func testPlusDateComponents() {
        let date = Date(year: 2016, month: 1, day: 1)

        var dateComponents = DateComponents()
        dateComponents.month = 1

        let added = date + dateComponents
        XCTAssertEqual(added?.month, 2)
    }

    func testMinusDateComponents() {
        let date = Date(year: 2016, month: 1, day: 1)

        var dateComponents = DateComponents()
        dateComponents.month = 1

        let added = date - dateComponents
        XCTAssertEqual(added?.month, 12)
    }

    func testChanged() {
        let date = Date(year: 2014, month: 8, day: 14, hour: 20, minute: 25, second: 43, nanosecond: 0)
        let newDate = date.changed(year: 2017)

        XCTAssertEqual(newDate?.year, 2017)
        XCTAssertEqual(newDate?.month, 8)
        XCTAssertEqual(newDate?.day, 14)
        XCTAssertEqual(newDate?.hour, 20)
        XCTAssertEqual(newDate?.minute, 25)
        XCTAssertEqual(newDate?.second, 43)
        XCTAssertEqual(newDate?.nanosecond, 0)
    }

    func testChangedByWeekday() {
        let date = Date(year: 2014, month: 8, day: 14, hour: 20, minute: 25, second: 43, nanosecond: 0)
        let newDate = date.changed(weekday: 7)

        XCTAssertEqual(newDate?.year, 2014)
        XCTAssertEqual(newDate?.month, 8)
        XCTAssertEqual(newDate?.day, 16)
        XCTAssertEqual(newDate?.hour, 20)
        XCTAssertEqual(newDate?.minute, 25)
        XCTAssertEqual(newDate?.second, 43)
        XCTAssertEqual(newDate?.nanosecond, 0)
    }

    func testStringInStyles() {
        let sampleString = sample.string(inDateStyle: .short, andTimeStyle: .short)
        XCTAssertEqual(sampleString, "8/15/14, 8:25 PM")
    }

    func testDateString() {
        let sampleString = sample.dateString(in: .short)
        XCTAssertEqual(sampleString, "8/15/14")
    }

    func testTimeString() {
        let sampleString = sample.timeString(in: .short)
        XCTAssertEqual(sampleString, "8:25 PM")
    }
}
