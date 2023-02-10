//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 09/02/23.
//

import Foundation
import Domain

public struct DataComicsDTO: Codable {
    let offset, limit, total, count: Int?
    let results: [ComicsResponseDTO]
    
    init(
        offset: Int?,
        limit: Int?,
        total: Int?,
        count: Int?,
        results: [ComicsResponseDTO]

    ) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}

extension DataComicsDTO {
    
    public var toDomain: DataComics {
        .init(
            offset: offset,
            limit: limit,
            total: total,
            count: count,
            results: results.map { $0.toDomain }
        )
    }
}
