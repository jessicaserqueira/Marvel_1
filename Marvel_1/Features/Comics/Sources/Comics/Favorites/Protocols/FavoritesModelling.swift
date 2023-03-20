//
//  File.swift
//  
//
//  Created by NMAS Amaral on 09/01/23.
//

import Foundation

@MainActor
public protocol FavoritesModelling: ObservableObject  {
    
    func markAsFavorite(characterID: Int, isFavorite: Bool, characterModel: CharacterModel)
    func unmarkAsFavorite(characterID: Int, isFavorite: Bool)
}
