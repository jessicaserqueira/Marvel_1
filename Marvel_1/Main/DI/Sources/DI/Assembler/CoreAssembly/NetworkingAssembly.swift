//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import Common
import Networking
import AppData
import Swinject

class NetworkingAssembly: Assembly {
    
    func assemble(container: Container) {
        
        // MARK: - Character
        container.autoregister(ServiceManager.self) { _ in
            ServiceManager()
        }
        
        container.autoregister(AppData.CharacterRemoteDataSource.self) { _ in
            guard let serviceManager = container.resolve(ServiceManager.self) else {
                fatalError("ServiceManager not found")
            }
            return Networking.CharacterRemoteDataSource(serviceManager: serviceManager)
        }
        
        // MARK: - Comics
        container.autoregister(AppData.ComicsRemoteDataSource.self) { _ in
            guard let serviceManager = container.resolve(ServiceManager.self) else {
                fatalError("ServiceManager not found")
            }
            return Networking.ComicsRemoteDataSource(serviceManager: serviceManager)
        }
        
        // MARK: - DetailsCharacter
        container.autoregister(AppData.DetailsCharacterRemoteDataSource.self)  { _ in
            guard let serviceManager = container.resolve(ServiceManager.self) else {
                fatalError("ServiceManager not found")
            }
            return Networking.DetailsCharacterRemoteDataSource(serviceManager: serviceManager)
        }
        
        // MARK: - DetailsComics
        container.autoregister(AppData.DetailsComicsRemoteDataSource.self)  { _ in
            guard let serviceManager = container.resolve(ServiceManager.self) else {
                fatalError("ServiceManager not found")
            }
            return Networking.DetailsComicsRemoteDataSource(serviceManager: serviceManager)
            
        }
    }
}
