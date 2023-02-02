//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 06/12/22.
//

import Foundation
import Domain

public struct DataClassDTO: Codable {
    let offset, limit, total, count: Int?
    let results: [CharacterDTO]
    
    init(
        offset: Int?,
        limit: Int?,
        total: Int?,
        count: Int?,
        results: [CharacterDTO]

    ) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}

extension DataClassDTO {
    
    public var toDomain: CharacterData {
        .init(
            offset: offset,
            limit: limit,
            total: total,
            count: count,
            results: results.map { $0.toDomain }
        )
    }
}
