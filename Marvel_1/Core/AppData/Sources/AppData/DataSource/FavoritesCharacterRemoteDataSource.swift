//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 15/03/23.
//

import Common
import Foundation

public protocol FavoritesCharacterRemoteDataSource: AnyObject {
    func markAsFavorite<T: Encodable>(characterID: Int, isFavorite: Bool, characterModel: T, completion: @escaping (Result<Void, Error>) -> Void)
    func unmarkAsFavorite(characterID: Int, isFavorite: Bool, completion: @escaping (Result<Void, Error>) -> Void)
    func getFavorites<T: Decodable>(completion: @escaping (Result<[T], Error>) -> Void)
}
