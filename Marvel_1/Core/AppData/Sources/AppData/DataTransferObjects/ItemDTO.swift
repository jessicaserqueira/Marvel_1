//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 24/03/23.
//

import Domain
import Foundation

public struct ItemDTO: Codable {

    public let id: Int
    public let name: String
    public let result_description: String
    public let thumbnail: ThumbnailFirebaseDTO
    
    public init(
        id: Int,
        name: String,
        result_description: String,
        thumbnail: ThumbnailFirebaseDTO
    ) {
        self.id = id
        self.name = name
        self.result_description = result_description
        self.thumbnail = thumbnail
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        result_description = try container.decode(String.self, forKey: .result_description)
        thumbnail = try container.decode(ThumbnailFirebaseDTO.self, forKey: .thumbnail)
    }
}

extension ItemDTO {
    
    public enum CodingKeys: String, CodingKey {
        
        case id
        case name
        case result_description = "result_description"
        case thumbnail
        
    }
}

extension ItemDTO {
        public var toDomain: Item {
            .init(
                id: id,
                name: name,
                result_description: result_description,
                thumbnail: thumbnail.toThumbnailFirebase()
            )
     }
}
