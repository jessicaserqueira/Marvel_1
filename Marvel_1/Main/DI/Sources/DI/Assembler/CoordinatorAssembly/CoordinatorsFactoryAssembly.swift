//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import Comics
import Common
import AppNavigation

class CoordinatorsFactoryAssembly: Assembly {

    func assemble(container: DIContainer) {
        container.register(type: CoordinatorFactory.self, component: CoordinatorFactoryImplementation(container: container))
    }
    
}
