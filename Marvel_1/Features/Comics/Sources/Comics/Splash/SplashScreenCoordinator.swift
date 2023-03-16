//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/02/23.
//

import Foundation
import Common
import UIKit
import SwiftUI


@available(iOS 14.0, *)
public class SplashScreenCoordinator {
    
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    var container: DIContainer
    
    public init(navigationController: UINavigationController, tabBarController: UITabBarController, container: DIContainer) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
        self.container = container
    }
    
    public func start() {
        let splashView = SplashScreenView()
        navigationController.pushViewController(UIHostingController(rootView: splashView), animated: true)
    }
    
//    func showLoginCoordinator() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            let viewModel = LoginViewModel(coordinator: self)
//            let loginView = LoginView(viewModel: viewModel)
//            self.navigationController.pushViewController(UIHostingController(rootView: loginView), animated: true)
//        }
//    }
//
//    public func returnLoginView() {
//        let viewModel = LoginViewModel(coordinator: self)
//        _ = LoginView(viewModel: viewModel)
//        navigationController.popViewController(animated: true)
//    }
//
//    public func buttonCreateAccount() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            let viewModel = LoginViewModel(coordinator: self)
//            _ = LoginView(viewModel: viewModel)
//            self.navigationController.popViewController(animated: true)
//        }
//    }
}
