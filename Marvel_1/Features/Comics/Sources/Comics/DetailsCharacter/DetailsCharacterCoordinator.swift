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

public struct DetailsCharacterCoordinator: DetailsCharacterCoordinating {
    
    public var coordinatorDelegate: DetailsCharacterCoordinatorDelegate?
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start(selectedItemId: Int) {
        let viewModel = DetailsCharacterViewModel(coordinator: self)
        let detailsCharacterView = DetailsCharacterView(viewModel: viewModel, selectedItemId: selectedItemId)
        navigationController.pushViewController(UIHostingController(rootView: detailsCharacterView), animated: false)
    }
}
