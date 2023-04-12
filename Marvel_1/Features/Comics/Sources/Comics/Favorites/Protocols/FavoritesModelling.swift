//
//  File.swift
//  
//
//  Created by NMAS Amaral on 09/01/23.
//
import SwiftUI
import Foundation

@MainActor
public protocol FavoritesModelling: ObservableObject  {
    var favorites: [CharacterModel] { get }
    var isFavorites: [CharacterIsFavoriteModel] { get }
    var searchTerm: String { get set }
    var isLoading: Bool { get set }

    func didAppear()
    func getFavorites(characterModel: CharacterModel) -> [CharacterModel] 
    func markAsFavorite(characterID: Int, isFavorite: Bool, characterModel: CharacterModel)
    func unmarkAsFavorite(characterID: Int, isFavorite: Bool)
    func isFavoriteButtonActive(for character: CharacterModel) -> Binding<Bool>
    func fetchCharacter()
}

extension FavoritesModelling {
    
    var filteredCharacters: [CharacterModel] {
        let filteredCharacters = searchTerm.isEmpty ? favorites : favorites.filter {
            $0.name.lowercased().contains(searchTerm.lowercased())
        }
        return filteredCharacters.sorted(by: { $0.name < $1.name })
    }
}
