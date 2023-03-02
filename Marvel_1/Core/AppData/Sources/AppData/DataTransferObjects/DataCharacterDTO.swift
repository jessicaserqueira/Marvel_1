//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 06/12/22.
//

import Foundation
import Domain

public struct DataCharacterDTO: Codable {
    let offset, limit, total, count: Int?
    let results: [CharacterResponseDTO]
    
    init(
        offset: Int?,
        limit: Int?,
        total: Int?,
        count: Int?,
        results: [CharacterResponseDTO]

    ) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}

extension DataCharacterDTO {
    
    public var toDomain: DataCharacter {
        .init(
            offset: offset,
            limit: limit,
            total: total,
            count: count,
            results: results.map { $0.toDomain }
        )
    }
}
