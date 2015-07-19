import Foundation
import Timepiece

//: ### Add durations to date
let now = NSDate()
let nextWeek = now + 1.week
let dayAfterTomorrow = now + 2.days

// shortcuts #1
let today = NSDate.today()
let tomorrow = NSDate.tomorrow()
let yesterday = NSDate.yesterday()

// shortcuts #2
let dayBeforeYesterday = 2.days.ago
let tokyoOlympicYear = 5.years.later

//: ### Initialize by specifying date components
let birthday = NSDate.date(year: 1987, month: 6, day: 2)
let firstCommitDate = NSDate.date(year: 2014, month: 8, day: 15, hour: 20, minute: 25, second: 43)

//: ### Initialize by changing date components
let christmas = now.change(month: 12, day: 25)
let thisSunday = now.change(weekday: 1)

// shortcuts
let newYearDay = now.beginningOfYear
let timeLimit = now.endOfHour

//: ### Time zone
let cst = NSTimeZone(abbreviation: "CST")!
let dateInCST = now.beginningOfDay.change(timeZone: cst)
dateInCST.timeZone

//: ### Format and parse
5.minutes.later.stringFromFormat("yyyy-MM-dd HH:mm:SS")
"1987-06-02".dateFromFormat("yyyy-MM-dd")

//: ### Compare dates
firstCommitDate < 1.year.ago
(1.year.ago...now).contains(firstCommitDate)
firstCommitDate > now
