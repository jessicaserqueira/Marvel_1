//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/02/23.
//

import Foundation
import UIKit
import SwiftUI


@available(iOS 14.0, *)
public class SplashScreenCoordinator: LoginCoordinating, CreateAccountCoordinating  {
    
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    
    public init(navigationController: UINavigationController, tabBarController: UITabBarController) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }
    
    public func start() {
        let splashView = SplashScreenView()
        navigationController.pushViewController(UIHostingController(rootView: splashView), animated: true)
        showLoginCoordinator()
    }
    
    func showLoginCoordinator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let viewModel = LoginViewModel(coordinator: self)
            let loginView = LoginView(viewModel: viewModel)
            self.navigationController.pushViewController(UIHostingController(rootView: loginView), animated: true)
        }
    }
    
    // MARK: LoginCoordinating
    public func createAccount() {
        let viewModel = CreateAccountViewModel(coordinator: self)
        let createAccountView = CreateAccountView(viewModel: viewModel)
        navigationController.modalPresentationStyle = .overFullScreen
        navigationController.pushViewController(UIHostingController(rootView: createAccountView), animated: true)
    }
    
    public func returnLoginView() {
        let viewModel = LoginViewModel(coordinator: self)
        _ = LoginView(viewModel: viewModel)
        navigationController.popViewController(animated: true)
    }
    
    public func buttonCreateAccount() {
        let viewModel = LoginViewModel(coordinator: self)
        _ = LoginView(viewModel: viewModel)
        navigationController.popViewController(animated: true)
    }
    
    public func loginButton() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            let tabBarcoordinator = TabBarCoordinator(navigationController: self.navigationController, tabBarViewController: self.tabBarController)
            tabBarcoordinator.start()
        }
    }
}
