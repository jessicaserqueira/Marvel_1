//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 06/03/23.
//

import Foundation
import Common
import Comics
import Domain
import SwiftUI

class DetailsComicsAssembly: Assembly {
    
    func assemble(container: Common.DIContainer) {
        
        let detailsComicsCoordinator = container.resolveSafe(DetailsComicsCoordinator.self)
        
        container.register(type: DetailsComicsCoordinating.self, component: detailsComicsCoordinator)
        container.register(type: (any DetailsComicsModelling).self,
                           component: DetailsComicsViewModel.init(coordinator: detailsComicsCoordinator))
        
    }
}
