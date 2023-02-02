//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 10/11/22.
//

import Foundation

public struct Stories: Codable  {
    
    public let available: Int
    public let collectionURI: String
    public let items: [StoriesItem]
    public let returned: Int
    
    public init(
        available: Int,
        collectionURI: String,
        items: [StoriesItem],
        returned: Int
    ) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}
