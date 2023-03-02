//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import Common
import Domain

class DomainAssembly: Assembly {
    
    func assemble(container: DIContainer) {
        assembleComics(container)
    }
    
    private func assembleComics(_ container: DIContainer) {
        
        //MARK: - Domain
        let characterRepository = container.resolveSafe(Domain.CharacterRepository.self)
        container.register(type: Domain.CharacterUseCaseProtocol.self, component:  Domain.CharacterUseCase(characterRepository: characterRepository))
        
        let comicsRepository = container.resolveSafe(Domain.ComicsRepository.self)
        container.register(type: Domain.ComicsUseCaseProtocol.self, component:  Domain.ComicsUseCase(comicsRepository: comicsRepository))
        
        let detailsCharacterRepository = container.resolveSafe(Domain.DetailsCharacterRepository.self)
        container.register(type: Domain.DetailsCharacterUseCaseProtocol.self, component:  Domain.DetailsCharacterUseCase(detailsCharacterRepository: detailsCharacterRepository))
        
        let fetchImageRepository = container.resolveSafe(Domain.FetchImageRepository.self)
        container.register(type: Domain.FetchImageUseCaseProtocol.self, component: Domain.FetchImageUseCase(fetchImageRepository: fetchImageRepository))
    }
}
