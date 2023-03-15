//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 15/03/23.
//
import Common
import Domain
import Foundation

public struct FavoritesCharacterRepository {
    
    private let remote: FavoritesCharacterRemoteDataSource
    
    public init(remote: FavoritesCharacterRemoteDataSource) {
        self.remote = remote
    }
}

extension FavoritesCharacterRepository: Domain.FavoritesCharacterRepository {
    public func markAsFavorite(completion: @escaping (Result<Domain.CharacterResponse, Error>) -> Void) {
        remote.markAsFavorite() { result in
            switch result {
            case .success(let response):
                completion(.success(response.toDomain))
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
    public func unmarkAsFavorite(completion: @escaping (Result<Domain.CharacterResponse, Error>) -> Void) {
        remote.markAsFavorite() { result in
            switch result {
            case .success(let response):
                completion(.success(response.toDomain))
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}
