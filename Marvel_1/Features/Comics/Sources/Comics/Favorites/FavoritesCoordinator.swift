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
    
    public init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
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

extension FavoritesCoordinator: FavoritesCoordinating, DetailsCharacterCoordinating {
    
    public func buttonDetails(with id: Int) {
        let coordinator = DetailsCharacterCoordinator(navigationController: navigationController)
        let viewModel = DetailsCharacterViewModel(coordinator: coordinator)
        let screenDetailsView = DetailsCharacterView(viewModel: viewModel, selectedItemId: id)
        navigationController.modalPresentationStyle = .overFullScreen
        navigationController.present(UIHostingController(rootView: screenDetailsView), animated: true)
        
    }
}
