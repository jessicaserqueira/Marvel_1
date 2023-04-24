//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 01/12/22.
//

import Foundation
import Domain
import SwiftUI

public struct CharacterResponseDTO: Codable {
    
    public let id: Int?
    public let name, result_description: String
    public let thumbnail: ThumbnailDTO?
    
    public init(id: Int? = nil, name: String, result_description: String, thumbnail: ThumbnailDTO) {
        self.id = id
        self.name = name
        self.result_description = result_description
        self.thumbnail = thumbnail
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.result_description = try container.decode(String.self, forKey: .result_description)
        self.thumbnail = try container.decode(ThumbnailDTO.self, forKey: .thumbnail)
    }
}

extension CharacterResponseDTO {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case result_description = "description"
        case thumbnail
        
    }
}

extension CharacterResponseDTO {
    
    public var toDomain: CharacterResponse {
        .init(
            id: id ?? .zero,
            name: name,
            result_description: result_description,
            thumbnail: thumbnail?.toDomain
        )
    }
}
