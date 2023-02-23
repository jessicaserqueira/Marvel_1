//  File.swift
//
//
//  Created by NMAS Amaral on 16/12/22.
//

import Foundation
import UIKit
import Common
import SwiftUI

public protocol ScreenDetailsCharacterCoordinatorDelegate: AnyObject {}

public struct ScreenDetailsCharacterCoordinator {
    
    public var coordinatorDelegate: ScreenDetailsCharacterCoordinatorDelegate?
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let screenDetailsView = ScreenDetailsCharacterView()
        navigationController.pushViewController(UIHostingController(rootView: screenDetailsView), animated: false)
    }
}

// MARK: ScreenDetailsCoordinator
extension ScreenDetailsCharacterCoordinator {}

// MARK: ScreenDetailsCoordinating
extension ScreenDetailsCharacterCoordinator: ScreenDetailsCharacterCoordinating {}
