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
import Swinject

class ComicsAssembly: Assembly {
    
    func assemble(container: Container) {
        
        let comicsCoordinator = container.resolveSafe(ComicsCoordinator.self)
        container.register(ComicsCoordinating.self) { _ in comicsCoordinator }
        container.autoregister((any ComicsModelling).self, initializer: ComicsViewModel.init)
    }
}
