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
        container.register(type: SplashScreenCoordinator.self, component: SplashScreenCoordinator (navigationController: appCoordinator.navigationController))
        
        // MARK: - CharacterCoordinator
        container.register(type: CharacterHomeCoordinator.self, component: CharacterHomeCoordinator (navigationController: appCoordinator.navigationController))
        
        // MARK: - ScreenDetailsCoordinator
        container.register(type: ScreenDetailsCoordinator.self, component: ScreenDetailsCoordinator(navigationController: appCoordinator.navigationController))
    }
}
