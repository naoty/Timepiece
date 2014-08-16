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
    
    func testPlus() {
        let tomorrow = calendar.dateByAddingUnit(.CalendarUnitDay, value: 1, toDate: now, options: .SearchBackwards)
        XCTAssertEqual(tomorrow, now + 1.day, "")
    }
    
    func testMinus() {
        let yesterday = calendar.dateByAddingUnit(.CalendarUnitDay, value: -1, toDate: now, options: .SearchBackwards)
        XCTAssertEqual(yesterday, now - 1.day, "")
    }
}
