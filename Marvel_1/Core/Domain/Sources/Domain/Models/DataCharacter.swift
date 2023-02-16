//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 06/12/22.
//

import Foundation

public struct DataCharacter: Codable{
    public let offset, limit, total, count: Int?
    public let results: [CharacterResponse]?
    
    public init(
        offset: Int?,
        limit: Int?,
        total: Int?,
        count: Int?,
        results: [CharacterResponse]?
    ) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}
