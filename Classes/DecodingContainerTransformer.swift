//
//  DecodingContainerTransformer.swift
//  CodeableExtensions
//
//  Created by James Ruston on 11/10/2017.
//

import Foundation

protocol DecodingContainerTransformer {
    associatedtype Input
    associatedtype Output
    func transform(_ decoded: Input) throws -> Output
}
