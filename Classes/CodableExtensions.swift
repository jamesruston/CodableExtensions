//
//  CodableExtensions.swift
//  CodableExtensions
//
//  Created by James Ruston on 11/10/2017.
//

import Foundation

public extension KeyedDecodingContainer {
    func decode<Transformer: DecodingContainerTransformer>(_ key: KeyedDecodingContainer.Key,
                                                           transformer: Transformer) throws -> Transformer.Output where Transformer.Input : Decodable {
        let decoded: Transformer.Input = try self.decode(key)
        
        return try transformer.transform(decoded)
    }
    
    func decode<T>(_ key: KeyedDecodingContainer.Key) throws -> T where T : Decodable {
        return try self.decode(T.self, forKey: key)
    }
}

public extension KeyedEncodingContainer {
    
    mutating func encode<Transformer: EncodingContainerTransformer>(_ value: Transformer.Output,
                                                                    forKey key: KeyedEncodingContainer.Key,
                                                                    transformer: Transformer) throws where Transformer.Input : Encodable {
        let transformed: Transformer.Input = try transformer.transform(value)
        try self.encode(transformed, forKey: key)
    }
}
