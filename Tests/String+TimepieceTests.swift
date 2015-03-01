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
    let birthday = NSDate.date(year: 1987, month: 6, day: 2)
    
    func testDateFromFormat() {
        if let date = "1987-06-02".dateFromFormat("yyyy-MM-dd") {
            XCTAssertEqual(date, birthday, "")
        }
    }
}
