//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import AppNavigation
import Common
import Comics
import UIKit
import Swinject

class CoordinatorsAssembly: Assembly {
    
    public var window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    func assemble(container: Container) {
        
        let coordinatorFactory = container.resolve(Comics.CoordinatorFactory.self)
        
        container.register(AppCoordinator.self) { _ in AppCoordinator(window: self.window, coordinatorFactory: coordinatorFactory!) }
        let appCoordinator = container.resolve(AppCoordinator.self)
        
        // MARK: - SplashCoordinator
        container.register(SplashScreenCoordinator.self) { _ in
            guard let navigationController = appCoordinator?.navigationController else {
                fatalError("AppCoordinator não foi inicializado corretamente")
            }
            return SplashScreenCoordinator(navigationController: navigationController)
        }
        
        // MARK: - LoginCoordinator
        container.register(LoginCoordinator.self) { _ in
            guard let navigationController = appCoordinator?.navigationController,
                  let tabBarController = appCoordinator?.tabBarController else {
                fatalError("AppCoordinator não foi inicializado corretamente")
            }
            return LoginCoordinator(navigationController: navigationController, tabBarController: tabBarController, coordinatorFactory: coordinatorFactory!)
        }
        
        // MARK: - CreateAccountCoordinator
        container.register(CreateAccountCoordinator.self) { _ in
            guard let navigationController = appCoordinator?.navigationController else {
                fatalError("AppCoordinator não foi inicializado corretamente")
            }
            return CreateAccountCoordinator(navigationController: navigationController, coordinatorFactory: coordinatorFactory!)
        }
        
        // MARK: - TabBarCoordinator
        container.register(TabBarCoordinator.self) { _ in
            guard let navigationController = appCoordinator?.navigationController,
                  let tabBarController = appCoordinator?.tabBarController else {
                fatalError("AppCoordinator não foi inicializado corretamente")
            }
            return TabBarCoordinator(navigationController: navigationController, tabBarViewController: tabBarController, coordinatorfactory:  coordinatorFactory!)
        }
        
        // MARK: - CharacterHomeCoordinator
        container.register(CharacterHomeCoordinator.self) { _ in
            guard let tabBarController = appCoordinator?.tabBarController else {
                fatalError("AppCoordinator não foi inicializado corretamente")
            }
            return CharacterHomeCoordinator(tabBarController: tabBarController, coordinatorFactory: coordinatorFactory!)
        }
        
        // MARK: - DetailsCharacterCoordinator
        container.register(DetailsCharacterCoordinator.self) { _ in
            guard let navigationController = appCoordinator?.navigationController else {
                fatalError("AppCoordinator não foi inicializado corretamente")
            }
            return DetailsCharacterCoordinator(navigationController: navigationController)
        }
        
        // MARK: - DetailsComicsCoordinator
        container.register(DetailsComicsCoordinator.self) { _ in
            guard let navigationController = appCoordinator?.navigationController else {
                fatalError("AppCoordinator não foi inicializado corretamente")
            }
            return DetailsComicsCoordinator(navigationController: navigationController)
        }
        
        // MARK: - ComicsCoordinator
        container.register(ComicsCoordinator.self) { _ in
            guard let tabBarController = appCoordinator?.tabBarController else {
                fatalError("AppCoordinator não foi inicializado corretamente")
            }
            return ComicsCoordinator(tabBarController: tabBarController)
            
        }
        
        // MARK: - FavoritesCoordinator
        container.register(FavoritesCoordinator.self) { _ in
            guard let tabBarController = appCoordinator?.tabBarController else {
                fatalError("AppCoordinator não foi inicializado corretamente")
            }
            return FavoritesCoordinator(tabBarController: tabBarController)
            
        }
    }
}

