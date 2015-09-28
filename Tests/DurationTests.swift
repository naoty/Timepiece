//
//  DurationTests.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/17.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Timepiece
import XCTest

class DurationTestCase: XCTestCase {
    
    func testAgo() {
        let today = NSDate()
        let oneDay = Duration(value: 1, unit: .Day)
        let yesterday = today - 1.day
        XCTAssertEqualWithAccuracy(oneDay.ago(from: today).timeIntervalSince1970, yesterday.timeIntervalSince1970, accuracy: 0.01, "")
    }
    
    func testLater() {
        let today = NSDate()
        let oneDay = Duration(value: 1, unit: .Day)
        let tomorrow = today + 1.day
        XCTAssertEqualWithAccuracy(oneDay.later(from: today).timeIntervalSince1970, tomorrow.timeIntervalSince1970, accuracy: 0.01, "")
    }
}
