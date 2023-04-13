//
//  File.swift
//  
//
//  Created by NMAS Amaral on 15/12/22.
//

import Common
import Foundation

public protocol CharacterHomeCoordinating: Coordinator {

    func buttonDetails(with id: Int)
    func markAsFavorite(characterID: Int, isFavorite: Bool, characterModel: CharacterModel)
    func unmarkAsFavorite(characterID: Int, isFavorite: Bool)
    func getFavorites()
    func signOut()
}
