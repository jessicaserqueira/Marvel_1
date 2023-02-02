//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 10/11/22.
//

import Foundation

public struct StoriesItem: Codable  {
    
    public let resourceURI: String
    public let name: String
    public let type: ItemType
    
    public init(
        resourceURI: String,
        name: String,
        type: ItemType
    ) {
        self.resourceURI = resourceURI
        self.name = name
        self.type = type
    }
}

extension StoriesItem {
    
    public enum ItemType: String, Codable {
        case cover
        case empty
        case interiorStory
        case none
        
        public init(type: String) {
            self = ItemType(rawValue: type) ?? .none
        }
    }
}
