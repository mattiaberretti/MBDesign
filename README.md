# MBDesign

[![CI Status](https://img.shields.io/travis/Mattia Berretti/MBDesign.svg?style=flat)](https://travis-ci.org/mattiaberretti/MBDesign)
[![Version](https://img.shields.io/cocoapods/v/MBDesign.svg?style=flat)](https://cocoapods.org/pods/MBDesign)
[![License](https://img.shields.io/cocoapods/l/MBDesign.svg?style=flat)](https://cocoapods.org/pods/MBDesign)
[![Platform](https://img.shields.io/cocoapods/p/MBDesign.svg?style=flat)](https://cocoapods.org/pods/MBDesign)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

MBDesign is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end

pod 'MBDesign'
```

## Author

Mattia Berretti, mattia.berretti@gmail.com

## License

MBDesign is available under the MIT license. See the LICENSE file for more info.
