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
        let kingfisherDataSource = container.resolveSafe(AppData.FetchImageDataSource.self)
        
//        let comicsLocalDataSource =
//        container.resolveSafe(Storage.ComicsLocalDataSource.self)
//        let comicsRemoteDataSource =
//        container.resolveSafe(Networking.ComicsRemoteDataSource.self)
        
        //MARK: - AppData
        container.register(type: Domain.CharacterRepository.self, component: AppData.CharaterRepository(remote: characterRemoteDataSource))
        container.register(type: Domain.FetchImageRepository.self, component: AppData.FetchImageRepository(remote: kingfisherDataSource))
    }
}
