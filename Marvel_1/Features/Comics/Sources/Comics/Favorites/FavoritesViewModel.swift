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
    @Published public var filterFavorites: [FavoritesModel] = []
    @Published public var isFavorites: [CharacterIsFavoriteModel] = []
    @Published public var isLoading: Bool = false
    
    private var coordinator: FavoritesCoordinating?
    private lazy var favoritesUseCase = DIContainer.shared.resolveSafe(Domain.FavoritesCharacterUseCaseProtocol.self)
    
    public init(coordinator: FavoritesCoordinating) {
        self.coordinator = coordinator
        
    }
}

extension FavoritesViewModel: FavoritesModelling {
    public func didAppear() {
        getFavorites()
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
    
    public func getFavorites() {
        self.isLoading = true
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
    
    public func buttonDetails(with id: Int) {
        coordinator?.buttonDetails(with: id)
    }
}
