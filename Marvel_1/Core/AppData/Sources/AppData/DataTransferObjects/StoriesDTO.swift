//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 01/12/22.
//

import Foundation
import Domain

public struct StoriesDTO: Codable {
    
    public let available: Int
    public let collectionURI: String
    public let items: [StoriesItemDTO]
    public let returned: Int
    
    public init(
        available: Int,
        collectionURI: String,
        items: [StoriesItemDTO],
        returned: Int
    ) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}

extension StoriesDTO {
    
    public var toDomain: Stories {
        .init(
            available: available,
            collectionURI: collectionURI,
            items: items.map { $0.toDomain },
            returned: returned
        )
    }
}
