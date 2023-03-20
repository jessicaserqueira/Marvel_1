//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 15/03/23.
//

import Common
import FireStorage
import AppData

class FireStorageAssembly: Assembly {
    
    func assemble(container: DIContainer) {
        
        // MARK: - FavoritesCharacter
        container.register(type: AppData.FavoritesCharacterRemoteDataSource.self,
                           component: FireStorage.FavoritesCharacterRemoteDataSource.init(favoriteService: FavoriteService()))
        
    }
}
