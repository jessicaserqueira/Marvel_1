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

class DataAssembly: Assembly {
    
    func assemble(container: DIContainer) {
        
        let characterRemoteDataSource = container.resolveSafe(Networking.CharacterRemoteDataSource.self)
        let comicsRemoteDataSource = container.resolveSafe(Networking.ComicsRemoteDataSource.self)
        let detailsCharacterRemoteDataSource = container.resolveSafe(Networking.DetailsCharacterRemoteDataSource.self)
        let kingfisherDataSource = container.resolveSafe(AppData.FetchImageDataSource.self)
        
        
        //MARK: - AppData
        container.register(type: Domain.CharacterRepository.self, component: AppData.CharaterRepository(remote: characterRemoteDataSource))
        
        container.register(type: Domain.ComicsRepository.self, component: AppData.ComicsRepository(remote: comicsRemoteDataSource))
        
        container.register(type: Domain.DetailsCharacterRepository.self, component: AppData.DetailsCharaterRepository(remote: detailsCharacterRemoteDataSource ))
        
        container.register(type: Domain.FetchImageRepository.self, component: AppData.FetchImageRepository(remote: kingfisherDataSource))
    }
}
