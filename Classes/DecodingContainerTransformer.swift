//
//  DecodingContainerTransformer.swift
//  CodeableExtensions
//
//  Created by James Ruston on 11/10/2017.
//

import Foundation

public protocol DecodingContainerTransformer {
    associatedtype Input
    associatedtype Output
    func transform(_ decoded: Input) throws -> Output
}

public protocol EncodingContainerTransformer {
    associatedtype Input
    associatedtype Output
    func transform(_ encoded: Output) throws -> Input
}

public typealias CodingContainerTransformer = DecodingContainerTransformer & EncodingContainerTransformer
