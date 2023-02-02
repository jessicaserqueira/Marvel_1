//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 10/11/22.
//

import Foundation

public struct ComicsItem: Codable  {
    
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
