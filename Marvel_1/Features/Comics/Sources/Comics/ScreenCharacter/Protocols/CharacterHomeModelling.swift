//
//  File.swift
//  
//
//  Created by NMAS Amaral on 15/12/22.
//

import SwiftUI

@MainActor
public protocol CharacterHomeModelling: ObservableObject {
    
    var data: [CharacterModel] { get }
    var isFavorites: [CharacterIsFavoriteModel] { get set }
    var searchTerm: String { get set }
    var isLoading: Bool { get set }
    
    func signOut()
    func didAppear()
    func fetchCharacter()
    func filterCharacters(searchTerm: String) -> [CharacterModel]
    func favoriteButton()
    func buttonDetails(with id: Int)
     func markAsFavorite(characterID: Int, isFavorite: Bool, characterModel: CharacterModel)
    func unmarkAsFavorite(characterID: Int, isFavorite: Bool)
}
