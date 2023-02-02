//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 01/12/22.
//

import Foundation
import Domain

public struct ComicsDTO: Codable {
    public let available: Int
    public let collectionURI: String
    public let items: [ComicsItemDTO]
    public let returned: Int
    
    public init(
        available: Int,
        collectionURI: String,
        items: [ComicsItemDTO],
        returned: Int
    ) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}

extension ComicsDTO {
    
    public  var toDomain: Comics {
        .init(
            available: available,
            collectionURI: collectionURI,
            items: items.map { $0 .toDomain },
            returned: returned
        )
    }
}
