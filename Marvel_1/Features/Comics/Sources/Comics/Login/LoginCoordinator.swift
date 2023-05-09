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
    var coordinatorFactory: CoordinatorFactory?

    public init(navigationController: UINavigationController, tabBarController: UITabBarController, coordinatorFactory: CoordinatorFactory?) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
        self.coordinatorFactory = coordinatorFactory
    }
    
    @MainActor public func start()  {
        let viewModel = LoginViewModel(coordinator: self)
        let loginView = LoginView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: loginView)
        navigationController.setViewControllers([hostingController], animated: false)
        navigationController.tabBarController?.tabBar.isHidden = false
    }
}

extension LoginCoordinator: LoginCoordinating {
    
    // MARK: -LoginPersisntence
    
    @MainActor public func loginValidation(email: String, password: String) {
        guard let coordinator = coordinatorFactory?.makeTabBarCoordinator() else {  return }
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    // MARK: -CreateAccount
    public func createAccount() {
        guard let coordinator = coordinatorFactory?.makeCreateAccountCoordinator()  else {  return }
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}
