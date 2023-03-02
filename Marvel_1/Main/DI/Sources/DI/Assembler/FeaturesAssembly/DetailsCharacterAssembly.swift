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

class DetailsCharacterAssembly: Assembly {
    
    func assemble(container: Common.DIContainer) {
        
        let detailsCharacterCoordinator = container.resolveSafe(DetailsCharacterCoordinator.self)
        
        container.register(type: DetailsCharacterCoordinating.self, component: detailsCharacterCoordinator)
        container.register(type: (any DetailsCharacterModelling).self,
                           component: DetailsCharacterViewModel.init(coordinator: detailsCharacterCoordinator))
        
    }
}
