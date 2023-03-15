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
    public let name, resultDescription: String
    public let thumbnail: ThumbnailDTO
    
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.resultDescription = try container.decode(String.self, forKey: .resultDescription)
        self.thumbnail = try container.decode(ThumbnailDTO.self, forKey: .thumbnail)
    }
}

extension CharacterResponseDTO {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case resultDescription = "description"
        case thumbnail
        
    }
}

extension CharacterResponseDTO {
    
   public var toDictionary: [String: Any] {
        let dict: [String: Any?] = [
            "id": id,
            "name": name,
            "resultDescription": resultDescription,
            "thumbnail": thumbnail
        ]
        return dict.compactMapValues { $0 }
    }
}

extension CharacterResponseDTO {
    
    public var toDomain: CharacterResponse {
        .init(
            id: id ?? .zero,
            name: name,
            resultDescription: resultDescription,
            thumbnail: thumbnail.toDomain
        )
    }
}

