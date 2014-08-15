# Timepiece

Swift extensions to calculate time

## Demo

```swift
let now = NSDate()

// Calculate
let tomorrow = now + 1.day
let dayAfterTomorrow = now + 2.days
let lastMonth = now - 1.month
let distancePast = now - ∞

// Set/Get components
let minute = now.minute
let timeToSleep = now.change(hour: 23, minute: 0)

// Parse
let birthday = NSDate(string: "1987-06-02")
let birthdayText = birthday.string(format: "YYYY-MM-dd")
```

## Usage

TODO

## Installation

TODO

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

