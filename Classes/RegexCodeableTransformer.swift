//
//  RegexCodableTransformer.swift
//  CodableExtensions
//
//  Created by James Ruston on 11/10/2017.
//

import Foundation

public class RegexCodableTransformer: CodingContainerTransformer {
    
    public typealias Input = String
    public typealias Output = NSRegularExpression
    
    public init() {}
    
    public func transform(_ decoded: Input) throws -> Output {
        return try NSRegularExpression(pattern: decoded, options: [])
    }
    
    public func transform(_ encoded: NSRegularExpression) throws -> String {
        return encoded.pattern
    }
}
