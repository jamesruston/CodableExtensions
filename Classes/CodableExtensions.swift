//
//  CodableExtensions.swift
//  CodableExtensions
//
//  Created by James Ruston on 11/10/2017.
//

import Foundation

extension KeyedDecodingContainer {
    func decode<Transformer: DecodingContainerTransformer>(_ key: KeyedDecodingContainer.Key,
                                                           transformer: Transformer) throws -> Transformer.Output where Transformer.Input : Decodable {
        let decoded: Transformer.Input = try self.decode(key)
        
        return try transformer.transform(decoded)
    }
    
    func decode<T>(_ key: KeyedDecodingContainer.Key) throws -> T where T : Decodable {
        return try self.decode(T.self, forKey: key)
    }
}
