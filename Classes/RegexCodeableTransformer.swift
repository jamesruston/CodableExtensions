//
//  RegexCodableTransformer.swift
//  CodableExtensions
//
//  Created by James Ruston on 11/10/2017.
//

import Foundation

class RegexCodableTransformer: DecodingContainerTransformer {
    
    typealias Input = String
    typealias Output = NSRegularExpression
    
    func transform(_ decoded: Input) throws -> Output {
        return try NSRegularExpression(pattern: decoded, options: [])
    }
}
