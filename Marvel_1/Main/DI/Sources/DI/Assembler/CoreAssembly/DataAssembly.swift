//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import Common
import Domain
import Storage
import SDK
import AppData
import Networking
import FireStorage

class DataAssembly: Assembly {
    
    func assemble(container: DIContainer) {
        
        let characterRemoteDataSource = container.resolveSafe(Networking.CharacterRemoteDataSource.self)
        let comicsRemoteDataSource = container.resolveSafe(Networking.ComicsRemoteDataSource.self)
        let detailsCharacterRemoteDataSource = container.resolveSafe(Networking.DetailsCharacterRemoteDataSource.self)
        let detailsComicsRemoteDataSource = container.resolveSafe(Networking.DetailsComicsRemoteDataSource.self)
        let favoritesCharacterRemoteDataSource = container.resolveSafe(FireStorage.FavoritesCharacterRemoteDataSource.self)
        let loginPersistenceDataSource = container.resolveSafe(FireStorage.LoginPersistenceDataSource.self)
        let loginDataSource = container.resolveSafe(FireStorage.LoginDataSource.self)
        let createAccountRemoteDataSource = container.resolveSafe(FireStorage.CreateAccountRemoteDataSource.self)
        let kingfisherDataSource = container.resolveSafe(AppData.FetchImageDataSource.self)
        
        
        // MARK: - Character
        container.register(type: Domain.CharacterRepository.self, component: AppData.CharaterRepository(remote: characterRemoteDataSource))
        
        // MARK: - Comics
        container.register(type: Domain.ComicsRepository.self, component: AppData.ComicsRepository(remote: comicsRemoteDataSource))
        
        // MARK: - DetailsCharacter
        container.register(type: Domain.DetailsCharacterRepository.self, component: AppData.DetailsCharaterRepository(remote: detailsCharacterRemoteDataSource))
        
        // MARK: - DetailsComics
        container.register(type: Domain.DetailsComicsRepository.self, component: AppData.DetailsComicsRepository(remote: detailsComicsRemoteDataSource))
        
        // MARK: - FavoritesCharacter
        container.register(type: Domain.FavoritesCharacterRepository.self, component: AppData.FavoritesCharacterRepository(remote: favoritesCharacterRemoteDataSource))
        
        // MARK: - LoginPersistence
        container.register(type: Domain.LoginPersistenceRepository.self, component: AppData.LoginPersistenceRepository(remote: loginPersistenceDataSource))
        
        // MARK: - Login
        container.register(type: Domain.LoginRepository.self, component: AppData.LoginRepository(remote: loginDataSource))
        
        // MARK: - CreateAccount
        container.register(type: Domain.CreateAccountRepository.self, component: AppData.CreateAccountRepository(remote: createAccountRemoteDataSource))
        
        // MARK: - Image
        container.register(type: Domain.FetchImageRepository.self, component: AppData.FetchImageRepository(remote: kingfisherDataSource))
    }
}
