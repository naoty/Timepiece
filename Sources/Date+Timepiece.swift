//
//  Date+Timepiece.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 10/2/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation

extension Date {
    /// The year.
    public var year: Int {
        return dateComponents.year!
    }

    /// The month.
    public var month: Int {
        return dateComponents.month!
    }

    /// The day.
    public var day: Int {
        return dateComponents.day!
    }

    /// The hour.
    public var hour: Int {
        return dateComponents.hour!
    }

    /// The minute.
    public var minute: Int {
        return dateComponents.minute!
    }

    /// The second.
    public var second: Int {
        return dateComponents.second!
    }

    /// The nanosecond.
    public var nanosecond: Int {
        return dateComponents.nanosecond!
    }

    /// The weekday.
    public var weekday: Int {
        return dateComponents.weekday!
    }

    private var dateComponents: DateComponents {
        return calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond, .weekday], from: self)
    }

    // Returns user's calendar to be used to return `DateComponents` of the receiver.
    private var calendar: Calendar {
        return .current
    }

    /// Creates a new instance with specified date components.
    ///
    /// - parameter era:        The era.
    /// - parameter year:       The year.
    /// - parameter month:      The month.
    /// - parameter day:        The day.
    /// - parameter hour:       The hour.
    /// - parameter minute:     The minute.
    /// - parameter second:     The second.
    /// - parameter nanosecond: The nanosecond.
    /// - parameter calendar:   The calendar used to create a new instance.
    ///
    /// - returns: The created `Date` instance.
    public init(era: Int?, year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, nanosecond: Int, on calendar: Calendar) {
        let now = Date()
        var dateComponents = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond], from: now)
        dateComponents.era = era
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.nanosecond = nanosecond

        let date = calendar.date(from: dateComponents)
        self.init(timeInterval: 0, since: date!)
    }

    /// Creates a new instance with specified date componentns.
    ///
    /// - parameter year:       The year.
    /// - parameter month:      The month.
    /// - parameter day:        The day.
    /// - parameter hour:       The hour.
    /// - parameter minute:     The minute.
    /// - parameter second:     The second.
    /// - parameter nanosecond: The nanosecond. `0` by default.
    ///
    /// - returns: The created `Date` instance.
    public init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, nanosecond: Int = 0) {
        self.init(era: nil, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond, on: .current)
    }

    /// Creates a new Instance with specified date components
    ///
    /// - parameter year:  The year.
    /// - parameter month: The month.
    /// - parameter day:   The day.
    ///
    /// - returns: The created `Date` instance.
    public init(year: Int, month: Int, day: Int) {
        self.init(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
    }

    /// Creates a new instance representing today.
    ///
    /// - returns: The created `Date` instance representing today.
    public static func today() -> Date {
        let now = Date()
        return Date(year: now.year, month: now.month, day: now.day)
    }

    /// Creates a new instance representing yesterday
    ///
    /// - returns: The created `Date` instance representing yesterday.
    public static func yesterday() -> Date {
        return (today() - 1.day)!
    }

    /// Creates a new instance representing tomorrow
    ///
    /// - returns: The created `Date` instance representing tomorrow.
    public static func tomorrow() -> Date {
        return (today() + 1.day)!
    }

    /// Creates a new instance added a `DateComponents`
    ///
    /// - parameter left:  The date.
    /// - parameter right: The date components.
    ///
    /// - returns: The created `Date` instance.
    public static func + (left: Date, right: DateComponents) -> Date? {
        return Calendar.current.date(byAdding: right, to: left)
    }

    /// Creates a new instance subtracted a `DateComponents`
    ///
    /// - parameter left:  The date.
    /// - parameter right: The date components.
    ///
    /// - returns: The created `Date` instance.
    public static func - (left: Date, right: DateComponents) -> Date? {
        return Calendar.current.date(byAdding: -right, to: left)
    }

    /// Creates a new instance by changing the date components
    ///
    /// - Parameters:
    ///   - year: The year.
    ///   - month: The month.
    ///   - day: The day.
    ///   - hour: The hour.
    ///   - minute: The minute.
    ///   - second: The second.
    ///   - nanosecond: The nanosecond.
    /// - Returns: The created `Date` instnace.
    public func changed(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil, nanosecond: Int? = nil) -> Date? {
        var dateComponents = self.dateComponents
        dateComponents.year = year ?? self.year
        dateComponents.month = month ?? self.month
        dateComponents.day = day ?? self.day
        dateComponents.hour = hour ?? self.hour
        dateComponents.minute = minute ?? self.minute
        dateComponents.second = second ?? self.second
        dateComponents.nanosecond = nanosecond ?? self.nanosecond

        return calendar.date(from: dateComponents)
    }

    /// Creates a new instance by changing the year.
    ///
    /// - Parameter year: The year.
    /// - Returns: The created `Date` instance.
    public func changed(year: Int) -> Date? {
        return changed(year: year, month: nil, day: nil, hour: nil, minute: nil, second: nil, nanosecond: nil)
    }

    /// Creates a new instance by changing the month.
    ///
    /// - Parameter month: The month.
    /// - Returns: The created `Date` instance.
    public func changed(month: Int) -> Date? {
        return changed(year: nil, month: month, day: nil, hour: nil, minute: nil, second: nil, nanosecond: nil)
    }

    /// Creates a new instance by changing the day.
    ///
    /// - Parameter day: The day.
    /// - Returns: The created `Date` instance.
    public func changed(day: Int) -> Date? {
        return changed(year: nil, month: nil, day: day, hour: nil, minute: nil, second: nil, nanosecond: nil)
    }

    /// Creates a new instance by changing the hour.
    ///
    /// - Parameter hour: The hour.
    /// - Returns: The created `Date` instance.
    public func changed(hour: Int) -> Date? {
        return changed(year: nil, month: nil, day: nil, hour: hour, minute: nil, second: nil, nanosecond: nil)
    }

    /// Creates a new instance by changing the minute.
    ///
    /// - Parameter minute: The minute.
    /// - Returns: The created `Date` instance.
    public func changed(minute: Int) -> Date? {
        return changed(year: nil, month: nil, day: nil, hour: nil, minute: minute, second: nil, nanosecond: nil)
    }

    /// Creates a new instance by changing the second.
    ///
    /// - Parameter second: The second.
    /// - Returns: The created `Date` instance.
    public func changed(second: Int) -> Date? {
        return changed(year: nil, month: nil, day: nil, hour: nil, minute: nil, second: second, nanosecond: nil)
    }

    /// Creates a new instance by changing the nanosecond.
    ///
    /// - Parameter nanosecond: The nanosecond.
    /// - Returns: The created `Date` instance.
    public func changed(nanosecond: Int) -> Date? {
        return changed(year: nil, month: nil, day: nil, hour: nil, minute: nil, second: nil, nanosecond: nanosecond)
    }

    /// Creates a new instance by changing the weekday.
    ///
    /// - Parameter weekday: The weekday.
    /// - Returns: The created `Date` instance.
    public func changed(weekday: Int) -> Date? {
        return self - (self.weekday - weekday).days
    }

    /// Creates a new instance by truncating the components
    ///
    /// - Parameter components: The components to be truncated.
    /// - Returns: The created `Date` instance.
    public func truncated(_ components: [Calendar.Component]) -> Date? {
        var dateComponents = self.dateComponents

        for component in components {
            switch component {
            case .month:
                dateComponents.month = 1
            case .day:
                dateComponents.day = 1
            case .hour:
                dateComponents.hour = 0
            case .minute:
                dateComponents.minute = 0
            case .second:
                dateComponents.second = 0
            case .nanosecond:
                dateComponents.nanosecond = 0
            default:
                continue
            }
        }
        
        return calendar.date(from: dateComponents)
    }

    /// Creates a new instance by truncating the components
    ///
    /// - Parameter component: The component to be truncated from.
    /// - Returns: The created `Date` instance.
    public func truncated(from component: Calendar.Component) -> Date? {
        switch component {
        case .month:
            return truncated([.month, .day, .hour, .minute, .second, .nanosecond])
        case .day:
            return truncated([.day, .hour, .minute, .second, .nanosecond])
        case .hour:
            return truncated([.hour, .minute, .second, .nanosecond])
        case .minute:
            return truncated([.minute, .second, .nanosecond])
        case .second:
            return truncated([.second, .nanosecond])
        case .nanosecond:
            return truncated([.nanosecond])
        default:
            return self
        }
    }

    /// Creates a new `String` instance representing the receiver formatted in given date style and time style.
    ///
    /// - parameter dateStyle: The date style.
    /// - parameter timeStyle: The time style.
    ///
    /// - returns: The created `String` instance.
    public func stringIn(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle

        return dateFormatter.string(from: self)
    }

    @available(*, unavailable, renamed: "stringIn(dateStyle:timeStyle:)")
    public func string(inDateStyle dateStyle: DateFormatter.Style, andTimeStyle timeStyle: DateFormatter.Style) -> String {
        return stringIn(dateStyle: dateStyle, timeStyle: timeStyle)
    }

    /// Creates a new `String` instance representing the date of the receiver formatted in given date style.
    ///
    /// - parameter dateStyle: The date style.
    ///
    /// - returns: The created `String` instance.
    public func dateString(in dateStyle: DateFormatter.Style) -> String {
        return stringIn(dateStyle: dateStyle, timeStyle: .none)
    }

    /// Creates a new `String` instance representing the time of the receiver formatted in given time style.
    ///
    /// - parameter timeStyle: The time style.
    ///
    /// - returns: The created `String` instance.
    public func timeString(in timeStyle: DateFormatter.Style) -> String {
        return stringIn(dateStyle: .none, timeStyle: timeStyle)
    }
}
