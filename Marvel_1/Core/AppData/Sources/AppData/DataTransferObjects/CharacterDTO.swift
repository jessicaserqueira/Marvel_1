//
//  File 3.swift
//  
//
//  Created by Jessica Serqueira on 24/03/23.
//

import Foundation
import Domain

public struct CharacterDTO: Codable {
    
    public let characterID: Int
    public let isFavorite: Bool
    public var item: ItemDTO
    
    public init(
        characterID: Int,
        isFavorite: Bool,
        item: ItemDTO
    ) {
        self.characterID = characterID
        self.isFavorite = isFavorite
        self.item = item
    }
}

extension CharacterDTO {
    public var toDomain: Character {
        .init(
            characterID: characterID,
            isFavorite: isFavorite,
            item: item.toDomain
        )
    }
}
