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
    @Published public var favorites: [FavoritesModel] = []
    @Published public var isFavorites: [CharacterIsFavoriteModel] = []
    @Published public var isLoading: Bool = false
    
    private var coordinator: FavoritesCoordinating?
    private lazy var favoritesUseCase = DIContainer.shared.resolveSafe(Domain.FavoritesCharacterUseCaseProtocol.self)
    
    public init(coordinator: FavoritesCoordinating) {
        self.coordinator = coordinator
        
    }
}

extension FavoritesViewModel: FavoritesModelling {
    
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
    
    public func didAppear() {
        getFavorites()
    }
    
    public func markAsFavorite(characterID: Int, isFavorite: Bool, characterModel: CharacterModel) {
        favoritesUseCase.markAsFavorite(characterID: characterID, isFavorite: isFavorite, characterModel: characterModel) { result in
            switch result {
            case .success(let response):
                print("Marked character \(characterID) as favorite: \(isFavorite)")
            case .failure(let error):
                print("Error marking character \(characterID) as favorite: \(error.localizedDescription)")
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
    
    public func getFavorites() {
        favoritesUseCase.getFavorites { result in
            self.isLoading = false
            switch result {
            case .success(let favorite):
                self.favorites = favorite.compactMap { FavoritesModel($0.item) }
                for character in favorite.map({ $0.item }) {
                    let id = character.id
                    let isFavorite = self.isFavorites.contains(where: { $0.id == id }) ? true : false
                    self.isFavorites.append(CharacterIsFavoriteModel(id: id, isFavorite: isFavorite))
                }
                
            case .failure(let error):
                print("Error getting favorites: \(error.localizedDescription)")
            }
        }
    }
}
