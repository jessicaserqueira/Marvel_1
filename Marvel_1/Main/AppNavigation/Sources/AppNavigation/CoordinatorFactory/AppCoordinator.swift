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
import Swinject

public class AppCoordinator: Common.Coordinator {
    
    public var window: UIWindow
    public var navigationController: UINavigationController
    public var tabBarController: UITabBarController
    public var childCoordinators: [Coordinator] = []
    public var coordinatorFactory: CoordinatorFactory?

    
    private var loginPersistenceUseCase: LoginPersistenceUseCaseProtocol?
    private var characterUseCase: CharacterUseCaseProtocol?
    
    public init(window: UIWindow, coordinatorFactory: CoordinatorFactory?) {
        self.window = window
        self.coordinatorFactory = coordinatorFactory
        self.navigationController = UINavigationController()
        self.tabBarController = UITabBarController()
    }
    
    @MainActor public func start() {
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        showSplashCoordinator()
  
    }
}

extension AppCoordinator {
    
    func showSplashCoordinator() {
        guard let coordinator = coordinatorFactory?.makeSplashCoordinator() else { return }
        coordinator.start()
        loginPersistence()
    }
    
    func loginPersistence() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loginPersistenceUseCase?.loginValidation()
                self.loginPersistenceValidation()
        }
    }
    
    @MainActor func loginPersistenceValidation() {
        guard let coordinator = self.coordinatorFactory else { return }
        
        if loginPersistenceUseCase?.isLogged == true {
            coordinator.makeTabBarCoordinator().start()
        } else {
            coordinator.makeLoginCoordinator().start()
        }
    }
}
