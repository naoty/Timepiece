//
//  String+Timepiece.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2015/03/01.
//  Copyright (c) 2015年 Naoto Kaneko. All rights reserved.
//

import Foundation

public extension String {
    // MARK - Parse into NSDate
    
    @available(*, deprecated: 2.0, renamed: "dateFromFormat(_:locale:)")
    func dateFromFormat(_ format: String) -> Date? {
        return dateFromFormat(format, locale: DateFormatter().locale)
    }
    
    func dateFromFormat(_ format: String, locale: Locale) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
}
