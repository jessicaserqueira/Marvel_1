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
    var container: DIContainer
    @Published public var userID: String = ""
    private lazy var loginPersistenceUseCase = DIContainer.shared.resolveSafe(Domain.LoginPersistenceUseCaseProtocol.self)
    
    public init(navigationController: UINavigationController, tabBarController: UITabBarController, container: DIContainer) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
        self.container = container
    }
    
    @MainActor public func start()  {
        let viewModel = LoginViewModel(coordinator: self)
        let loginView = LoginView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: loginView)
        navigationController.pushViewController(hostingController, animated: true)
        viewModel.onAppear()
    }
}

@available(iOS 14.0, *)
extension LoginCoordinator: LoginCoordinating {
    
//    @MainActor public func onAppear() {
//        loginPersistenceUseCase.loginValidation()
////        isLogged(loginPersistenceUseCase.isLogged)
//    }
    
    // MARK: -LoginPersisntence
    @MainActor public func logout() {
//        loginPersistenceUseCase.logout()
        start()
        tabBarController.tabBar.isHidden = true
    }
    
    @MainActor public func isLogged(_ isLogged: Bool) {
        if isLogged {
            let coordinator = TabBarCoordinator(navigationController: navigationController, tabBarViewController: tabBarController, container: container)
            coordinator.start()
        } else {
            start()
        }
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
