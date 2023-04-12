//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 15/03/23.
//

import AppData
import Foundation

public class FavoritesCharacterRemoteDataSource: AppData.FavoritesCharacterRemoteDataSource {
    
    
    let favoriteService: FavoriteService
    
    public init(favoriteService: FavoriteService) {
        self.favoriteService = favoriteService
    }
}

extension FavoritesCharacterRemoteDataSource {
    public func getFavorites<T>(characterModel: T, completion: @escaping (Result<[AppData.CharacterResponseDTO], Error>) -> Void) where T : Decodable {
        favoriteService.getFavorites(characterModel: characterModel) { result in
            switch result {
            case .success(let response):
                guard let characterResponses = response as? [AppData.CharacterResponseDTO] else {
                    completion(.failure(NSError(domain: "getFavorites", code: 0, userInfo: [NSLocalizedDescriptionKey: "Response type mismatch"])))
                    return
                }
                completion(.success(characterResponses))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func markAsFavorite<T: Encodable>(characterID: Int, isFavorite: Bool, characterModel: T, completion: @escaping (Result<Void, Error>) -> Void) {
        favoriteService.markAsFavorite(characterID: characterID, isFavorite: isFavorite, characterModel: characterModel) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func unmarkAsFavorite(characterID: Int, isFavorite: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        favoriteService.unmarkAsFavorite(characterID: characterID, isFavorite: isFavorite) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

