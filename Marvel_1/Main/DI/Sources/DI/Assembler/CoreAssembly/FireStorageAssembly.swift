//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 15/03/23.
//

import Common
import FireStorage
import AppData

@available(iOS 14.0, *)
class FireStorageAssembly: Assembly {
    
    func assemble(container: DIContainer) {
        
        // MARK: - FavoritesCharacter
        container.register(type: AppData.FavoritesCharacterRemoteDataSource.self,
                           component: FireStorage.FavoritesCharacterRemoteDataSource.init(favoriteService: FavoriteService()))
        
        // MARK: - LoginPersistence
        container.register(type: AppData.LoginPersistenceDataSource.self,
                           component: FireStorage.LoginPersistenceDataSource.init(loginPresistenceService: LoginPersistenceService()))
        
        // MARK: - Login
        container.register(type: AppData.LoginDataSource.self,
                           component: FireStorage.LoginDataSource.init(loginService: LoginService()))
    }
}