# CodableExtensions

[![Version](https://img.shields.io/cocoapods/v/CodableExtensions.svg?style=flat)](http://cocoapods.org/pods/CodableExtensions)
[![License](https://img.shields.io/cocoapods/l/CodableExtensions.svg?style=flat)](http://cocoapods.org/pods/CodableExtensions)
[![Platform](https://img.shields.io/cocoapods/p/CodableExtensions.svg?style=flat)](http://cocoapods.org/pods/CodableExtensions)

## Installation

CodableExtensions is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CodableExtensions'
```

and run

```bash
pod install
```

## Usage

#### Custom Transformations

To make a custom transformer, you just need to implement `DecodingContainerTransformer`
An example is provided in the project for converting a Regex

```swift
import CodableExtensions

public class RegexCodableTransformer: DecodingContainerTransformer {
    
    public typealias Input = String
    public typealias Output = NSRegularExpression
    
    public init() {}
    
    public func transform(_ decoded: Input) throws -> Output {
        return try NSRegularExpression(pattern: decoded, options: [])
    }
}
```

The `Input` and `Output` types need defining to match the type you expect to be converting from an to, in this case the input is a `String` and the output is an `NSRegularExpression`.

The logic to perfrom the transformation is then performed in the `transform` function. If there's an error at any point then that needs to be thrown.

The custom transformer can then be used in the `Decodable` initialiser

```swift
init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        regex = try container.decode(.regex, transformer: RegexCodableTransformer())
}
```

For full examples check out the tests https://github.com/jamesruston/CodableExtensions/blob/master/Example/Tests/Tests.swift

## Author

https://twitter.com/james_ruston

## License

CodableExtensions is available under the MIT license. See the LICENSE file for more info.
