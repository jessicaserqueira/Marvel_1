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
    public func getFavorites(completion: @escaping (Result<[Domain.Character], Error>) -> Void) {
            remote.getFavorites{ (result: Result<[CharacterDTO], Error>) in
                switch result {
                case .success(let response):
                    completion(.success(response.map { $0.toDomain}))
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
            }
        }

    public func markAsFavorite<T>(characterID: Int, isFavorite: Bool, characterModel: T, completion: @escaping (Result<Void, Error>) -> Void) where T : Encodable {
        remote.markAsFavorite(characterID: characterID, isFavorite: isFavorite, characterModel: characterModel) { result in
            switch result {
            case .success(_):
                completion(.success(()))
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
    public func unmarkAsFavorite(characterID: Int, isFavorite: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        remote.unmarkAsFavorite(characterID: characterID, isFavorite: isFavorite) { result in
            switch result {
            case .success(_):
                completion(.success(()))
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}
