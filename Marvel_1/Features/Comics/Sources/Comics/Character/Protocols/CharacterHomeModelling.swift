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
    var offset: Int { get set }
    var totalPages: Int { get set }
    var isLoading: Bool { get set }
    
    func logout()
    func didAppear()
    func fetchCharacter()
    func buttonDetails(with id: Int)
    func markAsFavorite(characterID: Int, isFavorite: Bool, characterModel: CharacterModel)
    func unmarkAsFavorite(characterID: Int, isFavorite: Bool)
    func isFavoriteButtonActive(for character: CharacterModel) -> Binding<Bool>
}

extension CharacterHomeModelling {
    
    var filteredCharacters: [CharacterModel] {
        let filteredCharacters = searchTerm.isEmpty ? data : data.filter {
            $0.name.lowercased().contains(searchTerm.lowercased())
        }
        return filteredCharacters.sorted(by: { $0.name < $1.name })
    }
}
