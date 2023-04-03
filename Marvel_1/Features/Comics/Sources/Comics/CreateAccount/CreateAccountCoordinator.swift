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


public class CreateAccountCoordinator: Coordinator, CreateAccountCoordinating {
    
    public var childCoordinators: [Coordinator] = []
    public var navigationController = UINavigationController()
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    public func start()  {
        let viewModel = CreateAccountViewModel(coordinator: self)
        let createAccountView = CreateAccountView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: createAccountView)
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    public func returnLoginView() {
        let coordinator = LoginCoordinator(navigationController: navigationController, tabBarController: UITabBarController())
        let viewModel = LoginViewModel(coordinator: coordinator)
        _ = LoginView(viewModel: viewModel)
        navigationController.popViewController(animated: true)
    }
    
    public func buttonCreateAccount() {
        let coordinator = LoginCoordinator(navigationController: navigationController, tabBarController: UITabBarController())
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let viewModel = LoginViewModel(coordinator: coordinator)
            _ = LoginView(viewModel: viewModel)
            self.navigationController.popViewController(animated: true)
        }
    }
    
    public func dismissModal() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let coordinator = LoginCoordinator(navigationController: self.navigationController, tabBarController: UITabBarController())
            let viewModel = LoginViewModel(coordinator: coordinator)
            _ = LoginView(viewModel: viewModel)
            self.navigationController.popViewController(animated: true)
        }
    }
}
