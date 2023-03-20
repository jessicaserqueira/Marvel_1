//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import Foundation
import UIKit
import Common
import SwiftUI
import Domain

public class CharacterHomeCoordinator: Coordinator {
    
    public var childCoordinators: [Coordinator] = []
    public var navigationController = UINavigationController()
    public var tabBarController: UITabBarController?
    
    public init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    public func start()  {
        
        let viewModel = CharacterHomeViewModel(coordinator: self)
        let characterHomeView = CharacterHomeView(viewModel: viewModel)
        
        let hostingController = UIHostingController(rootView: characterHomeView)
        hostingController.tabBarItem.title = L10n.Characters.Title.title
        hostingController.tabBarItem.image = UIImage(named: "shield-Color")
        hostingController.tabBarItem.selectedImage = UIImage(named: "shield")
        
        navigationController.pushViewController(hostingController, animated: true)
    }
}

// MARK: CharacterHomeCoordinating
extension CharacterHomeCoordinator: CharacterHomeCoordinating, DetailsCharacterCoordinating {
    public func buttonDetails(with id: Int) {
        let coordinator = DetailsCharacterCoordinator(navigationController: navigationController)
        let viewModel = DetailsCharacterViewModel(coordinator: coordinator)
        let screenDetailsView = DetailsCharacterView(viewModel: viewModel, selectedItemId: id)
        navigationController.modalPresentationStyle = .overFullScreen
        navigationController.present(UIHostingController(rootView: screenDetailsView), animated: true)

    }
}

extension CharacterHomeCoordinator: FavoritesCoordinating {
    @MainActor public func markAsFavorite(characterID: Int, isFavorite: Bool, characterModel: CharacterModel) {
        let viewModel = FavoritesViewModel(coordinator: self)
        viewModel.markAsFavorite(characterID: characterID, isFavorite: isFavorite, characterModel: characterModel)
    }
    
    @MainActor public func unmarkAsFavorite(characterID: Int, isFavorite: Bool) {
        let viewModel = FavoritesViewModel(coordinator: self)
        viewModel.unmarkAsFavorite(characterID: characterID, isFavorite: isFavorite)

    }
}
