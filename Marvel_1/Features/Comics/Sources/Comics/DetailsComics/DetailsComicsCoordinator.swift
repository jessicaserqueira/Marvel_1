//
//  File 2.swift
//  
//
//  Created by Jessica Serqueira on 23/02/23.
//

import Foundation
import UIKit
import Common
import SwiftUI

public protocol DetailsComicsCoordinatorDelegate: AnyObject {}

public struct DetailsComicsCoordinator: DetailsComicsCoordinating {
    
    public var coordinatorDelegate: DetailsComicsCoordinatorDelegate?
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start(selectedItemId: Int) {
        let viewModel = DetailsComicsViewModel(coordinator: self)
        let detailsComicsView = DetailsComicsView(viewModel: viewModel, selectedItemId: selectedItemId)
        navigationController.pushViewController(UIHostingController(rootView: detailsComicsView), animated: false)
    }
}
