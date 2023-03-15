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
    func markAsFavorite(completion: @escaping (Result<CharacterResponse, Error>) -> Void)
    func unmarkAsFavorite(completion: @escaping (Result<CharacterResponse, Error>) -> Void)
}
