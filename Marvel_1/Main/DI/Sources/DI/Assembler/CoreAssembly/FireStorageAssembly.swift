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
        
        // MARK: - LoginPersistence
        container.register(type: AppData.LoginPersistenceDataSource.self,
                           component: FireStorage.LoginPersistenceDataSource.init(loginPresistenceService: LoginPersistenceService()))
        
        // MARK: - Login
        container.register(type: AppData.LoginDataSource.self,
                           component: FireStorage.LoginDataSource.init(loginService: LoginService()))
        
        // MARK: - CreateAccount
        container.register(type: AppData.CreateAccountRemoteDataSource.self,
                           component: FireStorage.CreateAccountRemoteDataSource.init(createAccountService: CreateAccountService()))
    }
}
