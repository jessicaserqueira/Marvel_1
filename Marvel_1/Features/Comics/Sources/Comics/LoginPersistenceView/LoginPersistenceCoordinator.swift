////
////  File.swift
////  
////
////  Created by NMAS Amaral on 17/03/23.
////
//
////
////  File.swift
////
////
////  Created by NMAS Amaral on 16/12/22.
////
//
//import Foundation
//import UIKit
//import Common
//import SwiftUI
//
//@available(iOS 14.0, *)
//public class LoginPersistenceCoordinator: LoginPersistenceCoordinating {
//    
//    public var childCoordinators: [Coordinator] = []
//    public var navigationController: UINavigationController
//    var tabBarController: UITabBarController
//    var container: DIContainer
//    
//    public init(navigationController: UINavigationController, tabBarController: UITabBarController, container: DIContainer) {
//        self.navigationController = navigationController
//        self.tabBarController = tabBarController
//        self.container = container
//    }
//    
//    @MainActor public func start()  {
//        let viewModel = LoginPersistenceViewModel(coordinator: self)
//        viewModel.onAppear()
//    }
//    
////    @MainActor public func isLogged(_ isLogged: Bool) {
////        if isLogged {
////            let coordinator = TabBarCoordinator(navigationController: navigationController, tabBarViewController: tabBarController, container: container)
////            coordinator.start()
////        } else {
////            let coordinator = LoginCoordinator(navigationController: navigationController, tabBarController: tabBarController, container: container)
////            coordinator.start()
////        }
////    }
//    
////    public func logout() {
////        if let loginView = navigationController.viewControllers.first(where: { $0 is LoginView<LoginViewModel> }) {
////            navigationController.popToViewController(loginView, animated: true)
////        }
////        tabBarController.tabBar.isHidden = true
////    }
//}
