//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import Common
import Domain
import Swinject

class DomainAssembly: Assembly {
    
    func assemble(container: Container) {
        assembleComics(container)
    }
    
    private func assembleComics(_ container: Container) {
        
        // MARK: - Character
        let characterRepository = container.resolveSafe(Domain.CharacterRepository.self)
        container.register(Domain.CharacterUseCaseProtocol.self) {_ in CharacterUseCase.init(characterRepository: characterRepository) }
        
        // MARK: - Comics
        let comicsRepository = container.resolveSafe(Domain.ComicsRepository.self)
        container.register(Domain.ComicsUseCaseProtocol.self){ _ in ComicsUseCase.init(comicsRepository: comicsRepository) }
        
        // MARK: - DetaislCharacte
        let detailsCharacterRepository = container.resolveSafe(Domain.DetailsCharacterRepository.self)
        container.register(Domain.DetailsCharacterUseCaseProtocol.self) { _ in DetailsCharacterUseCase.init(detailsCharacterRepository: detailsCharacterRepository) }
        
        // MARK: - DetaislComics
        let detailsComicsRepository = container.resolveSafe(Domain.DetailsComicsRepository.self)
        container.register(Domain.DetailsComicsUseCaseProtocol.self) { _ in DetailsComicsUseCase.init(detailsComicsRepository: detailsComicsRepository) }
        
        // MARK: - FavoritesCharacter
        let favoritesCharacterRepository = container.resolveSafe(Domain.FavoritesCharacterRepository.self)
        container.register(Domain.FavoritesCharacterUseCaseProtocol.self){ _ in FavoritesCharacterUseCase.init(favoritesCharacterRepository: favoritesCharacterRepository)}
        
        // MARK: - LoginPersistence
        let loginPersistenceRepository = container.resolveSafe(Domain.LoginPersistenceRepository.self)
        container.register(Domain.LoginPersistenceUseCaseProtocol.self) { _ in LoginPersistenceUseCase.init(loginPersistenceRepository: loginPersistenceRepository) }
        
        // MARK: - Login
        let loginRepository = container.resolveSafe(Domain.LoginRepository.self)
        container.register(Domain.LoginUseCaseProtocol.self) { _ in LoginUseCase.init(loginRepository: loginRepository) }
        
        // MARK: - CreateAccount
        let createAccountRepository = container.resolveSafe(Domain.CreateAccountRepository.self)
        container.register(Domain.CreateAccountUseCaseProtocol.self) { _ in CreateAccountUseCase.init(createAccountRepository: createAccountRepository) }
        
        // MARK: - Image
        let fetchImageRepository = container.resolveSafe(Domain.FetchImageRepository.self)
        container.register(Domain.FetchImageUseCaseProtocol.self) { _ in FetchImageUseCase.init(fetchImageRepository: fetchImageRepository) }
    }
}
