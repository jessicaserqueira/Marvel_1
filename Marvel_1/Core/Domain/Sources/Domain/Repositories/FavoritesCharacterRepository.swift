//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 15/03/23.
//

import Common
import Foundation
import SwiftUI

public protocol FavoritesCharacterRepository {
    func markAsFavorite<T: Encodable>(characterID: Int, isFavorite: Bool, characterModel: T, completion: @escaping (Result<Void, Error>) -> Void)
    func unmarkAsFavorite(characterID: Int, isFavorite: Bool, completion: @escaping (Result<Void, Error>) -> Void)
    func getFavorites(completion: @escaping (Result<[Character], Error>) -> Void)
}
