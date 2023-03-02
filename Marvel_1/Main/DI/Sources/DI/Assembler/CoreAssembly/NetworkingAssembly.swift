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
        
        container.register(type: AppData.CharacterRemoteDataSource.self,
                           component: Networking.CharacterRemoteDataSource.init(serviceManager: ServiceManager()))
        
        container.register(type: AppData.ComicsRemoteDataSource.self, component:  Networking.ComicsRemoteDataSource.init(serviceManager: ServiceManager()))
        
        container.register(type: AppData.DetailsCharacterRemoteDataSource.self,
                           component: Networking.DetailsCharacterRemoteDataSource.init(serviceManager: ServiceManager()))
    }
}
