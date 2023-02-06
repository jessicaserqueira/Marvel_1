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

    public init(navigationController: UINavigationController, delegate: CharacterHomeCoordinatorDelegate) {
        self.navigationController = navigationController
        self.coordinatorDelegate = delegate
    }
    
    public func start() {
        showCharacter()
    }
}

extension CharacterHomeCoordinator {
    func showCharacter() {
        
        let viewModel = CharacterHomeViewModel(coordinator: self)
        
        let characterHomeView = CharacterHomeView(viewModel: viewModel)
        navigationController.pushViewController(UIHostingController(rootView: characterHomeView), animated: true)
    }
}


extension CharacterHomeCoordinator: CharacterHomeCoordinating {
    public func nextScreen() {
        
    }
    
    public func previousScreen() {
        
    }
}
