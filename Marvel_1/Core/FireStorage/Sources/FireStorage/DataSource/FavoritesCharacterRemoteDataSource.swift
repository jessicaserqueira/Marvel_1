//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 15/03/23.
//

import AppData
import Foundation
import SwiftUI

public class FavoritesCharacterRemoteDataSource {
    
    public let favoriteService: FavoriteService
    
    public init(favoriteService: FavoriteService) {
        self.favoriteService = favoriteService
    }
}

extension FavoritesCharacterRemoteDataSource: AppData.FavoritesCharacterRemoteDataSource {
    public func markAsFavorite<T>(characterID: Int, isFavorite: Bool, characterModel: T, completion: @escaping (Result<Void, Error>) -> Void) where T : Encodable {
        
        favoriteService.markAsFavorite(characterID: characterID, isFavorite: isFavorite, characterModel: characterModel) { result in
            switch result {
            case .success(_):
                completion(.success(()))
            case .failure(let error):
                print("\(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
    public func unmarkAsFavorite(characterID: Int, isFavorite: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        favoriteService.unmarkAsFavorite(characterID: characterID, isFavorite: isFavorite) { result in
            switch result {
            case .success(_):
                completion(.success(()))
            case .failure(let error):
                print("\(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
