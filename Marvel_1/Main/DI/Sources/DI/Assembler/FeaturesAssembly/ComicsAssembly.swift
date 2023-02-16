//
//  File.swift
//  
//
//  Created by NMAS Amaral on 23/12/22.
//

import Foundation
import Common
import Comics
import Domain
import SwiftUI

class ComicsAssembly: Assembly {
    
    func assemble(container: Common.DIContainer) {
        
        let comicsCoordinator = container.resolveSafe(ComicsCoordinator.self)
        
        container.register(type: ComicsCoordinating.self, component: comicsCoordinator)
        container.register(type: (any ComicsModelling).self,
                           component: ComicsViewModel.init(coordinator: comicsCoordinator))
        
    }
}
