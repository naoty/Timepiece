# Change Log
All notable changes to this project will be documented in this file.

## 1.0.1
Released on 2016-11-05.

#### Changed
* Create instance of date components instead of mutable variables.

#### Fixed
* Fix App Store submission issue.

## 1.0.0
Released on 2016-10-30.

#### Added
* New initializers for `Date`.
* `+` and `-` between `DateComponents`
* Methods to format `Date` with date style.
* A method to format `DateComponents` with units style.
* A method to parse `String` using `ISO8601DateFormatter`.

#### Removed
* `Date.date()` constructor methods.
* `Duration`.
* Time zone support for each `Date`.
* Properties to get beginning and end of periods such as `beginningOfYear`, `endOfMonth`.
* `change()`.

#### Changed
* For `Int`, `year`, `month` and so on creates new `DateComponents` instance instead of `Duration`.

