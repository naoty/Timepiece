//
//  String+Timepiece.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2015/03/01.
//  Copyright (c) 2015年 Naoto Kaneko. All rights reserved.
//

import Foundation

extension String {
    /// Creates a `Date` instance representing the receiver parsed into `Date` in a given format.
    ///
    /// - parameter format: The format to be used to parse.
    ///
    /// - returns: The created `Date` instance.
    public func date(inFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        return dateFormatter.date(from: self)
    }

    /// Creates a `Date` instance representing the receiver in ISO8601 format parsed into `Date` with given options.
    ///
    /// - parameter options: The options to be used to parse.
    ///
    /// - returns: The created `Date` instance.
    @available(iOS 10.0, OSX 10.12, watchOS 3.0, tvOS 10.0, *)
    public func dateInISO8601Format(with options: ISO8601DateFormatter.Options = [.withInternetDateTime]) -> Date? {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = options
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        return dateFormatter.date(from: self)
    }
}
