//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import Common
import AppData
import Domain
import Swinject

class DataAssembly: Assembly {
    
    func assemble(container: Container) {
        
        // MARK: - Character
        container.autoregister(Domain.CharacterRepository.self, initializer: AppData.CharaterRepository.init)
        
        // MARK: - Comics
        container.autoregister(Domain.ComicsRepository.self, initializer: AppData.ComicsRepository.init)
        
        // MARK: - DetailsCharacter
        container.autoregister(Domain.DetailsCharacterRepository.self, initializer: AppData.DetailsCharaterRepository.init)
        
        // MARK: - DetailsComics
        container.autoregister(Domain.DetailsComicsRepository.self, initializer: AppData.DetailsComicsRepository.init)
        
        // MARK: - FavoritesCharacter
        container.autoregister(Domain.FavoritesCharacterRepository.self, initializer: AppData.FavoritesCharacterRepository.init)
        
        // MARK: - LoginPersistence
        container.autoregister(Domain.LoginPersistenceRepository.self, initializer: AppData.LoginPersistenceRepository.init)
        
        // MARK: - Login
        container.autoregister(Domain.LoginRepository.self, initializer: AppData.LoginRepository.init)
        
        // MARK: - CreateAccount
        container.autoregister(Domain.CreateAccountRepository.self, initializer: AppData.CreateAccountRepository.init)
        
        // MARK: - Image
        container.autoregister(Domain.FetchImageRepository.self, initializer: AppData.FetchImageRepository.init)
    }
}
