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
    public func markAsFavorite(completion: @escaping (Result<AppData.CharacterResponseDTO, Error>) -> Void) {
            favoriteService.markAsFavorite() { result in
                switch result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    print("\(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
        }
    
    public func unmarkAsFavorite(completion: @escaping (Result<AppData.CharacterResponseDTO, Error>) -> Void) {
        favoriteService.unmarkAsFavorite() { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                print("\(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
