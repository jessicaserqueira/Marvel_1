//
//  File 2.swift
//  
//
//  Created by Jessica Serqueira on 15/03/23.
//


import Foundation

public class FavoritesCharacterUseCase {
    
    private let favoritesCharacterRepository: FavoritesCharacterRepository
    
    public init(favoritesCharacterRepository: FavoritesCharacterRepository) {
        self.favoritesCharacterRepository = favoritesCharacterRepository
    }
}

extension FavoritesCharacterUseCase: FavoritesCharacterUseCaseProtocol {
    public func addFavoriteCharacter(completion: @escaping (Result<CharacterResponse, Error>) -> Void) {
        favoritesCharacterRepository.markAsFavorite(completion: completion)
        favoritesCharacterRepository.unmarkAsFavorite(completion: completion)
    }
}
