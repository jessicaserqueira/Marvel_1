//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 24/03/23.
//

import Foundation

public struct ResultFirebase: Codable {
    public let id: Int
    public let isFavorite: Bool
    public let character: [Character]
    
    public init(
        id: Int,
        isFavorite: Bool,
        character: [Character]
    ) {
        self.id = id
        self.isFavorite = isFavorite
        self.character = character
    }
}
