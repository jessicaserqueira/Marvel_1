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
    public let resultDescription: String
    public let thumbnail: Thumbnail?
    
    
    public init(
        id: Int,
        name: String,
        resultDescription: String,
        thumbnail: Thumbnail?
        
    ) {
        self.id = id
        self.name = name
        self.resultDescription = resultDescription
        self.thumbnail = thumbnail
        
    }
}
