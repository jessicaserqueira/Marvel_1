//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 10/02/23.
//

import Common
import UIKit
import SwiftUI

public class TabBarCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var tabBarViewController: UITabBarController
    public var childCoordinators: [Coordinator] = []
    var container: DIContainer
    
    public init(navigationController: UINavigationController, tabBarViewController: UITabBarController, container: DIContainer) {
        self.navigationController = navigationController
        self.tabBarViewController = tabBarViewController
        self.container = container
    }
    
    @MainActor public func start() {
        let characterHomeCoordinator = makeCharacterHomeCoordinator()
        let comicsCoordinator = makeComicsCoordinator()
        let favoritesCoordinator = makeFavoritesCoordinator()
        
        childCoordinators = [
            characterHomeCoordinator,
            comicsCoordinator,
            favoritesCoordinator
        ]
        
        tabBarViewController.setViewControllers(
            [
                characterHomeCoordinator.navigationController,
                comicsCoordinator.navigationController,
                favoritesCoordinator.navigationController
            ],
            animated: true
        )
        
        tabBarViewController.tabBar.tintColor = .black
        navigationController.setViewControllers([tabBarViewController], animated: true)
    }
    
    @MainActor private func makeCharacterHomeCoordinator() -> CharacterHomeCoordinator {
        let coordinator = container.resolveSafe(CharacterHomeCoordinator.self)
        coordinator.start()
        return coordinator
    }
    
    @MainActor private func makeComicsCoordinator() -> ComicsCoordinator {
        let coordinator = container.resolveSafe(ComicsCoordinator.self)
        coordinator.start()
        return coordinator
    }
    
   @MainActor private func makeFavoritesCoordinator() -> FavoritesCoordinator {
       let coordinator = container.resolveSafe(FavoritesCoordinator.self)
        coordinator.start()
        return coordinator
    }
}
