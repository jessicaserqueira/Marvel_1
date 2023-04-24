//
//  AppCoordinator.swift
//
//
//  Created by Jessica Serqueira on 15/01/23.
//

import UIKit
import Common
import Domain
import Comics

public class AppCoordinator: Common.Coordinator {
    
    public var window: UIWindow
    public var navigationController: UINavigationController
    public var tabBarController: UITabBarController
    public var childCoordinators: [Coordinator] = []
    public let coordinatorFactory: CoordinatorFactory
    private var container: DIContainer
    
    private lazy var loginPersistenceUseCase = DIContainer.shared.resolveSafe(Domain.LoginPersistenceUseCaseProtocol.self)
    private lazy var characterUseCase = DIContainer.shared.resolveSafe(Domain.CharacterUseCaseProtocol.self)
    
    public init(window: UIWindow, factory: CoordinatorFactory, container: DIContainer) {
        self.window = window
        self.coordinatorFactory = factory
        self.navigationController = UINavigationController()
        self.tabBarController = UITabBarController()
        self.container = container
    }
    
    @MainActor public func start() {
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        showSplashCoordinator()
  
    }
}

extension AppCoordinator {
    
    func showSplashCoordinator() {
        let coordinator = coordinatorFactory.makeSplashCoordinator()
        coordinator.start()
        loginPersistence()
    }
    
    func loginPersistence() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loginPersistenceUseCase.loginValidation()
                self.loginPersistenceValidation()
        }
    }
    
    @MainActor func loginPersistenceValidation() {
        
        if loginPersistenceUseCase.isLogged {
            let coordinator = self.coordinatorFactory.makeTabBarCoordinator()
            coordinator.start()
            
        } else {
            let coordinator = self.coordinatorFactory.makeLoginCoordinator()
            coordinator.start()
        }
    }
}
