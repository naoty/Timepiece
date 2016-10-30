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
        XCTAssertEqual(1.year.year, 1)
    }

    func testMonth() {
        XCTAssertEqual(1.month.month, 1)
    }

    func testWeek() {
        XCTAssertEqual(1.week.day, 7)
    }

    func testDay() {
        XCTAssertEqual(1.day.day, 1)
    }

    func testHour() {
        XCTAssertEqual(1.hour.hour, 1)
    }

    func testMinute() {
        XCTAssertEqual(1.minute.minute, 1)
    }

    func testSecond() {
        XCTAssertEqual(1.second.second, 1)
    }

    func testNanosecond() {
        XCTAssertEqual(1.nanosecond.nanosecond, 1)
    }
}
