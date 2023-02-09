//
//  File 2.swift
//  
//
//  Created by Jessica Serqueira on 08/02/23.
//

import Foundation
import UIKit
import Common
import SwiftUI

public protocol ComicsCoordinatorDelegate: AnyObject {
    
}

public class ComicsCoordinator{
    
    public var coordinatorDelegate: ComicsCoordinatorDelegate?
    public var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    @MainActor public func start() {
        let viewModel = ComicsViewModel(coordinator: self)
        let comicsView = ComicsView(viewModel: viewModel)
        navigationController.pushViewController(UIHostingController(rootView: comicsView), animated: false)
    }
}

extension ComicsCoordinator: ComicsCoordinating {
    
}
