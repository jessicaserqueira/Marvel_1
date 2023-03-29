//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/03/23.
//

import Foundation
import UIKit
import Common
import SwiftUI
import Domain

@available(iOS 14.0, *)
public class LoginCoordinator: Coordinator {
    
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    var tabBarController: UITabBarController
    private var container: DIContainer
    
    public init(navigationController: UINavigationController, tabBarController: UITabBarController, container: DIContainer) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
        self.container = container
    }
    
    @MainActor public func start()  {
        let viewModel = LoginViewModel(coordinator: self)
        let loginView = LoginView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: loginView)
        navigationController.setViewControllers([hostingController], animated: true)
    }
}

@available(iOS 14.0, *)
extension LoginCoordinator: LoginCoordinating {
    
    // MARK: -LoginPersisntence
    
    @MainActor public func loginValidation(email: String, password: String) {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController, tabBarViewController: tabBarController, container: container)
        tabBarCoordinator.start()
    }
    
    // MARK: -CreateAccount
    public func createAccount() {
        let coordinator = CreateAccountCoordinator(navigationController: navigationController)
        let viewModel = CreateAccountViewModel(coordinator: coordinator)
        let createAccountView = CreateAccountView(viewModel: viewModel)
        navigationController.modalPresentationStyle = .overFullScreen
        navigationController.pushViewController(UIHostingController(rootView: createAccountView), animated: true)
    }
}
