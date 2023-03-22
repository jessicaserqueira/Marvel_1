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

@available(iOS 14.0, *)
public class LoginCoordinator: Coordinator, LoginCoordinating {
    
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    var tabBarController: UITabBarController
    var container: DIContainer
    
    public init(navigationController: UINavigationController, tabBarController: UITabBarController, container: DIContainer) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
        self.container = container
    }
    
    public func start()  {
        let viewModel = LoginViewModel(coordinator: self)
        let loginView = LoginView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: loginView)
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    public func createAccount() {
        let coordinator = CreateAccountCoordinator(navigationController: navigationController)
        let viewModel = CreateAccountViewModel(coordinator: coordinator)
        let createAccountView = CreateAccountView(viewModel: viewModel)
        navigationController.modalPresentationStyle = .overFullScreen
        navigationController.pushViewController(UIHostingController(rootView: createAccountView), animated: true)
    }
    
    @MainActor public func loginButton(email: String, password: String) {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController, tabBarViewController: tabBarController, container: container)
        tabBarCoordinator.start()
    }
}
