//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 02/02/23.
//

import UIKit

public protocol CoordinatorDelegate: class {

    func coordinatorDidExit(_ coordinator: Coordinator)
}

public protocol Coordinator: CoordinatorDelegate {

    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

public extension Coordinator {

    public func coordinatorDidExit(_ coordinator: Coordinator) {

        guard let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) else { return }
        self.childCoordinators.remove(at: index)

    }
}
