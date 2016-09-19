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
    let now = Date()
    // TODO: Stub calendar's timezone
    let calendar = NSCalendar.current
    var birthday: Date! {
        var components = DateComponents()
        components.year = 1987
        components.month = 6
        components.day = 2
        components.hour = 14
        components.minute = 10
        components.second = 11
        return calendar.date(from: components)
    }
    let cst = NSTimeZone(abbreviation: "CST")!
    
    func testPlus() {
        let nextDay = (calendar as NSCalendar).date(byAdding: .day, value: 1, to: now, options: .searchBackwards)!
        XCTAssertEqual(now + 1.day, nextDay, "")
        
        let nextWeek = (calendar as NSCalendar).date(byAdding: .weekOfYear, value: 1, to: now, options: .searchBackwards)!
        XCTAssertEqual(now + 1.week, nextWeek, "")
    }
    
    func testMinusWithDuration() {
        let lastDay = (calendar as NSCalendar).date(byAdding: .day, value: -1, to: now, options: .searchBackwards)!
        XCTAssertEqual(now - 1.day, lastDay, "")
        
        let lastWeek = (calendar as NSCalendar).date(byAdding: .weekOfYear, value: -1, to: now, options: .searchBackwards)!
        XCTAssertEqual(now - 1.week, lastWeek, "")
    }
    
    func testMinusWithDate() {
        let date1 = Date.date(year: 2015, month: 5, day: 1)
        let date2 = date1 + 1.hour
        
        XCTAssertTrue(date2 - date1 == 1.hour, "")
    }
    
    func testMinusWithDifferentTimeZone() {
        let date1 = Date.date(year: 2015, month: 5, day: 1)
        let date2 = (date1 + 1.hour).change(timeZone: cst)
        
        XCTAssertTrue(date2 - date1 == 1.hour, "")
    }
    
    func testEqual() {
        let date1 = Date.date(year: 2015, month: 5, day: 1)
        let date2 = "2015-05-01".dateFromFormat("yyyy-MM-dd", locale: Locale(identifier: "en-US"))
        let date3 = date1 - 1.second

        XCTAssertTrue(date1 == date2, "")
        XCTAssertTrue(date1 != date3, "")
    }
    
    func testEqualWithDifferentTimeZones() {
        let date1 = Date.date(year: 2015, month: 5, day: 1)
        let date2 = date1.change(timeZone: cst)
        
        XCTAssertTrue(date1 == date2, "")
    }

    func testCompare() {
        let date1 = Date.date(year: 2015, month: 5, day: 1)
        let date2 = date1 + 1.second
        let date3 = date1 - 1.second

        XCTAssertTrue(date1 <  date2, "")
        XCTAssertTrue(date1 <= date1, "")
        XCTAssertTrue(date1 >  date3, "")
        XCTAssertTrue(date1 >= date1, "")
    }
    
    func testCompareWithDifferentTimeZones() {
        let date1 = Date.date(year: 2015, month: 5, day: 1)
        let date2 = (date1 + 1.second).change(timeZone: cst)
        let date3 = (date1 - 1.second).change(timeZone: cst)
        
        XCTAssertTrue(date1 < date2, "")
        XCTAssertTrue(date1 <= date1, "")
        XCTAssertTrue(date1 > date3, "")
        XCTAssertTrue(date1 >= date1, "")
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
        XCTAssertEqual(birthday.hour, 14, "")
    }
    
    func testMinute() {
        XCTAssertEqual(birthday.minute, 10, "")
    }
    
    func testSecond() {
        XCTAssertEqual(birthday.second, 11, "")
    }
    
    func testDateWithYearAndMonthAndDayAndHourAndMinuteAndSecond() {
        XCTAssertEqual(Date.date(year: 1987, month: 6, day: 2, hour: 14, minute: 10, second: 11), birthday, "")
    }
    
    func testToday() {
        var components = (calendar as NSCalendar).components([.year, .month, .day, .hour, .minute, .second], from: now)
        components.hour = 0
        components.minute = 0
        components.second = 0
        let today = calendar.date(from: components)
        XCTAssertEqual(Date.today(), today!, "")
    }
    
    func testYesterday() {
        var components = (calendar as NSCalendar).components([.year, .month, .day, .hour, .minute, .second], from: now)
        components.day = now.day - 1
        components.hour = 0
        components.minute = 0
        components.second = 0
        let yesterday = calendar.date(from: components)
        XCTAssertEqual(Date.yesterday(), yesterday!, "")
    }
    
    func testTomorrow() {
        var components = (calendar as NSCalendar).components([.year, .month, .weekday, .hour, .minute, .second], from: now)
        components.day = now.day + 1
        components.hour = 0
        components.minute = 0
        components.second = 0
        let tomorrow = calendar.date(from: components)
        XCTAssertEqual(Date.tomorrow(), tomorrow!, "")
    }
    
    func testChange() {
//        XCTAssertEqual(now.change(year: 2000).year, 2000, "")
        XCTAssertEqual(now.change(month: 6).month, 6, "")
        XCTAssertEqual(now.change(day: 15).day, 15, "")
        XCTAssertEqual(now.change(hour: 9).hour, 9, "")
        XCTAssertEqual(now.change(minute: 30).minute, 30, "")
        XCTAssertEqual(now.change(second: 45).second, 45, "")
    }
    
    func testTimeIntervalDifference() {
        let oneMinuteFromNow = now + 1.minute
        let tenWeeksFromNow = now + 10.weeks
        
        XCTAssertEqual(oneMinuteFromNow - now, 60)
        XCTAssertEqualWithAccuracy(tenWeeksFromNow - now, 3600*24*7*10, accuracy: 3600)
    }
    
    func testChangeWeekday() {
        XCTAssertEqual(now.change(weekday: 1).weekday, 1, "")
    }
    
    func testChangeTimeZone() {
        let cstDate = now.change(timeZone: cst)
        XCTAssertEqual(cstDate.timeZone, cst, "")
        XCTAssertNotNil(cstDate.timeZone, "")
    }
    
    func testBeginningOf() {
        XCTAssertEqual(now.beginningOfYear.month, 1, "")
        XCTAssertEqual(now.beginningOfMonth.day, 1, "")
        XCTAssertEqual(now.beginningOfDay.hour, 0, "")
        XCTAssertEqual(now.beginningOfHour.minute, 0, "")
        XCTAssertEqual(now.beginningOfMinute.second, 0, "")
    }
	
	func testBeginningEndOfWeek() {
		let systemFirstWeekday = calendar.firstWeekday
		// Birthday was on tuesday (Tuesday, June 2, 1987)
		if systemFirstWeekday == 1 {
			// Weeks start on sunday:
			XCTAssertEqual(birthday.beginningOfWeek.month, 5, "")
			XCTAssertEqual(birthday.beginningOfWeek.day, 31, "")
			XCTAssertEqual(birthday.endOfWeek.month, 6, "")
			XCTAssertEqual(birthday.endOfWeek.day, 6, "")
		} else if systemFirstWeekday == 2 {
			// Weeks start on monday:
			XCTAssertEqual(birthday.beginningOfWeek.month, 6, "")
			XCTAssertEqual(birthday.beginningOfWeek.day, 1, "")
			XCTAssertEqual(birthday.endOfWeek.month, 6, "")
			XCTAssertEqual(birthday.endOfWeek.day, 7, "")
		}
	}
	
    func testEndOf() {
        XCTAssertEqual(now.endOfYear.month, 12, "")
        XCTAssertEqual(now.endOfDay.hour, 23, "")
        XCTAssertEqual(now.endOfHour.minute, 59, "")
        XCTAssertEqual(now.endOfMinute.second, 59, "")
    }
    
    func testEndOfMonth() {
        // Leap year
        let date = Date.date(year: 2012, month: 2, day: 1)
        XCTAssertEqual(date.endOfMonth.day, 29, "")
    }
    
    func testStringFromFormat() {
        let timestamp = birthday.stringFromFormat("yyyy-MM-dd HH:mm:ss")
        print(timestamp)
        XCTAssertEqual(timestamp, "1987-06-02 14:10:11", "")
    }
    
    func testLocalizedStringFromFormat() {
        let localizedStringFormatTestTemplate = "EEEE DD MM MMM MMMM"
        let timestampFR = birthday.stringFromFormat(localizedStringFormatTestTemplate, locale: Locale(identifier: "fr_FR"))
        XCTAssertEqual(timestampFR, "mardi 153 06 juin juin", "")
        
        let timestampCH = birthday.stringFromFormat(localizedStringFormatTestTemplate, locale: Locale(identifier: "de_CH"))
        XCTAssertEqual(timestampCH, "Dienstag 153 06 Juni Juni", "")
        
        let timestampUS = birthday.stringFromFormat(localizedStringFormatTestTemplate, locale: Locale(identifier: "en-US"))
        XCTAssertEqual(timestampUS, "Tuesday 153 06 Jun June", "")
    }
    
    func testLocalizedTimeWithSystemDefault() {
        let time = birthday.localizedTime()
        XCTAssertEqual(time, "2:10 PM")
    }
    
    func testLocalizedTimeWithDifferentLocale() {
        let time = birthday.localizedTime(Locale(identifier: "de_CH"))
        XCTAssertEqual(time, "14:10")
    }
    
}
