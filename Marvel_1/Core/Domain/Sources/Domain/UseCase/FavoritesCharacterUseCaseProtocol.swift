//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 15/03/23.
//

import Foundation

public protocol FavoritesCharacterUseCaseProtocol {
    func addFavoriteCharacter(completion: @escaping (Result<CharacterResponse, Error>) -> Void)
}
