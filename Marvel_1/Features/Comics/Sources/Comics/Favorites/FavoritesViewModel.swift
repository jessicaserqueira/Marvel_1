//
//  File.swift
//  
//
//  Created by NMAS Amaral on 09/01/23.
//

import Domain
import Common
import Foundation

public class FavoritesViewModel: ObservableObject {
    
    private var coordinator: FavoritesCoordinating?
    private lazy var favoritesUseCase = DIContainer.shared.resolveSafe(Domain.FavoritesCharacterUseCaseProtocol.self)
    
    public init(coordinator: FavoritesCoordinating) {
        self.coordinator = coordinator
        self.favoritesUseCase = favoritesUseCase
    }
}

extension FavoritesViewModel: FavoritesModelling {
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
}
