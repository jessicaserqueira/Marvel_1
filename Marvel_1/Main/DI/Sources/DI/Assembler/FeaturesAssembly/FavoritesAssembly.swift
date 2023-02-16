//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 16/02/23.
//

import Foundation
import Common
import Comics
import Domain
import SwiftUI

class FavoritesAssembly: Assembly {
    
    func assemble(container: Common.DIContainer) {
        
        let favoritesCoordinator = container.resolveSafe(FavoritesCoordinator.self)
        
        container.register(type: FavoritesCoordinating.self, component: favoritesCoordinator)
        container.register(type: (any FavoritesModelling).self,
                           component: FavoritesViewModel.init(coordinator: favoritesCoordinator))
        
    }
}
