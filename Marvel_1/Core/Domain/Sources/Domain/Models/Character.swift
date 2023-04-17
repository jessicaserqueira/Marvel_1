//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 24/03/23.
//

import Foundation

public struct Character: Codable {
    
    public let characterID: Int
    public let isFavorite: Bool
    public var item: Item
    
    public init(
        characterID: Int,
        isFavorite: Bool,
        item: Item
    ) {
        self.characterID = characterID
        self.isFavorite = isFavorite
        self.item = item
    }
}
