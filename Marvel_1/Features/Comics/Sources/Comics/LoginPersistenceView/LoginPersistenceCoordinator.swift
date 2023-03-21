//
//  File.swift
//  
//
//  Created by NMAS Amaral on 17/03/23.
//

//
//  File.swift
//
//
//  Created by NMAS Amaral on 16/12/22.
//

import Foundation
import UIKit
import Common
import SwiftUI

@available(iOS 14.0, *)
public class LoginPersistenceCoordinator: Coordinator, LoginPersistenceCoordinating {
    
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
        let viewModel = LoginPersistenceViewModel(coordinator: self)
        let loginPersistence = LoginPersistenceView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: loginPersistence)
        navigationController.pushViewController(hostingController, animated: true)
    }
}
