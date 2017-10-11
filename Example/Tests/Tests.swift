import UIKit
import XCTest
import CodableExtensions

struct Person: Decodable {
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(.name)
    }
}

struct RegexWrapper: Decodable {
    let regex: NSRegularExpression
    
    private enum CodingKeys: String, CodingKey {
        case regex
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        regex = try container.decode(.regex, transformer: RegexCodableTransformer())
    }
}

struct OptionalRegexWrapper: Decodable {
    let regex: NSRegularExpression?
    
    private enum CodingKeys: String, CodingKey {
        case regex
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        regex = try? container.decode(.regex, transformer: RegexCodableTransformer())
    }
}

class Tests: XCTestCase {
    
    func testDecodingStandardType() {
        let json = """
        {
         "name": "James Ruston"
        }
        """.data(using: .utf8)!
        
        let person = try! JSONDecoder().decode(Person.self, from: json)
        
        XCTAssertEqual(person.name, "James Ruston")
    }
    
    func testCustomTransformer() {
        let json = """
        {
         "regex": ".*"
        }
        """.data(using: .utf8)!
        
        let wrapper = try! JSONDecoder().decode(RegexWrapper.self, from: json)
        
        XCTAssertEqual(wrapper.regex.pattern, ".*")
    }
    
    func testInvalidType() {
        let json = """
        {
         "regex": true
        }
        """.data(using: .utf8)!
        
        let wrapper = try? JSONDecoder().decode(RegexWrapper.self, from: json)
        
        XCTAssertNil(wrapper)
    }
    
    func testInvalidRegex() {
        let json = """
        {
         "regex": "["
        }
        """.data(using: .utf8)!
        
        let wrapper = try! JSONDecoder().decode(OptionalRegexWrapper.self, from: json)
        
        XCTAssertNil(wrapper.regex)
    }
    
}


