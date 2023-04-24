//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 10/11/22.
//

import Foundation

public struct CharacterResponse: Codable  {
    
    public let id: Int?
    public let name: String
    public let result_description: String
    public let thumbnail: Thumbnail?
    
    public init(
        id: Int,
        name: String,
        result_description: String,
        thumbnail: Thumbnail?
        
    ) {
        self.id = id
        self.name = name
        self.result_description = result_description
        self.thumbnail = thumbnail
    }
}
