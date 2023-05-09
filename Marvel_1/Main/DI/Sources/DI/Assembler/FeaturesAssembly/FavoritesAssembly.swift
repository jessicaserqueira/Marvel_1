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
import Swinject

class FavoritesAssembly: Assembly {
    
    func assemble(container: Container) {
        
        let favoritesCoordinator = container.resolveSafe(FavoritesCoordinator.self)
        container.register(FavoritesCoordinating.self) {_ in favoritesCoordinator}
        container.autoregister((any FavoritesModelling).self, initializer: FavoritesViewModel.init)
        
    }
}
