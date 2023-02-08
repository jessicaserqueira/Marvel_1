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

public protocol CharacterHomeCoordinatorDelegate: AnyObject {
    
    func showCharacter()
}

public struct CharacterHomeCoordinator {
    
    public var coordinatorDelegate: CharacterHomeCoordinatorDelegate?
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let viewModel = CharacterHomeViewModel(coordinator: self)
        let characterHomeView = CharacterHomeView(viewModel: viewModel)
        navigationController.pushViewController(UIHostingController(rootView: characterHomeView), animated: false)
    }
}

// MARK: CharacterHomeCoordinator
extension CharacterHomeCoordinator {

    func showScreenCharacter(_ splashView: SplashScreenView) {
        let viewModel = CharacterHomeViewModel(coordinator: self)
        let characterHomeView = CharacterHomeView(viewModel: viewModel)
        navigationController.pushViewController(UIHostingController(rootView: characterHomeView), animated: true)
    }
}

// MARK: CharacterHomeCoordinating
extension CharacterHomeCoordinator: CharacterHomeCoordinating {
    
    public func nextScreen() {
        
    }
    
    public func previousScreen() {
        
    }
    
    public func buttonDetails() {
        let screenDetailsView = ScreenDetailsView()
        navigationController.pushViewController(UIHostingController(rootView: screenDetailsView), animated: true)
    }
}
