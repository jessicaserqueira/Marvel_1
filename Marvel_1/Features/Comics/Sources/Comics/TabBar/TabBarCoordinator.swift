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
    
    public init(navigationController: UINavigationController, tabBarViewController: UITabBarController) {
        self.navigationController = navigationController
        self.tabBarViewController = tabBarViewController
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
    
    private func makeCharacterHomeCoordinator() -> CharacterHomeCoordinator {
        let coordinator = CharacterHomeCoordinator(
            navigationController: UINavigationController(),
            tabBarController: tabBarViewController
        )
        coordinator.start()
        return coordinator
    }
    
    @MainActor private func makeComicsCoordinator() -> ComicsCoordinator {
        let coordinator = ComicsCoordinator(
            navigationController: UINavigationController(),
            tabBarController: tabBarViewController
        )
        coordinator.start()
        return coordinator
    }
    
   @MainActor private func makeFavoritesCoordinator() -> FavoritesCoordinator {
        let coordinator = FavoritesCoordinator(
            navigationController: UINavigationController(),
            tabBarController: tabBarViewController
        )
        coordinator.start()
        return coordinator
    }
}
