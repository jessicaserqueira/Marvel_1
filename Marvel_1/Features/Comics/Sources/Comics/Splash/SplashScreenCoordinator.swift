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
        showTabBarCoordinator()
    }
    
    func showTabBarCoordinator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            let tabBarcoordinator = TabBarCoordinator(navigationController: self.navigationController, tabBarViewController: self.tabBarController, container: self.container)
            tabBarcoordinator.start()
        }
    }
}
