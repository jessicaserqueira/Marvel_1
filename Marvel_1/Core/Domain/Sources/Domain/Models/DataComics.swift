//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 09/02/23.
//

import Foundation

public struct DataComics: Codable{
    public let offset, limit, total, count: Int?
    public let results: [ComicsResponse]?
    
    public init(
        offset: Int?,
        limit: Int?,
        total: Int?,
        count: Int?,
        results: [ComicsResponse]?
    ) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}
