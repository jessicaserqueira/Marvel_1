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
    public func markAsFavorite<T>(characterID: Int, isFavorite: Bool, characterModel: T, completion: @escaping (Result<Void, Error>) -> Void) where T : Encodable {
        favoritesCharacterRepository.markAsFavorite(characterID: characterID, isFavorite: isFavorite, characterModel: characterModel, completion: completion)
    }
    
    public func unmarkAsFavorite(characterID: Int, isFavorite: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        favoritesCharacterRepository.unmarkAsFavorite(characterID: characterID, isFavorite: isFavorite, completion: completion)
    }
    
    public func getFavorites(completion: @escaping (Result<[Character], Error>) -> Void) {
        favoritesCharacterRepository.getFavorites(completion: completion)
    }
}
