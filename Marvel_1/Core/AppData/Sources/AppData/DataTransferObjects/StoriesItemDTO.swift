//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 01/12/22.
//

import Foundation
import Domain

public struct StoriesItemDTO: Codable {
    
    public let resourceURI: String
    public let name: String
    public let type: ItemTypeDTO
    
    public init(
        resourceURI: String,
        name: String,
        type: ItemTypeDTO
    ) {
        self.resourceURI = resourceURI
        self.name = name
        self.type = type
    }
}

extension StoriesItemDTO {
    
    public enum ItemTypeDTO: String, Codable {
        case cover
        case empty
        case interiorStory
    }
}

extension StoriesItemDTO.ItemTypeDTO {
    var asDomainItemType: StoriesItem.ItemType {
        StoriesItem.ItemType(type: self.rawValue)
    }
}

extension StoriesItemDTO {
    
    public var toDomain: StoriesItem {
        .init(
            resourceURI: resourceURI,
            name: name,
            type: type.asDomainItemType
        )
    }
}
