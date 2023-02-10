//  File.swift
//
//
//  Created by NMAS Amaral on 16/12/22.
//

import Foundation
import UIKit
import Common
import SwiftUI

public protocol ScreenDetailsCoordinatorDelegate: AnyObject {}

public struct ScreenDetailsCoordinator {
    
    public var coordinatorDelegate: ScreenDetailsCoordinatorDelegate?
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
//        let viewModel = CharacterHomeViewModel(coordinator: self)
        let screenDetailsView = ScreenDetailsView()
        navigationController.pushViewController(UIHostingController(rootView: screenDetailsView), animated: false)
    }
}

// MARK: ScreenDetailsCoordinator
extension ScreenDetailsCoordinator {}

// MARK: ScreenDetailsCoordinating
extension ScreenDetailsCoordinator: ScreenDetailsCoordinating {}
