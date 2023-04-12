//
//  File.swift
//  
//
//  Created by NMAS Amaral on 09/01/23.
//

import Domain
import Common
import Foundation
import SwiftUI

public class FavoritesViewModel: ObservableObject {
    
    @Published public var searchTerm: String = ""
    @Published public var favorites: [CharacterModel] = []
    @Published public var character: CharacterModel?
    @Published public var isFavorites: [CharacterIsFavoriteModel] = []
    @Published public var isLoading: Bool = false
    
    private var coordinator: FavoritesCoordinating?
    private lazy var favoritesUseCase = DIContainer.shared.resolveSafe(Domain.FavoritesCharacterUseCaseProtocol.self)
    
    public init(coordinator: FavoritesCoordinating) {
        self.coordinator = coordinator
        self.favoritesUseCase = favoritesUseCase
    }
}

extension FavoritesViewModel: FavoritesModelling {
 
    public func didAppear() {
        guard let character = character else { return }
               getFavorites(characterModel: character)
    }

    
    public func fetchCharacter() {
    }
    
    
    public func markAsFavorite(characterID: Int, isFavorite: Bool, characterModel: CharacterModel) {
        favoritesUseCase.markAsFavorite(characterID: characterID, isFavorite: isFavorite, characterModel: characterModel) { result in
            switch result {
            case .success(let response):
                response
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
    public func unmarkAsFavorite(characterID: Int, isFavorite: Bool) {
        favoritesUseCase.unmarkAsFavorite(characterID: characterID, isFavorite: isFavorite) { result in
            switch result {
            case .success(let response):
                response
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
    public func getFavorites(characterModel: CharacterModel) -> [CharacterModel] {
        favoritesUseCase.getFavorites(characterModel: characterModel) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let favoriteCharacters):
                self.favorites = favoriteCharacters.map { CharacterModel($0) }
                self.isFavorites = favoriteCharacters.map { CharacterIsFavoriteModel(id: $0.id ?? 0, isFavorite: true) }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return favorites
    }
    
    public func isFavoriteButtonActive(for character: CharacterModel) -> Binding<Bool> {
        Binding<Bool>(
            get: { [weak self] in
                self?.isFavorites.first(where: { $0.id == character.id })?.isFavorite ?? false
            },
            set: { [weak self] isFavorite in
                guard let self = self else { return }
                if isFavorite {
                    self.markAsFavorite(characterID: character.id ?? 0, isFavorite: isFavorite, characterModel: character)
                } else {
                    self.unmarkAsFavorite(characterID: character.id ?? 0, isFavorite: isFavorite)
                }
                self.isFavorites = self.isFavorites.map {
                    $0.id == character.id ? CharacterIsFavoriteModel(id: $0.id, isFavorite: isFavorite) : $0
                }
            }
        )
    }
}
