//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import AppNavigation
import Common
import Domain
import Comics
import UIKit

class CoordinatorsAssembly: Assembly {
    
    private weak var appCoordinator: AppCoordinator?
    public var window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    
    func assemble(container: DIContainer) {
        
        let coordinatorFactory = container.resolveSafe(CoordinatorFactory.self)
        container.register(type: AppCoordinator.self, component: AppCoordinator(window: window, factory: coordinatorFactory))
        
        let appCoordinator = container.resolveSafe(AppCoordinator.self)
        self.appCoordinator = appCoordinator
        
        // MARK: - SplashCoordinator
        container.register(type: SplashScreenCoordinator.self, component: SplashScreenCoordinator (navigationController: appCoordinator.navigationController, tabBarController: appCoordinator.tabBarController, container: container))
        
        // MARK: - TabBarCoordinator
        container.register(type: TabBarCoordinator.self, component: TabBarCoordinator(navigationController: appCoordinator.navigationController, tabBarViewController: appCoordinator.tabBarController, container: container))
        
        // MARK: - CharacterCoordinator
        container.register(type: CharacterHomeCoordinator.self, component: CharacterHomeCoordinator (tabBarController: appCoordinator.tabBarController))

        // MARK: - DetailsCharacterCoordinator
        container.register(type: DetailsCharacterCoordinator.self, component: DetailsCharacterCoordinator(navigationController: appCoordinator.navigationController))
        
        // MARK: - DetailsComicsCoordinator
        container.register(type: DetailsComicsCoordinator.self, component: DetailsComicsCoordinator(navigationController: appCoordinator.navigationController))
        
        // MARK: - ComicsCoordinator
        container.register(type: ComicsCoordinator.self, component: ComicsCoordinator (navigationController: appCoordinator.navigationController, tabBarController: appCoordinator.tabBarController))
        
        // MARK: - FavoritesCoordinator
        container.register(type: FavoritesCoordinator.self, component: FavoritesCoordinator (navigationController: appCoordinator.navigationController, tabBarController: appCoordinator.tabBarController))
    }
}

