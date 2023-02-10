//
//  AppCoordinator.swift
//
//
//  Created by Jessica Serqueira on 15/01/23.
//

import UIKit
import Common
import Comics

public class AppCoordinator: Common.Coordinator {
    
    public var coordinatorDelegate: CoordinatorDelegate?
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    public var window: UIWindow
    public let coordinatorFactory: CoordinatorFactory
    
    public init(window: UIWindow, factory: CoordinatorFactory) {
        self.window = window
        self.coordinatorFactory = factory
        self.navigationController = UINavigationController()
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
    }

    public func start() {
        showSplashCoordinator()
    }
}
 
extension AppCoordinator {
    
    func showSplashCoordinator() {
        let coordinator = coordinatorFactory.makeScreenDetailsCoordinator()
        coordinator.start()
    }
}

extension AppCoordinator: CharacterHomeCoordinatorDelegate {
    public func showCharacter() {
        
    }
}
