//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/02/23.
//

import Foundation
import UIKit
import SwiftUI

public protocol SplashScreenCoordinatorDelegate: AnyObject {
    
}

public class SplashScreenCoordinator {
  var navigationController: UINavigationController

  public init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  public func start() {
      let splashView = SplashScreenView()
      navigationController.pushViewController(UIHostingController(rootView: splashView), animated: true)
            showScreenCharacter(splashView)
  }
    
    func showScreenCharacter(_ splashView: SplashScreenView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            let characterCoordinator = CharacterHomeCoordinator(navigationController: self.navigationController)
            characterCoordinator.start()
        }
    }
}
