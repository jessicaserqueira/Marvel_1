//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import Foundation
import UIKit
import Common
import SwiftUI

public class CharacterHomeCoordinator: Coordinator, DetailsCharacterCoordinating {
    
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    public var tabBarController: UITabBarController?
    
    public init(navigationController: UINavigationController, tabBarController: UITabBarController) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }
    
    public func start()  {
        
        let viewModel = CharacterHomeViewModel(coordinator: self)
        let characterHomeView = CharacterHomeView(viewModel: viewModel)
        
        let hostingController = UIHostingController(rootView: characterHomeView)
        hostingController.tabBarItem.title = L10n.Characters.title
        hostingController.tabBarItem.image = UIImage(named: "shield-Color")
        hostingController.tabBarItem.selectedImage = UIImage(named: "shield")
        
        navigationController.pushViewController(hostingController, animated: true)
    }
}

// MARK: CharacterHomeCoordinating
extension CharacterHomeCoordinator: CharacterHomeCoordinating {
    
    public func buttonDetails(with id: Int) {
        let viewModel = DetailsCharacterViewModel(coordinator: self)
        let screenDetailsView = DetailsCharacterView(viewModel: viewModel, selectedItemId: id)
        navigationController.modalPresentationStyle = .overFullScreen
        navigationController.present(UIHostingController(rootView: screenDetailsView), animated: true)
        
        #warning("TODO Implementar navigation sem tabBar9")
//        navigationController.pushViewController(UIHostingController(rootView: screenDetailsView), animated: true)
//        navigationController.hidesBottomBarWhenPushed = true
//        navigationController.tabBarController?.tabBar.isHidden = true
    }
}
