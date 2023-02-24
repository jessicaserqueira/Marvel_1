//  File.swift
//
//
//  Created by NMAS Amaral on 16/12/22.
//

import Foundation
import UIKit
import Common
import SwiftUI

public protocol DetailsCharacterCoordinatorDelegate: AnyObject {}

public struct DetailsCharacterCoordinator {
    
    public var coordinatorDelegate: DetailsCharacterCoordinatorDelegate?
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let detailsCharacterView = DetailsCharacterView()
        navigationController.pushViewController(UIHostingController(rootView: detailsCharacterView), animated: false)
    }
}

// MARK: DetailsCoordinator
extension DetailsCharacterCoordinator {}

// MARK: DetailsCoordinating
extension DetailsCharacterCoordinator: DetailsCharacterCoordinating {}
