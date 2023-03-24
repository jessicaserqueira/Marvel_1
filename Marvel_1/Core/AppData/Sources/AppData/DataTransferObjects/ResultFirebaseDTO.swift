//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 24/03/23.
//

import Domain
import Foundation
import SwiftUI

public struct ResultFirebaseDTO: Codable {
    
    public let id: Int
    public let isFavorite: Bool
    public let character: [CharacterDTO]
    
    public init(
        id: Int,
        isFavorite: Bool,
        character: [CharacterDTO]
    ) {
        self.id = id
        self.isFavorite = isFavorite
        self.character = character
    }
}

extension ResultFirebaseDTO {
    
    enum CodingKeys: String, CodingKey {
        case id
        case isFavorite
        case character = "item"
        
    }
}

extension ResultFirebaseDTO {
    public var toDomain: ResultFirebase {
        .init(
            id: id,
            isFavorite: isFavorite,
            character: character.map { $0.toDomain }
        )
    }
}
