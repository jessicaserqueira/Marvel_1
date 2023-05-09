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
import Swinject

class DetailsComicsAssembly: Assembly {
    
    func assemble(container: Container) {
        
        let detailsComicsCoordinator = container.resolveSafe(DetailsComicsCoordinator.self)
        container.register(DetailsComicsCoordinating.self) { _ in detailsComicsCoordinator }
        container.autoregister((any DetailsComicsModelling).self, initializer: DetailsComicsViewModel.init)
        
    }
}
