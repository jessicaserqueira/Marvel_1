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
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
   
    public func start()  {
        
        let viewModel = LoginViewModel(coordinator: self)
        let loginView = LoginView(viewModel: viewModel)
        
        let hostingController = UIHostingController(rootView: loginView)
        
        navigationController.pushViewController(hostingController, animated: true)
    }
}

// MARK: LoginCoordinating
@available(iOS 14.0, *)
extension LoginCoordinator: LoginCoordinating {
        #warning("TODO")
}
