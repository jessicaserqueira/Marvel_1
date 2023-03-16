//
//  AppCoordinator.swift
//
//
//  Created by Jessica Serqueira on 15/01/23.
//

import UIKit
import Common
import Comics

@available(iOS 14.0, *)
public class AppCoordinator: Common.Coordinator {
    
    public var window: UIWindow
    public var navigationController: UINavigationController
    public var tabBarController: UITabBarController
    public var childCoordinators: [Coordinator] = []
    public let coordinatorFactory: CoordinatorFactory
    
    public init(window: UIWindow, factory: CoordinatorFactory) {
        self.window = window
        self.coordinatorFactory = factory
        self.navigationController = UINavigationController()
        self.tabBarController = UITabBarController()
    }
    
    public func start() {
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        showSplashCoordinator()
    }
}

@available(iOS 14.0, *)
extension AppCoordinator {
    
    func showSplashCoordinator() {
            let coordinator = coordinatorFactory.makeSplashCoordinator()
            coordinator.start()
            showLogin()
        }
        
        func showLogin() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let coordinator = self.coordinatorFactory.makeLoginCoordinator()
                coordinator.start()
            }
        }
    
//    @MainActor func showTabBarCoordinator() {
//        let coordinator = coordinatorFactory.makeTabBarCoordinator()
//        coordinator.start()
//    }
}

