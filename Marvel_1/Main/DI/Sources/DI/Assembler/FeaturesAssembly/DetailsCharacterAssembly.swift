//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 24/02/23.
//

import Foundation
import Common
import Comics
import Domain
import SwiftUI
import Swinject

class DetailsCharacterAssembly: Assembly {
    
    func assemble(container: Container) {
        
        let detailsCharacterCoordinator = container.resolveSafe(DetailsCharacterCoordinator.self)
        container.register(DetailsCharacterCoordinating.self) {_ in detailsCharacterCoordinator }
        container.autoregister((any DetailsCharacterModelling).self, initializer: DetailsCharacterViewModel.init)
        
    }
}
