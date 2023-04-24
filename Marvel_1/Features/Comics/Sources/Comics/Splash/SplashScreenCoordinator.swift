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
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let splashView = SplashScreenView()
        navigationController.pushViewController(UIHostingController(rootView: splashView), animated: true)
    }
}
