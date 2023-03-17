//
//  File.swift
//  
//
//  Created by NMAS Amaral on 17/03/23.
//

import Foundation
import Common
import UIKit
import SwiftUI


@available(iOS 14.0, *)
public class ContentViewCoordinator {
    
    var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let contentView = ContentView()
        navigationController.pushViewController(UIHostingController(rootView: contentView), animated: true)
    }
}
