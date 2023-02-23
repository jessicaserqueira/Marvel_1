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

public class ComicsCoordinator: Coordinator{
    
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    public var tabBarController: UITabBarController?
    
    public init( navigationController: UINavigationController, tabBarController: UITabBarController) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }
    
    @MainActor public func start() {
        let viewModel = ComicsViewModel(coordinator: self)
        let comicsView = ComicsView(viewModel: viewModel)
        
        let hostingController = UIHostingController(rootView: comicsView)
        hostingController.tabBarItem.title = L10n.Hq.title
        hostingController.tabBarItem.image = UIImage(named: "hq")
        hostingController.tabBarItem.selectedImage = UIImage(named: "hq-Color")
        
        navigationController.pushViewController(hostingController, animated: true)
    }
}

extension ComicsCoordinator: ComicsCoordinating {
    
    public func buttonDetails() {
        let detailsComisView = DetailsComicsView()
        navigationController.present(UIHostingController(rootView: detailsComisView), animated: true)
    }
}
