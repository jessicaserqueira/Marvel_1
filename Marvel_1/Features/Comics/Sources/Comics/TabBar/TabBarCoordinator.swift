//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 10/02/23.
//

import Common
import UIKit
import SwiftUI
import Swinject

public class TabBarCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var tabBarViewController: UITabBarController
    public var childCoordinators: [Coordinator]
    var coordinatorfactory: CoordinatorFactory
    
    public init(navigationController: UINavigationController, tabBarViewController: UITabBarController, coordinatorfactory: CoordinatorFactory) {
        self.navigationController = navigationController
        self.tabBarViewController = tabBarViewController
        self.coordinatorfactory = coordinatorfactory
        self.childCoordinators = []
        
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
        UIApplication.shared.windows.first?.rootViewController = tabBarViewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @MainActor private func makeCharacterHomeCoordinator() -> CharacterHomeCoordinator {
        let coordinator = coordinatorfactory.makeCharacterCoordinator()
        coordinator.start()
        coordinator.navigationController.tabBarItem = UITabBarItem(title:  L10n.Characters.Title.title,
                                                                   image: UIImage(named: "shield-Color"),
                                                                   selectedImage: UIImage(named: "shield"))
        
        return coordinator
    }
    
    @MainActor private func makeComicsCoordinator() -> ComicsCoordinator {
        let coordinator = coordinatorfactory.makeComicsCoordinator()
        coordinator.start()
        coordinator.navigationController.tabBarItem = UITabBarItem(title:  L10n.Hq.title,
                                                                   image: UIImage(named: "hq"),
                                                                   selectedImage: UIImage(named: "hq-Color"))
        return coordinator
    }
    
    @MainActor private func makeFavoritesCoordinator() -> FavoritesCoordinator {
        let coordinator = coordinatorfactory.makeFavoritesCoordinator()
        coordinator.start()
        coordinator.navigationController.tabBarItem = UITabBarItem(title:  L10n.Characters.Title.title,
                                                                   image: UIImage(named:  "heart"),
                                                                   selectedImage: UIImage(named: "heart-Color"))
        return coordinator
    }
}
