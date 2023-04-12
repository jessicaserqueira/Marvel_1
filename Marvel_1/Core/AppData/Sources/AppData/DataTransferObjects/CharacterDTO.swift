//
//  File 3.swift
//  
//
//  Created by Jessica Serqueira on 24/03/23.
//

import Foundation
import Domain

public struct CharacterDTO: Codable {
    public let uuid: String
    public let id: Int
    public let name: String
    public let resultDescription: String
    public let thumbnailFirebase: ThumbnailFirebaseDTO
    
    public init(
        uuid: String,
        id: Int,
        name: String,
        resultDescription: String,
        thumbnailFirebase: ThumbnailFirebaseDTO
    ) {
        self.uuid = uuid
        self.id = id
        self.name = name
        self.resultDescription = resultDescription
        self.thumbnailFirebase = thumbnailFirebase
    }
}

extension CharacterDTO {
    enum CodingKeys: String, CodingKey {
        case uuid
        case id
        case name
        case resultDescription
        case thumbnailFirebase = "thumbnail"
    }
}

extension CharacterDTO {
    public var toDomain: Character {
        .init(
            uuid: uuid,
            id: id,
            name: name,
            resultDescription: resultDescription,
            thumbnailFirebase: thumbnailFirebase.toThumbnailFirebase()
        )
    }
}
