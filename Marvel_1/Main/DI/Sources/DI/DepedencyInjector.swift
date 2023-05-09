//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import AppNavigation
import Common
import Comics
import Swinject
import SwinjectAutoregistration
import UIKit

public class DependencyInjector {

    private var window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    public func build(completion: (_ appCoordinator: AppCoordinator) -> Void) {
        
        let assembler = Assembler([
            CoordinatorsFactoryAssembly(),
            
            SDKAssembly(),
            StorageAssembly(),
            NetworkingAssembly(),
            FireStorageAssembly(),
            DataAssembly(),
            DomainAssembly(),
            
            CoordinatorsAssembly(window: window),
            LoginAssembly(),
            CharacterAssembly(),
            FavoritesAssembly(),
            ComicsAssembly(),
            DetailsCharacterAssembly(),
            DetailsComicsAssembly(),
        ])
        
        let appCoordinator = assembler.resolver.resolveSafe(AppCoordinator.self)
        completion(appCoordinator)
    }
}
