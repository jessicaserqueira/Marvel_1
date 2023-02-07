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
      let splashVC = SplashScreenView()
      navigationController.pushViewController(UIHostingController(rootView: splashVC), animated: true)
            showScreenCharacter(splashVC)
  }
    
    func showScreenCharacter(_ splashVC: SplashScreenView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            let characterCoordinator = CharacterHomeCoordinator(navigationController: self.navigationController)
            characterCoordinator.start()
        }
    }
}
