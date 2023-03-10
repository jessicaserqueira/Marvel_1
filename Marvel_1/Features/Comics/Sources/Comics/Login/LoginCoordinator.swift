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
public class LoginCoordinator: Coordinator {
    
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
//    var tabBarController: UITabBarController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
//        self.tabBarController = tabBarController
    }
    
    public func start()  {
        
#warning("Coordinator refactor")
        
//        let viewModel = LoginViewModel(coordinator: self)
//        let loginView = LoginView(viewModel: viewModel)
//        
//        let hostingController = UIHostingController(rootView: loginView)
//        
//        navigationController.pushViewController(hostingController, animated: true)
    }
}


//@available(iOS 14.0, *)
//extension LoginCoordinator: LoginCoordinating {
//
//    public func createAccount() {
//
//    }
//
//    public func showTabBarCoordinator() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
//            let tabBarcoordinator = TabBarCoordinator(navigationController: self.navigationController, tabBarViewController: self.tabBarController)
//            tabBarcoordinator.start()
//        }
//    }
//}
