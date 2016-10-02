# Timepiece
Intuitive date calculation in Swift

## Feature
* **Intuitive**: Working with `Date`, `DateComponent`, `Calendar` and so on is a bit troublesome. Timepiece is a set of helpers to make handling them a bit more intuitive.
* **Simple**: Timepiece doesn't have many convenient features. But, its maintainers focus on reliability and maintainability.

## Requirements

| version | Swift | iOS  | macOS | tvOS | watchOS | NOTE |
| ------- | ----- | ---- | ----- | ---- | ------- | ---- |
| 1.0.0+  | 3.0+  | 8.0+ | 10.9+ | 9.0+ | 2.0+    | Incompatible with 0.6.x |
| 0.6.0+  | 3.0+  | 8.0+ | 10.9+ | 9.0+ | 2.0+    | |
| 0.5.0+  | 2.3   | 8.0+ | 10.9+ | 9.0+ | 2.0+    | |

## Usage

### Initialization

```swift
let birthday = Date(year: 1987, month: 6, day: 2)
let firstCommitDate = Date(year: 2014, month: 8, day: 15, hour: 20, minute: 25, second: 43)
```

### Calculation

```swift
let nextWeek = Date() + 1.week
let dayAfterTomorrow = Date() + 2.days

let today = Date.today()
let tomorrow = Date.tomorrow()
let yesterday = Date.yesterday()

let dayBeforeYesterday = 2.days.ago
let tokyoOlympicYear = 4.years.later
```

### Comparing

```swift
firstCommitDate < 1.year.ago // false
firstCommitDate > Date() // false
(1.year.ago ... Date()).contains(firstCommitDate) // true
```

### Formating and Parsing

```swift
// DateFormatterStyle
5.minutes.later.string(for: .ShortStyle)
"June 2, 1987".date(for: .LongStyle)

// Fixed format string
5.minutes.later.string(forFormat: "yyyy-MM-dd")
"1987-06-02".date(forFormat: "yyyy-MM-dd")
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

