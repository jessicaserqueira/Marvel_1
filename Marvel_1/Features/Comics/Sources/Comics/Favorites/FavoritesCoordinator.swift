//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 16/02/23.
//

import Foundation
import UIKit
import Common
import SwiftUI

public class FavoritesCoordinator: Coordinator{
    
    public var childCoordinators: [Coordinator] = []
    public var navigationController = UINavigationController()
    public var tabBarController: UITabBarController?
    var container: DIContainer
    
    public init(tabBarController: UITabBarController, container: DIContainer) {
        self.tabBarController = tabBarController
        self.container = container
    }
    
    @MainActor public func start() {
        let viewModel = FavoritesViewModel(coordinator: self)
        let favoritesView = FavoritesView(viewModel: viewModel)
        
        let hostingController = UIHostingController(rootView: favoritesView)
        hostingController.tabBarItem.title = L10n.Favorites.title
        hostingController.tabBarItem.image = UIImage(named: "heart")
        hostingController.tabBarItem.selectedImage = UIImage(named: "heart-Color")
        
        navigationController.pushViewController(hostingController, animated: true)
    }
}

extension FavoritesCoordinator: FavoritesCoordinating {}
