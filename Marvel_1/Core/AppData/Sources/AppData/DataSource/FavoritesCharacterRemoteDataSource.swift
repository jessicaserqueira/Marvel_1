//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 15/03/23.
//

import Common
import Foundation

public protocol FavoritesCharacterRemoteDataSource: AnyObject {
    func markAsFavorite(completion: @escaping (Result<CharacterResponseDTO, Error>) -> Void)
    func unmarkAsFavorite(completion: @escaping (Result<CharacterResponseDTO, Error>) -> Void)
}
