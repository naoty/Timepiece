//
//  NSDate+Timepiece.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/16.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Foundation
import ObjectiveC

// MARK: - Calculation

public func + (lhs: Date, rhs: Duration) -> Date {
    return Calendar.current.dateByAdding(duration: rhs, to: lhs)!
}

public func - (lhs: Date, rhs: Duration) -> Date {
    return Calendar.current.dateByAdding(duration: -rhs, to: lhs)!
}

public func - (lhs: Date, rhs: Date) -> TimeInterval {
    return lhs.timeIntervalSince(rhs)
}

// MARK: -

public extension Date {
    fileprivate struct AssociatedKeys {
        static var TimeZone = "timepiece_TimeZone"
    }
    
    // MARK: - Get components
    
    var year: Int {
        return components.year!
    }
    
    var month: Int {
        return components.month!
    }
    
    var weekday: Int {
        return components.weekday!
    }
    
    var day: Int {
        return components.day!
    }
    
    var hour: Int {
        return components.hour!
    }
    
    var minute: Int {
        return components.minute!
    }
    
    var second: Int {
        return components.second!
    }
    
    var timeZone: NSTimeZone {
        return objc_getAssociatedObject(self, &AssociatedKeys.TimeZone) as? NSTimeZone ?? calendar.timeZone as NSTimeZone
    }
    
    fileprivate var components: DateComponents {
        return (calendar as NSCalendar).components([.year, .month, .day, .weekday, .hour, .minute, .second], from: self)
    }
    
    fileprivate var calendar: NSCalendar {
        return NSCalendar.current as NSCalendar
    }
    
    // MARK: - Initialize
    
    static func date(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> Date {
        let now = Date()
        return now.change(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
    }
    
    static func date(year: Int, month: Int, day: Int) -> Date {
        return Date.date(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
    }
    
    static func today() -> Date {
        let now = Date()
        return Date.date(year: now.year, month: now.month, day: now.day)
    }
    
    static func yesterday() -> Date {
        return today() - 1.day
    }
    
    static func tomorrow() -> Date {
        return today() + 1.day
    }
    
    // MARK: - Initialize by setting components
    
    /**
        Initialize a date by changing date components of the receiver.
    */
    func change(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date! {
        var components = self.components
        components.year = year ?? self.year
        components.month = month ?? self.month
        components.day = day ?? self.day
        components.hour = hour ?? self.hour
        components.minute = minute ?? self.minute
        components.second = second ?? self.second
        return calendar.date(from: components)
    }
    
    /**
        Initialize a date by changing the weekday of the receiver.
    */
    func change(weekday: Int) -> Date! {
        return self - (self.weekday - weekday).days
    }
    
    /**
        Initialize a date by changing the time zone of receiver.
    */
    func change(timeZone: NSTimeZone) -> Date {
        let originalTimeZone = calendar.timeZone
        calendar.timeZone = timeZone as TimeZone
        
        let newDate = calendar.date(from: components)!
        newDate.calendar.timeZone = timeZone as TimeZone
        objc_setAssociatedObject(newDate, &AssociatedKeys.TimeZone, timeZone, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        calendar.timeZone = originalTimeZone
        
        return newDate
    }
    
    // MARK: - Initialize a date at beginning/end of each units
    
    var beginningOfYear: Date {
        return change(month: 1, day: 1, hour: 0, minute: 0, second: 0)
    }
    var endOfYear: Date {
        return change(month: 12, day: 31, hour: 23, minute: 59, second: 59)
    }
    
    var beginningOfMonth: Date {
        return change(day: 1, hour: 0, minute: 0, second: 0)
    }
    var endOfMonth: Date {
        let lastDay = (calendar as Calendar).range(of: Calendar.Component.day, in: Calendar.Component.month, for: self)?.count
        return change(day: lastDay, hour: 23, minute: 59, second: 59)
    }
	
	var beginningOfWeek: Date {
		let daysDiff = (7 + (weekday - calendar.firstWeekday)) % 7
		return beginningOfDay - daysDiff.days
	}
	var endOfWeek: Date {
		let daysDiff = (7 + ((calendar.firstWeekday - 1) - weekday)) % 7
		return endOfDay + daysDiff.days
	}
    
    var beginningOfDay: Date {
        return change(hour: 0, minute: 0, second: 0)
    }
    var endOfDay: Date {
        return change(hour: 23, minute: 59, second: 59)
    }
    
    var beginningOfHour: Date {
        return change(minute: 0, second: 0)
    }
    var endOfHour: Date {
        return change(minute: 59, second: 59)
    }
    
    var beginningOfMinute: Date {
        return change(second: 0)
    }
    var endOfMinute: Date {
        return change(second: 59)
    }
    
    // MARK: - Format dates
    
    func stringFromFormat(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func stringFromFormat(_ format: String, locale: Locale) -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    // MARK: - Localized time
        
    func localizedTime() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
    
    func localizedTime(_ locale: Locale) -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}
