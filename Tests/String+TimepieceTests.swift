//
//  String+TimepieceTests.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2015/03/01.
//  Copyright (c) 2015年 Naoto Kaneko. All rights reserved.
//

import Timepiece
import XCTest

class StringTests: XCTestCase {
    func testDateInFormat() {
        let date = "2014-08-15T20:25:43+0900".date(inFormat: "yyyy-MM-dd'T'HH:mm:ssZ")
        XCTAssertEqual(date?.year, 2014)
        XCTAssertEqual(date?.month, 8)
        XCTAssertEqual(date?.day, 15)
    }

    @available(iOS 10.0, OSX 10.12, *)
    func testDateInISO8601Format() {
        let date = "2014-08-15T20:25:43+0900".dateInISO8601Format()
        XCTAssertEqual(date?.year, 2014)
        XCTAssertEqual(date?.month, 8)
        XCTAssertEqual(date?.day, 15)
    }
}
