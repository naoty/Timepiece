//
//  NSTimeIntervalTestCase.swift
//  Timepiece
//
//  Created by Mattijs on 10/05/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Timepiece
import XCTest

class NSTimeIntervalTestCase: XCTestCase {
    let now = NSDate()

    func testDurationComparison() {
        let oneMinuteFromNow = now + 1.minute
        let tenWeeksFromNow = now + 10.weeks
        
        XCTAssertEqual(oneMinuteFromNow - now, 60)
        XCTAssertEqualWithAccuracy(tenWeeksFromNow - now, 3600*24*7*10, accuracy: 3600)
        
        XCTAssert(oneMinuteFromNow - now < 61.seconds)
        XCTAssert(oneMinuteFromNow - now > 59.seconds)
        XCTAssert(oneMinuteFromNow - now == 60.seconds)
        XCTAssert(oneMinuteFromNow - now >= 59.seconds)
        XCTAssert(oneMinuteFromNow - now >= 60.seconds)
        XCTAssert(oneMinuteFromNow - now <= 60.seconds)
        XCTAssert(oneMinuteFromNow - now <= 61.seconds)
        XCTAssert(oneMinuteFromNow - now != 1.seconds)
        XCTAssertFalse(oneMinuteFromNow - now >= 61.seconds)
        XCTAssertFalse(oneMinuteFromNow - now <= 59.seconds)

        // Disabled because of DST problems
        // XCTAssert(tenWeeksFromNow - now == 10.week)
    }
}
