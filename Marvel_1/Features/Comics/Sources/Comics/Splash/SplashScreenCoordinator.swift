//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/02/23.
//

import Foundation
import UIKit
import SwiftUI


public class SplashScreenCoordinator {
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    
    public init(navigationController: UINavigationController, tabBarController: UITabBarController) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }
    
    public func start() {
        let splashView = SplashScreenView()
        navigationController.pushViewController(UIHostingController(rootView: splashView), animated: true)
        showTabBarCoordinator()
    }
    
    func showTabBarCoordinator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            let tabBarcoordinator = TabBarCoordinator(navigationController: self.navigationController, tabBarViewController: self.tabBarController)
            tabBarcoordinator.start()
        }
    }
}
