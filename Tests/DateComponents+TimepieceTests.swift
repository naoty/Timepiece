//
//  DateComponents+TimepieceTests.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 10/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation
import Timepiece
import XCTest

class DateComponentsTests: XCTestCase {
    func testAgo() {
        var dateComponents = DateComponents()
        dateComponents.year = 1

        XCTAssertEqual(dateComponents.ago?.year, Date().year - 1)
    }

    func testLater() {
        var dateComponents = DateComponents()
        dateComponents.year = 1

        XCTAssertEqual(dateComponents.later?.year, Date().year + 1)
    }

    func testMinusPrefix() {
        var dateComponents = DateComponents()
        dateComponents.year = 1
        dateComponents.month = 1
        dateComponents.day = 1
        dateComponents.hour = 1
        dateComponents.minute = 1
        dateComponents.second = 1
        dateComponents.nanosecond = 1

        let inverse = -dateComponents
        XCTAssertEqual(inverse.year, -1)
        XCTAssertEqual(inverse.month, -1)
        XCTAssertEqual(inverse.day, -1)
        XCTAssertEqual(inverse.hour, -1)
        XCTAssertEqual(inverse.minute, -1)
        XCTAssertEqual(inverse.second, -1)
        XCTAssertEqual(inverse.nanosecond, -1)
    }
}
