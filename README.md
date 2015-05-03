# Timepiece [![Version](http://img.shields.io/cocoapods/v/Timepiece.svg?style=flat)](http://cocoadocs.org/docsets/Timepiece) [![Platform](http://img.shields.io/cocoapods/p/Timepiece.svg?style=flat)](http://cocoadocs.org/docsets/Timepiece)
Intuitive NSDate extensions in Swift

## Usage

### Add durations to date

```swift
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
```

### Initialize by specifying date components

```swift
let birthday = NSDate.date(year: 1987, month: 6, day: 2)
let firstCommitDate = NSDate.date(year: 2014, month: 8, day: 15, hour: 20, minute: 25, second: 43)
```

### Initialize by changing date components

```swift
let now = NSDate()
let christmas = now.change(month: 12, day: 25)
let thisSunday = now.change(weekday: 1)

// shortcuts
let newYearDay = now.beginningOfYear
let timeLimit = now.endOfHour
```

### Format and parse

```swift
5.minutes.later.stringFromFormat("yyyy-MM-dd HH:mm:SS")
//=> "2015-03-01 12:05:00"

"1987-06-02".dateFromFormat("yyyy-MM-dd")
//=> NSDate.date(year: 1987, month: 6, day: 2)
```

### Compare dates

```swift
if (birthday == 28.years.ago) {
    // ...
}

if (lastCommitDate > 1.week.ago) {
    // ...
}
```

## Installation

Timepiece is available through [CocoaPods](http://cocoapods.org), to install it simply add the following line to your Podfile:

```ruby
platform :ios, "8.0"
pod "Timepiece"
```

## Contribution

1. Fork
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

Timepiece is available under the MIT license. See the LICENSE file for more info.

## Author

[naoty](https://github.com/naoty)
