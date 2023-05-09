//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 15/03/23.
//

import Common
import FireStorage
import AppData
import Swinject

class FireStorageAssembly: Assembly {
    
    func assemble(container: Container) {
        
        // MARK: - FavoritesCharacter
        container.autoregister(FavoriteService.self) { _ in
            FavoriteService()
        }
        
        container.autoregister(AppData.FavoritesCharacterRemoteDataSource.self) { _ in
            guard let favoriteService = container.resolve(FavoriteService.self) else {
                fatalError("ServiceManager not found")
            }
            return FireStorage.FavoritesCharacterRemoteDataSource(favoriteService: favoriteService)
        }
        
        // MARK: - LoginPersistence
        container.autoregister(LoginPersistenceService.self) { _ in
            LoginPersistenceService()
        }
        
        container.autoregister(AppData.LoginPersistenceDataSource.self) { _ in
            guard let loginPresistenceService = container.resolve(LoginPersistenceService.self) else {
                fatalError("ServiceManager not found")
            }
            return FireStorage.LoginPersistenceDataSource(loginPresistenceService: loginPresistenceService)
        }
        
        // MARK: - Login
        container.autoregister(LoginService.self) { _ in
            LoginService()
        }
        
        container.autoregister(AppData.LoginDataSource.self) { _ in
            guard let loginService = container.resolve(LoginService.self) else {
                fatalError("ServiceManager not found")
            }
            return FireStorage.LoginDataSource(loginService: loginService)
        }
        
        // MARK: - CreateAccount
        container.autoregister(CreateAccountService.self) { _ in
            CreateAccountService()
        }
        
        container.autoregister(AppData.CreateAccountRemoteDataSource.self) { _ in
            guard let createAccountService = container.resolve(CreateAccountService.self) else {
                fatalError("ServiceManager not found")
            }
            return FireStorage.CreateAccountRemoteDataSource(createAccountService: createAccountService)
        }
    }
}
