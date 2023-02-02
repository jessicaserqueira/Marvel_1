//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 01/12/22.
//

import Foundation
import Domain

public struct ComicsItemDTO: Codable {
    
    public let resourceURI: String
    public let name: String
    
    public init(
        resourceURI: String,
        name: String
    ) {
        self.resourceURI = resourceURI
        self.name = name
    }
}

extension ComicsItemDTO {
    
    public var toDomain: ComicsItem {
        .init(
            resourceURI: resourceURI,
            name: name
        )
    }
}
