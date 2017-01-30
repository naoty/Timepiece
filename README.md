# Timepiece  [![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Timepiece.svg)](https://cocoapods.org/pods/Timepiece) [![Build Status](http://img.shields.io/travis/naoty/Timepiece/master.svg?style=flat)](https://travis-ci.org/naoty/Timepiece)
Intuitive date handling in Swift

## Features
* :bulb: **Intuitive**: Timepiece provides a set of helpers to make date handling easier.
* :clock9: **Correct**: Using Foundation API correctly, Timepiece helps to calculate dates correctly without deep understanding.
* :package: **Small**: Timepiece has only 4 file. You can read the inside of this easily.

## Requirements

| version | Swift | iOS  | macOS | tvOS | watchOS | NOTE |
| ------- | ----- | ---- | ----- | ---- | ------- | ---- |
| 1.0.0+  | 3.0+  | 8.0+ | 10.9+ | 9.0+ | 2.0+    | Incompatible with 0.6.x |
| 0.6.0+  | 3.0+  | 8.0+ | 10.9+ | 9.0+ | 2.0+    | |
| 0.5.0+  | 2.3   | 8.0+ | 10.9+ | 9.0+ | 2.0+    | |

## Usage

### Initialization

```swift
Date(era: 235, year: 26, month: 8, day: 14, hour: 20, minute: 25, second: 43, nanosecond: 0, on: Calendar(identifier: .japanese))
Date(year: 2014, month: 8, day: 14, hour: 20, minute: 25, second: 43, nanosecond: 0)
Date(year: 2014, month: 8, day: 14, hour: 20, minute: 25, second: 43)
Date(year: 2014, month: 8, day: 14)

Date.today()
Date.yesterday()
Date.tomorrow()
```

### Calculation

```swift
now + 1.year
now - 2.months
now + (3.weeks - 4.days + 5.hours)

1.year.later
1.year.ago
```

### Change

```swift
now.changed(year: 2014)
now.changed(weekday: 1)
now.truncated([.minute, .second, .nanosecond])
now.truncated(from: .day)
```

### Formating

```swift
now.string(inDateStyle: .long, andTimeStyle: .medium)
now.dateString(in: .medium)
now.timeString(in: .short)

3.days.string(in: .full)
```

### Parsing

```swift
"2014/8/14".date(inFormat: "yyyy/MM/dd")
"2014-08-14T20:25:43+0900".dateInISO8601Format()
```

## Installation

### CocoaPods

```ruby
# Podfile
pod "Timepiece"
```

### Carthage

```ruby
# Cartfile
github "naoty/Timepiece"
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

