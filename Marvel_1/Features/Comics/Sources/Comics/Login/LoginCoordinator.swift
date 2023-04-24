//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/03/23.
//

import Foundation
import Common
import SwiftUI
import Domain

public class LoginCoordinator: Coordinator {
    
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    var tabBarController: UITabBarController

    public init(navigationController: UINavigationController, tabBarController: UITabBarController) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }
    
    @MainActor public func start()  {
        let viewModel = LoginViewModel(coordinator: self)
        let loginView = LoginView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: loginView)
        navigationController.setViewControllers([hostingController], animated: false)

    }
}

extension LoginCoordinator: LoginCoordinating {
    
    // MARK: -LoginPersisntence
    
    @MainActor public func loginValidation(email: String, password: String) {
        let coordinator = DIContainer.shared.resolveSafe(TabBarCoordinator.self)
        coordinator.start()
    }
    
    // MARK: -CreateAccount
    public func createAccount() {
        let coordinator = CreateAccountCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
