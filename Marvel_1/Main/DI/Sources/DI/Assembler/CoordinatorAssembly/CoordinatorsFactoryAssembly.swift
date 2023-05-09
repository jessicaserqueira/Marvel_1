//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import Comics
import AppNavigation
import Swinject

class CoordinatorsFactoryAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(CoordinatorFactory.self) { resolver in
            return CoordinatorFactoryImplementation(container: resolver)
            
        }
    }
    
}
