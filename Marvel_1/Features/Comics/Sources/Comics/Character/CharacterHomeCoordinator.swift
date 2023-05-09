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

public class CharacterHomeCoordinator: Coordinator, CharacterHomeCoordinating {
    
    public var childCoordinators: [Coordinator] = []
    public var navigationController = UINavigationController()
    public var tabBarController: UITabBarController
    
    private var coordinatorFactory: CoordinatorFactory
    private var loginPersistenceUseCase: LoginPersistenceUseCaseProtocol?
    
    public init(tabBarController: UITabBarController, coordinatorFactory: CoordinatorFactory) {
        self.tabBarController = tabBarController
        self.coordinatorFactory = coordinatorFactory
        
    }
    
    public func start()  {
        let viewModel = CharacterHomeViewModel(coordinator: self)
        let characterHomeView = CharacterHomeView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: characterHomeView)
        navigationController.pushViewController(hostingController, animated: true)
    }
}

// MARK: CharacterHomeCoordinating
extension CharacterHomeCoordinator: DetailsCharacterCoordinating {
    
    public func buttonDetails(with id: Int) {
        let coordinator = DetailsCharacterCoordinator(navigationController: navigationController)
        let viewModel = DetailsCharacterViewModel(coordinator: coordinator)
        let screenDetailsView = DetailsCharacterView(viewModel: viewModel, selectedItemId: id)
        navigationController.modalPresentationStyle = .overFullScreen
        navigationController.present(UIHostingController(rootView: screenDetailsView), animated: true)
    }
    
    @MainActor
    public func signOut() {
        loginPersistenceUseCase?.logout()
        tabBarController.viewControllers?.removeAll()
        navigationController.viewControllers.removeAll()
        
        let coordinator = coordinatorFactory.makeLoginCoordinator()
        coordinator.start()
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
    
    @MainActor  public func getFavorites() {
        let viewModel = FavoritesViewModel(coordinator: self)
        viewModel.getFavorites()
    }
}
