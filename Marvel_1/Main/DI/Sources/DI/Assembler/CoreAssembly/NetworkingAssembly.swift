//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import Common
import Networking
import AppData

class NetworkingAssembly: Assembly {
    
    func assemble(container: DIContainer) {
        
        // MARK: - Character
        container.register(type: AppData.CharacterRemoteDataSource.self,
                           component: Networking.CharacterRemoteDataSource.init(serviceManager: ServiceManager()))
        
        // MARK: - Comics
        container.register(type: AppData.ComicsRemoteDataSource.self, component:  Networking.ComicsRemoteDataSource.init(serviceManager: ServiceManager()))
        
        // MARK: - DetailsCharacter
        container.register(type: AppData.DetailsCharacterRemoteDataSource.self,
                           component: Networking.DetailsCharacterRemoteDataSource.init(serviceManager: ServiceManager()))
        
        // MARK: - DetailsComics
        container.register(type: AppData.DetailsComicsRemoteDataSource.self,
                           component: Networking.DetailsComicsRemoteDataSource.init(serviceManager: ServiceManager()))
    }
}
