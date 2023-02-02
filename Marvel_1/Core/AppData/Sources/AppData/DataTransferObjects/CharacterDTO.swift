//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 01/12/22.
//

import Foundation
import Domain

public struct CharacterDTO: Codable {
    
    public let id: Int?
    public let name, resultDescription: String
    public let thumbnail: ThumbnailDTO

    
    init(
        id: Int?,
        name: String,
        resultDescription: String,
        thumbnail: ThumbnailDTO
        
    ) {
        self.id = id
        self.name = name
        self.resultDescription = resultDescription
        self.thumbnail = thumbnail
    }
}

extension CharacterDTO {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case resultDescription = "description"
        case thumbnail
    }
}

extension CharacterDTO {
    
    public var toDomain: CharacterResponse {
        .init(
            id: id ?? .zero,
            name: name,
            resultDescription: resultDescription,
            thumbnail: thumbnail.toDomain
        )
    }
}
