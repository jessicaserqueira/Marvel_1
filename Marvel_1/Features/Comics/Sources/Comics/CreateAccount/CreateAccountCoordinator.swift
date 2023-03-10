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
public class CreateAccountCoordinator: Coordinator {
    
    public var childCoordinators: [Coordinator] = []
    public var navigationController = UINavigationController()
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
   
    public func start()  {
        #warning("Coordinator refactor")
//        let viewModel = CreateAccountModel(coordinator: self)
//        let createView = CreateAccountView(viewModel: viewModel)
//        
//        let hostingController = UIHostingController(rootView: createView)
//        navigationController.pushViewController(hostingController, animated: true)
    }
}

//// MARK: LoginCoordinating
//@available(iOS 14.0, *)
//extension CreateAccountCoordinator: CreateAccountCoordinating {
//        #warning("TODO")
//}
